package com.learneasy.ucenter.service;

import com.learneasy.ucenter.model.dto.AuthParamsDto;
import com.learneasy.ucenter.model.dto.LeUserExt;

public interface AuthService {
    /**
     * @param authParamsDto 认证参数
     * @return com.learneasy.ucenter.model.po.LeUser 用户信息
     * @description 认证方法
     * @author Mr.M
     * @date 2023/8/23 12:11
     */
    LeUserExt execute(AuthParamsDto authParamsDto);



}

