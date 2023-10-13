package com.learneasy.checkcode.service;

import com.learneasy.checkcode.model.CheckCodeParamsDto;
import com.learneasy.checkcode.model.CheckCodeResultDto;

/**
 * @author Mr.M
 * @version 1.0
 * @description 验证码接口
 */
public interface CheckCodeService {


    /**
     * @description 生成验证码
     * @param checkCodeParamsDto 生成验证码参数
     * @return com.learneasy.checkcode.model.CheckCodeResultDto 验证码结果
     * @author Mr.M
    */
     CheckCodeResultDto generate(CheckCodeParamsDto checkCodeParamsDto);

     /**
      * @description 校验验证码
      * @param key
      * @param code
      * @return boolean
     */
    public boolean verify(String key, String code);


    /**
     * @description 验证码生成器
     * @author Mr.M
    */
    public interface CheckCodeGenerator{
        /**
         * 验证码生成
         * @return 验证码
         */
        String generate(int length);
        

    }

    /**
     * @description key生成器
     * @author Mr.M
     */
    public interface KeyGenerator{

        /**
         * key生成
         * @return 验证码
         */
        String generate(String prefix);
    }


    /**
     * @description 验证码存储
     * @author Mr.M
     */
    public interface CheckCodeStore{

        /**
         * @description 向缓存设置key
         * @param key key
         * @param value value
         * @param expire 过期时间,单位秒
         * @return void
         * @author Mr.M
        */
        void set(String key, String value, Integer expire);

        String get(String key);

        void remove(String key);
    }
}
