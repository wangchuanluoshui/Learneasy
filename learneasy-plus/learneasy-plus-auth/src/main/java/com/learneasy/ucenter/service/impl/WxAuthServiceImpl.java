package com.learneasy.ucenter.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.learneasy.ucenter.mapper.LeUserMapper;
import com.learneasy.ucenter.mapper.LeUserRoleMapper;
import com.learneasy.ucenter.model.dto.AuthParamsDto;
import com.learneasy.ucenter.model.dto.LeUserExt;
import com.learneasy.ucenter.model.po.LeUser;
import com.learneasy.ucenter.model.po.LeUserRole;
import com.learneasy.ucenter.service.AuthService;
import com.learneasy.ucenter.service.WxAuthService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.UUID;

@Service("wx_authservice")
public class WxAuthServiceImpl implements AuthService, WxAuthService {

    @Autowired
    LeUserMapper leUserMapper;

    @Autowired
    LeUserRoleMapper leUserRoleMapper;

    @Autowired
    WxAuthServiceImpl currentPorxy;

    @Autowired
    RestTemplate restTemplate;


    @Value("${weixin.appid}")
    String appid;
    @Value("${weixin.secret}")
    String secret;


    @Override
    public LeUserExt execute(AuthParamsDto authParamsDto) {

        //得到账号
        String username = authParamsDto.getUsername();
        //查询数据库
        LeUser user = leUserMapper.selectOne(new LambdaQueryWrapper<LeUser>().eq(LeUser::getUsername, username));
        if(user==null){
            //返回空表示用户不存在
            throw new RuntimeException("账号不存在");
        }
        LeUserExt leUserExt = new LeUserExt();
        BeanUtils.copyProperties(user,leUserExt);
        return leUserExt;
    }

    @Override
    public LeUser wxAuth(String code) {
        //收到code调用微信接口申请access_token
        Map<String, String> access_token_map = getAccess_token(code);
//        if(access_token_map==null){
//            return null;
//        }
//        System.out.println(access_token_map);
        //访问令牌
        String access_token = access_token_map.get("access_token");
        String openid = access_token_map.get("openid");
        //拿access_token查询用户信息
        Map<String, String> userinfo = getUserinfo(access_token, openid);
//        if(userinfo==null){
//            return null;
//        }
//        //添加用户到数据库
        LeUser leUser = currentPorxy.addWxUser(userinfo);

        return leUser;

    }

    @Transactional
    public LeUser addWxUser(Map<String,String> userInfo_map){
        String unionid = userInfo_map.get("unionid");
        String nickname = userInfo_map.get("nickname");
        //根据unionid查询用户信息
        LeUser leUser = leUserMapper.selectOne(new LambdaQueryWrapper<LeUser>().eq(LeUser::getWxUnionid, unionid));
        if(leUser !=null){
            return leUser;
        }
        //向数据库新增记录
        leUser = new LeUser();
        String userId= UUID.randomUUID().toString();
        leUser.setId(userId);//主键
        leUser.setUsername(unionid);
        leUser.setPassword(unionid);
        leUser.setWxUnionid(unionid);
        leUser.setNickname(nickname);
        leUser.setName(nickname);
        leUser.setUtype("101001");//学生类型
        leUser.setStatus("1");//用户状态
        leUser.setCreateTime(LocalDateTime.now());
        //插入
        int insert = leUserMapper.insert(leUser);

        //向用户角色关系表新增记录
        LeUserRole leUserRole = new LeUserRole();
        leUserRole.setId(UUID.randomUUID().toString());
        leUserRole.setUserId(userId);
        leUserRole.setRoleId("17");//学生角色
        leUserRole.setCreateTime(LocalDateTime.now());
        leUserRoleMapper.insert(leUserRole);
        return leUser;

    }

    /**
     * 携带授权码申请令牌
     * https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
     *
     * {
     * "access_token":"ACCESS_TOKEN",
     * "expires_in":7200,
     * "refresh_token":"REFRESH_TOKEN",
     * "openid":"OPENID",
     * "scope":"SCOPE",
     * "unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"
     * }
     * @param code 授权
     * @return
     */
    private Map<String,String> getAccess_token(String code){

        String url_template = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code";
        //最终的请求路径
        String url = String.format(url_template, appid, secret, code);

        //远程调用此url
        ResponseEntity<String> exchange = restTemplate.exchange(url, HttpMethod.POST, null, String.class);
        //获取响应的结果
        String result = exchange.getBody();
        //将result转成map
        Map<String,String> map = JSON.parseObject(result, Map.class);
        return map;


    }

    /**
     * 携带令牌查询用户信息
     *
     * https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID
     *
     * {
     * "openid":"OPENID",
     * "nickname":"NICKNAME",
     * "sex":1,
     * "province":"PROVINCE",
     * "city":"CITY",
     * "country":"COUNTRY",
     * "headimgurl": "https://thirdwx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0",
     * "privilege":[
     * "PRIVILEGE1",
     * "PRIVILEGE2"
     * ],
     * "unionid": " o6_bmasdasdsad6_2sgVt7hMZOPfL"
     *
     * }
     * @param access_token
     * @param openid
     * @return
     */
    private Map<String,String> getUserinfo(String access_token,String openid){

        String url_template = "https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s";
        String url = String.format(url_template, access_token, openid);

        ResponseEntity<String> exchange = restTemplate.exchange(url, HttpMethod.GET, null, String.class);

        //获取响应的结果
        String result = new String(exchange.getBody().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        //将result转成map
        Map<String,String> map = JSON.parseObject(result, Map.class);
        return map;

    }
}
