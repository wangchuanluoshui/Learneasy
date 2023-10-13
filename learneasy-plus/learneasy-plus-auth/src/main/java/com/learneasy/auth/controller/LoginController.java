package com.learneasy.auth.controller;

import com.learneasy.ucenter.mapper.LeUserMapper;
import com.learneasy.ucenter.model.po.LeUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Mr.M
 * @version 1.0
 * @description 测试controller
 */
@Slf4j
@RestController
public class LoginController {

    @Autowired
    LeUserMapper userMapper;


    @RequestMapping("/login-success")
    public String loginSuccess() {

        return "登录成功";
    }


    @RequestMapping("/user/{id}")
    public LeUser getuser(@PathVariable("id") String id) {
        LeUser leUser = userMapper.selectById(id);
        return leUser;
    }

    @RequestMapping("/r/r1")
    @PreAuthorize("hasAuthority('p1')")//拥有p1权限方可访问
    public String r1() {
        return "访问r1资源";
    }

    @RequestMapping("/r/r2")
    @PreAuthorize("hasAuthority('p2')")//拥有p2权限方可访问
    public String r2() {
        return "访问r2资源";
    }



}
