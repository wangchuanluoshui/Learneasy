package com.learneasy.orders.model.dto;

import com.learneasy.orders.model.po.LePayRecord;
import lombok.Data;
import lombok.ToString;

/**
 * @author Mr.M
 * @version 1.0
 * @description 支付记录dto
 */
@Data
@ToString
public class PayRecordDto extends LePayRecord {

    //二维码
    private String qrcode;

}
