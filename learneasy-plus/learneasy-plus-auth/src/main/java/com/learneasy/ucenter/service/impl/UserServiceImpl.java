package com.learneasy.ucenter.service.impl;

import com.alibaba.fastjson.JSON;
import com.learneasy.ucenter.mapper.LeMenuMapper;
import com.learneasy.ucenter.mapper.LeUserMapper;
import com.learneasy.ucenter.model.dto.AuthParamsDto;
import com.learneasy.ucenter.model.dto.LeUserExt;
import com.learneasy.ucenter.model.po.LeMenu;
import com.learneasy.ucenter.service.AuthService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Mr.M
 * @version 1.0
 * @description TODO
 * @date 2023/8/23 10:37
 */
@Slf4j
@Component
public class UserServiceImpl implements UserDetailsService {
    @Autowired
    LeUserMapper leUserMapper;

    @Autowired
    LeMenuMapper leMenuMapper;

    @Autowired
    ApplicationContext applicationContext;



    //传入的请求认证的参数就是AuthParamsDto
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        //将传入的json转成AuthParamsDto对象
        AuthParamsDto authParamsDto = null;
        try {
            authParamsDto = JSON.parseObject(s, AuthParamsDto.class);
        } catch (Exception e) {
            throw new RuntimeException("请求认证参数不符合要求");
        }

        //认证类型，有password，wx。。。
        String authType = authParamsDto.getAuthType();


        //根据认证类型从spring容器取出指定的bean
        String beanName = authType+"_authservice";
        AuthService authService = applicationContext.getBean(beanName, AuthService.class);
        //调用统一execute方法完成认证
        LeUserExt leUserExt = authService.execute(authParamsDto);
        //封装leUserExt用户信息为UserDetails
        //根据UserDetails对象生成令牌
        UserDetails userPrincipal = getUserPrincipal(leUserExt);

        return userPrincipal;
    }

    /**
     * @description 查询用户信息
     * @param leUser  用户id，主键
     * @return com.learneasy.ucenter.model.po.LeUser 用户信息
     * @author Mr.M
     */
    public UserDetails getUserPrincipal(LeUserExt leUser){
        String password = leUser.getPassword();
        //根据用户的Id查询用户的权限
        List<LeMenu> leMenus =leMenuMapper.selectPermissionByUserId(leUser.getId());
        List<String> permissions = new ArrayList<>();
        if(leMenus.size()<=0){
            //用户权限,如果不加则报Cannot pass a null GrantedAuthority collection
            permissions.add("p1");
        }else{
            leMenus.forEach(menu->{
                permissions.add(menu.getCode());
            });
        }
        //将用户权限放在LeUserExt中
        leUser.setPermissions(permissions);

        //为了安全在令牌中不放密码
        leUser.setPassword(null);
        //将user对象转json
        String userString = JSON.toJSONString(leUser);
        String[] authorities = permissions.toArray(new String[0]);
        UserDetails userDetails = User.withUsername(userString).password(password).authorities(authorities).build();
        return userDetails;

    }

}
