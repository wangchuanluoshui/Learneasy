package com.learneasy.content.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.learneasy.content.model.dto.CourseCategoryTreeDto;
import com.learneasy.content.model.po.CourseCategory;

import java.util.List;

/**
 * <p>
 * 课程分类 Mapper 接口
 * </p>
 *
 * @author cyborg2077
 */
public interface CourseCategoryMapper extends BaseMapper<CourseCategory> {
    List<CourseCategoryTreeDto> selectTreeNodes(String rootId);
}
