package com.learneasy.ucenter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.learneasy.ucenter.feignclient.CheckCodeClient;
import com.learneasy.ucenter.mapper.LeUserMapper;
import com.learneasy.ucenter.model.dto.AuthParamsDto;
import com.learneasy.ucenter.model.dto.LeUserExt;
import com.learneasy.ucenter.model.po.LeUser;
import com.learneasy.ucenter.service.AuthService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * @author Mr.M
 * @version 1.0
 * @description 账号名密码方式
 */
@Service("password_authservice")
public class PasswordAuthServiceImpl implements AuthService {

    @Autowired
    LeUserMapper leUserMapper;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    CheckCodeClient checkCodeClient;

    @Override
    public LeUserExt execute(AuthParamsDto authParamsDto) {

        //校验验证码
        String checkcode = authParamsDto.getCheckcode();
        String checkcodekey = authParamsDto.getCheckcodekey();

        if(StringUtils.isBlank(checkcodekey) || StringUtils.isBlank(checkcode)){
            throw new RuntimeException("验证码为空");

        }
        Boolean verify = checkCodeClient.verify(checkcodekey, checkcode);
        if(!verify){
            throw new RuntimeException("验证码输入错误");
        }

        //账号
        String username = authParamsDto.getUsername();
        //根据username账号查询数据库
        LeUser leUser = leUserMapper.selectOne(new LambdaQueryWrapper<LeUser>().eq(LeUser::getUsername, username));

        //查询到用户不存在，要返回null即可，spring security框架抛出异常用户不存在
        if(leUser==null){
            throw new RuntimeException("账号不存在");
        }

        //验证密码是否正确
        //如果查到了用户拿到正确的密码
        String passwordDb = leUser.getPassword();
        //拿 到用户输入的密码
        String passwordForm = authParamsDto.getPassword();
        //校验密码
        boolean matches = passwordEncoder.matches(passwordForm, passwordDb);
        if(!matches){
            throw new RuntimeException("账号或密码错误");
        }
        LeUserExt leUserExt = new LeUserExt();
        BeanUtils.copyProperties(leUser,leUserExt);

        return leUserExt;
    }
}
