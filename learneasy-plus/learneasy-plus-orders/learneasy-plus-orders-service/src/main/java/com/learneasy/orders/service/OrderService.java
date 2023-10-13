package com.learneasy.orders.service;

import com.learneasy.base.model.PageParams;
import com.learneasy.base.model.PageResult;
import com.learneasy.messagesdk.model.po.MqMessage;
import com.learneasy.orders.model.dto.AddOrderDto;
import com.learneasy.orders.model.dto.PayRecordDto;
import com.learneasy.orders.model.dto.PayStatusDto;
import com.learneasy.orders.model.po.LeOrders;
import com.learneasy.orders.model.po.LePayRecord;

public interface OrderService {
    /**
     * @description 创建商品订单
     * @param addOrderDto 订单信息
     * @return PayRecordDto 支付交易记录(包括二维码)
     * @author Mr.M
     */
    public PayRecordDto createOrder(String userId, AddOrderDto addOrderDto);

    /**
     * @description 查询支付交易记录
     * @param payNo  交易记录号
     * @return com.learneasy.orders.model.po.XcPayRecord
     * @author Mr.M
     */
    public LePayRecord getPayRecordByPayno(String payNo);
    /**
     * 请求支付宝查询支付结果
     * @param payNo 支付记录id
     * @return 支付记录信息
     */
    public PayRecordDto queryPayResult(String payNo);
    /**
     * @description 保存支付宝支付结果
     * @param payStatusDto  支付结果信息
     * @return void
     * @author Mr.M
     * @date 2023/9/7 16:52
     */
    public void saveAliPayStatus(PayStatusDto payStatusDto);
    /**
     * 发送通知结果
     * @param message
     */
    public void notifyPayResult(MqMessage message);

    /**
     * @description 查询方法
     * @param pageParams 分页参数
     * @author Mr.M
     */
    public PageResult<LeOrders> queryOrders(PageParams pageParams,LeOrders leOrders);
}
