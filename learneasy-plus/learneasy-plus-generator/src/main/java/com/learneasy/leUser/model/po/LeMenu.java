package com.learneasy.system.model.po;

import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 * <p>
 * 
 * </p>
 *
 * @author itcast
 */
@Data
@TableName("le_menu")
public class LeMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;

    /**
     * 菜单编码
     */
    private String code;

    /**
     * 路由
     */
    private String path;

    /**
     * 父菜单ID
     */
    private String pId;

    /**
     * 名称
     */
    private String name;

    /**
     * 请求地址
     */
    private String url;

    /**
     * 是否是菜单
     */
    private String isMenu;

    /**
     * 菜单层级
     */
    private Integer level;

    /**
     * 菜单排序
     */
    private Integer sort;

    private String status;

    /**
     * 图标
     */
    private String icon;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    /**
     * 组件路径
     */
    private String component;

    /**
     * 是否隐藏
     */
    private Boolean hidden;

    /**
     * 重定向
     */
    private String redirect;

    /**
     * 是否缓存
     */
    private Boolean cache;


}
