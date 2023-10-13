package com.learneasy.orders.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.learneasy.base.exception.LearnEasyPlusException;
import com.learneasy.base.model.PageParams;
import com.learneasy.base.model.PageResult;
import com.learneasy.base.utils.IdWorkerUtils;
import com.learneasy.base.utils.QRCodeUtil;
import com.learneasy.messagesdk.model.po.MqMessage;
import com.learneasy.messagesdk.service.MqMessageService;
import com.learneasy.orders.config.AlipayConfig;
import com.learneasy.orders.config.PayNotifyConfig;
import com.learneasy.orders.mapper.LeOrdersGoodsMapper;
import com.learneasy.orders.mapper.LeOrdersMapper;
import com.learneasy.orders.mapper.LePayRecordMapper;
import com.learneasy.orders.model.dto.AddOrderDto;
import com.learneasy.orders.model.dto.PayRecordDto;
import com.learneasy.orders.model.dto.PayStatusDto;
import com.learneasy.orders.model.po.LeOrders;
import com.learneasy.orders.model.po.LeOrdersGoods;
import com.learneasy.orders.model.po.LePayRecord;
import com.learneasy.orders.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.core.MessageDeliveryMode;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    LeOrdersMapper ordersMapper;

    @Autowired
    LeOrdersGoodsMapper ordersGoodsMapper;

    @Autowired
    LePayRecordMapper payRecordMapper;

    @Autowired
    OrderServiceImpl currentProxy;

    @Autowired
    MqMessageService mqMessageService;

    @Autowired
    RabbitTemplate rabbitTemplate;


    @Value("${pay.qrcodeurl}")
    String qrcodeurl;

    @Value("${pay.alipay.APP_ID}")
    String APP_ID;
    @Value("${pay.alipay.APP_PRIVATE_KEY}")
    String APP_PRIVATE_KEY;

    @Value("${pay.alipay.ALIPAY_PUBLIC_KEY}")
    String ALIPAY_PUBLIC_KEY;

    @Transactional
    @Override
    public PayRecordDto createOrder(String userId, AddOrderDto addOrderDto) {

        //插入订单表,订单主表，订单明细表
        LeOrders leOrders = saveLeOrders(userId, addOrderDto);
        if(leOrders==null){
            LearnEasyPlusException.cast("订单创建失败");
        }
        if(leOrders.getStatus().equals("600002")){
            LearnEasyPlusException.cast("订单已支付");
        }
        //插入支付记录
        LePayRecord payRecord = createPayRecord(leOrders);
        Long payNo = payRecord.getPayNo();

        //生成二维码
        QRCodeUtil qrCodeUtil = new QRCodeUtil();
        //支付二维码的url
        String url = String.format(qrcodeurl, payNo);
        //二维码图片
        String qrCode = null;
        try {
            qrCode = qrCodeUtil.createQRCode(url, 200, 200);
        } catch (IOException e) {
            LearnEasyPlusException.cast("生成二维码出错");
        }

        PayRecordDto payRecordDto = new PayRecordDto();
        BeanUtils.copyProperties(payRecord,payRecordDto);
        payRecordDto.setQrcode(qrCode);

        return payRecordDto;
    }
    @Override
    public LePayRecord getPayRecordByPayno(String payNo) {
        LePayRecord lePayRecord = payRecordMapper.selectOne(new LambdaQueryWrapper<LePayRecord>().eq(LePayRecord::getPayNo, payNo));
        return lePayRecord;
    }

    @Override
    public PayRecordDto queryPayResult(String payNo) {
        LePayRecord payRecord = getPayRecordByPayno(payNo);
        if (payRecord == null) {
            LearnEasyPlusException.cast("请重新点击支付获取二维码");
        }
        //支付状态
        String status = payRecord.getStatus();
        //如果支付成功直接返回
        if ("601002".equals(status)) {
            PayRecordDto payRecordDto = new PayRecordDto();
            BeanUtils.copyProperties(payRecord, payRecordDto);
            return payRecordDto;
        }
        //从支付宝查询支付结果
        PayStatusDto payStatusDto = queryPayResultFromAlipay(payNo);
        //保存支付结果
        currentProxy.saveAliPayStatus(payStatusDto);
        //重新查询支付记录
        payRecord = getPayRecordByPayno(payNo);
        PayRecordDto payRecordDto = new PayRecordDto();
        BeanUtils.copyProperties(payRecord, payRecordDto);
        return payRecordDto;

    }
    /**
     * 请求支付宝查询支付结果
     * @param payNo 支付交易号
     * @return 支付结果
     */
    public PayStatusDto queryPayResultFromAlipay(String payNo){
        //========请求支付宝查询支付结果=============
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL, APP_ID, APP_PRIVATE_KEY, "json", AlipayConfig.CHARSET, ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE); //获得初始化的AlipayClient
        AlipayTradeQueryRequest request = new AlipayTradeQueryRequest();
        JSONObject bizContent = new JSONObject();
        bizContent.put("out_trade_no", payNo);
        request.setBizContent(bizContent.toString());
        AlipayTradeQueryResponse response = null;
        try {
            response = alipayClient.execute(request);
            if (!response.isSuccess()) {
                LearnEasyPlusException.cast("请求支付查询查询失败");
            }
        } catch (AlipayApiException e) {
            log.error("请求支付宝查询支付结果异常:{}", e.toString(), e);
            LearnEasyPlusException.cast("请求支付查询查询失败");
        }

        //获取支付结果
        String resultJson = response.getBody();
        //转map
        Map resultMap = JSON.parseObject(resultJson, Map.class);
        Map alipay_trade_query_response = (Map) resultMap.get("alipay_trade_query_response");
        //支付结果
        String trade_status = (String) alipay_trade_query_response.get("trade_status");
        String total_amount = (String) alipay_trade_query_response.get("total_amount");
        String trade_no = (String) alipay_trade_query_response.get("trade_no");
        //保存支付结果
        PayStatusDto payStatusDto = new PayStatusDto();
        payStatusDto.setOut_trade_no(payNo);
        payStatusDto.setTrade_status(trade_status);
        payStatusDto.setApp_id(APP_ID);
        payStatusDto.setTrade_no(trade_no);
        payStatusDto.setTotal_amount(total_amount);
        return payStatusDto;

    }
    /**
     * @description 保存支付宝支付结果
     * @param payStatusDto  支付结果信息
     * @return void
     * @author Mr.M
     * @date 2023/9/7 15:57
     */
    public void saveAliPayStatus(PayStatusDto payStatusDto){
        //支付记录号
        String payNO = payStatusDto.getOut_trade_no();
        LePayRecord payRecordByPayno = getPayRecordByPayno(payNO);
        if(payRecordByPayno == null){
            LearnEasyPlusException.cast("找不到相关的支付记录");
        }
        //拿到相关联的订单id
        Long orderId = payRecordByPayno.getOrderId();
        LeOrders leOrders = ordersMapper.selectById(orderId);
        if(leOrders == null){
            LearnEasyPlusException.cast("找不到相关联的订单");
        }
        //支付状态
        String statusFromDb = payRecordByPayno.getStatus();
        //如果数据库支付的状态已经是成功了，不再处理了
        if("601002".equals(statusFromDb)){
            return ;
        }

        //如果支付成功
        String trade_status = payStatusDto.getTrade_status();//从支付宝查询到的支付结果
        if(trade_status.equals("TRADE_SUCCESS")){//支付宝返回的信息为支付成功
            //更新支付记录表的状态为支付成功
            payRecordByPayno.setStatus("601002");
            //支付宝的订单号
            payRecordByPayno.setOutPayNo(payStatusDto.getTrade_no());
            //第三方支付渠道编号
            payRecordByPayno.setOutPayChannel("Alipay");
            //支付成功时间
            payRecordByPayno.setPaySuccessTime(LocalDateTime.now());
            payRecordMapper.updateById(payRecordByPayno);

            //更新订单表的状态为支付成功
            leOrders.setStatus("600002");//订单状态为交易成功
            ordersMapper.updateById(leOrders);

            //将消息写到数据库
            MqMessage mqMessage = mqMessageService.addMessage("payresult_notify", leOrders.getOutBusinessId(), leOrders.getOrderType(), null);
            //发送消息
            notifyPayResult(mqMessage);

        }




    }



    //创建支付交易记录
    public LePayRecord createPayRecord(LeOrders leOrders) {
        if(leOrders==null){
            LearnEasyPlusException.cast("订单不存在");
        }
        if(leOrders.getStatus().equals("600002")){
            LearnEasyPlusException.cast("订单已支付");
        }
        LePayRecord payRecord = new LePayRecord();
        //生成支付交易流水号
        long payNo = IdWorkerUtils.getInstance().nextId();
        payRecord.setPayNo(payNo);
        payRecord.setOrderId(leOrders.getId());//商品订单号
        payRecord.setOrderName(leOrders.getOrderName());
        payRecord.setTotalPrice(leOrders.getTotalPrice());
        payRecord.setCurrency("CNY");
        payRecord.setCreateDate(LocalDateTime.now());
        payRecord.setStatus("601001");//未支付
        payRecord.setUserId(leOrders.getUserId());
        payRecordMapper.insert(payRecord);
        return payRecord;

    }

    @Transactional
    public LeOrders saveLeOrders(String userId,AddOrderDto addOrderDto){
        //幂等性处理
        LeOrders order = getOrderByBusinessId(addOrderDto.getOutBusinessId());
        if(order!=null){
            return order;
        }
        order = new LeOrders();
        //生成订单号
        long orderId = IdWorkerUtils.getInstance().nextId();
        order.setId(orderId);
        order.setTotalPrice(addOrderDto.getTotalPrice());
        order.setCreateDate(LocalDateTime.now());
        order.setStatus("600001");//未支付
        order.setUserId(userId);
        order.setOrderType(addOrderDto.getOrderType());
        order.setOrderName(addOrderDto.getOrderName());
        order.setOrderDetail(addOrderDto.getOrderDetail());
        order.setOrderDescrip(addOrderDto.getOrderDescrip());
        order.setOutBusinessId(addOrderDto.getOutBusinessId());//选课记录id
        ordersMapper.insert(order);
        String orderDetailJson = addOrderDto.getOrderDetail();
        List<LeOrdersGoods> xcOrdersGoodsList = JSON.parseArray(orderDetailJson, LeOrdersGoods.class);
        xcOrdersGoodsList.forEach(goods->{
            LeOrdersGoods leOrdersGoods = new LeOrdersGoods();
            BeanUtils.copyProperties(goods,leOrdersGoods);
            leOrdersGoods.setOrderId(orderId);//订单号
            ordersGoodsMapper.insert(leOrdersGoods);
        });
        return order;
    }

    public LeOrders getOrderByBusinessId(String outBusinessId) {
        LeOrders orders = ordersMapper.selectOne(new LambdaQueryWrapper<LeOrders>().eq(LeOrders::getOutBusinessId, outBusinessId));
        return orders;
    }

    @Override
    public void notifyPayResult(MqMessage message) {

        //1、消息体，转json
        String msg = JSON.toJSONString(message);
        //设置消息持久化
        Message msgObj = MessageBuilder.withBody(msg.getBytes(StandardCharsets.UTF_8))
                .setDeliveryMode(MessageDeliveryMode.PERSISTENT)
                .build();
        // 2.全局唯一的消息ID，需要封装到CorrelationData中
        CorrelationData correlationData = new CorrelationData(message.getId().toString());
        // 3.添加callback
        correlationData.getFuture().addCallback(
                result -> {
                    if(result.isAck()){
                        // 3.1.ack，消息成功
                        log.debug("通知支付结果消息发送成功, ID:{}", correlationData.getId());
                        //删除消息表中的记录
                        mqMessageService.completed(message.getId());
                    }else{
                        // 3.2.nack，消息失败
                        log.error("通知支付结果消息发送失败, ID:{}, 原因{}",correlationData.getId(), result.getReason());
                    }
                },
                ex -> log.error("消息发送异常, ID:{}, 原因{}",correlationData.getId(),ex.getMessage())
        );
        // 发送消息
        rabbitTemplate.convertAndSend(PayNotifyConfig.PAYNOTIFY_EXCHANGE_FANOUT, "", msgObj,correlationData);

    }


    @Override
    public PageResult<LeOrders> queryOrders(PageParams pageParams,LeOrders leOrders) {

        //构建查询条件对象
        LambdaQueryWrapper<LeOrders> queryWrapper = new LambdaQueryWrapper<>();
//        queryWrapper.like(!StringUtils.isEmpty(queryMediaParamsDto.getFilename()), MediaFiles::getFilename, queryMediaParamsDto.getFilename());
//        queryWrapper.eq(!StringUtils.isEmpty(queryMediaParamsDto.getFileType()), MediaFiles::getFileType, queryMediaParamsDto.getFileType());
        //分页对象
        Page<LeOrders> page = new Page<>(pageParams.getPageNo(), pageParams.getPageSize());
        // 查询数据内容获得结果
        Page<LeOrders> pageResult = ordersMapper.selectPage(page, queryWrapper);
        // 获取数据列表
        List<LeOrders> list = pageResult.getRecords();
        // 获取数据总数
        long total = pageResult.getTotal();
        // 构建结果集
        PageResult<LeOrders> mediaListResult = new PageResult<>(list, total, pageParams.getPageNo(), pageParams.getPageSize());
        return mediaListResult;

    }

}

