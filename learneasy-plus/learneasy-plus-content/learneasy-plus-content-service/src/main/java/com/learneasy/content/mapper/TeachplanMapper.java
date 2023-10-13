package com.learneasy.content.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.learneasy.content.model.dto.TeachplanDto;
import com.learneasy.content.model.po.Teachplan;

import java.util.List;

/**
 * <p>
 * 课程计划 Mapper 接口
 * </p>
 *
 * @author cyborg2077
 */
public interface TeachplanMapper extends BaseMapper<Teachplan> {
    List<TeachplanDto> selectTreeNodes(Long courseId);
}
