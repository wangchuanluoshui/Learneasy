package com.learneasy.ucenter.service;

import com.learneasy.ucenter.model.dto.AuthParamsDto;
import com.learneasy.ucenter.model.dto.LeUserExt;
import com.learneasy.ucenter.model.po.LeUser;

public interface WxAuthService {

    /**
     * @author Mr.M
     * @version 1.0
     * @description 微信认证接口,申请令牌，携带令牌查询用户信息、保存用户信息到数据库
     * @param code 授权码
     * @date 2023/8/25 8:42
     */
    public LeUser wxAuth(String code);

}

