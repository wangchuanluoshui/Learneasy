package com.learneasy.ucenter.model.po;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author itcast
 */
@Data
@TableName("le_teacher")
public class LeTeacher implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 称呼
     */
    private String name;

    /**
     * 个人简介
     */
    private String intro;

    /**
     * 个人简历
     */
    private String resume;

    /**
     * 老师照片
     */
    private String pic;


}
