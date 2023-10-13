package com.learneasy.learning.model.dto;

import com.learneasy.learning.model.po.LeCourseTables;
import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;

/**
 * @author Mr.M
 * @version 1.0
 * @description 我的课程查询条件
 */
@Data
@ToString
public class MyCourseTableItemDto extends LeCourseTables {

    /**
     * 最近学习时间
     */
    private LocalDateTime learnDate;

    /**
     * 学习时长
     */
    private Long learnLength;

    /**
     * 章节id
     */
    private Long teachplanId;

    /**
     * 章节名称
     */
    private String teachplanName;


}
