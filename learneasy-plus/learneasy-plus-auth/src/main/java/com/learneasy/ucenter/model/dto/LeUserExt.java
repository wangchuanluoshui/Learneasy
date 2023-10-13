package com.learneasy.ucenter.model.dto;

import com.learneasy.ucenter.model.po.LeUser;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @description 用户扩展信息
 * @author Mr.M
 * @version 1.0
 */
@Data
public class LeUserExt extends LeUser {
    //用户权限
    List<String> permissions = new ArrayList<>();
}
