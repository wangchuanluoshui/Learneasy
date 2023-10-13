package com.learneasy.content.service;

import com.learneasy.base.model.PageParams;
import com.learneasy.base.model.PageResult;
import com.learneasy.content.model.dto.AddCourseDto;
import com.learneasy.content.model.dto.CourseBaseInfoDto;
import com.learneasy.content.model.dto.EditCourseDto;
import com.learneasy.content.model.dto.QueryCourseParamDto;
import com.learneasy.content.model.po.CourseBase;
import org.springframework.transaction.annotation.Transactional;


public interface CourseBaseInfoService {
    /**
     * 课程查询接口
     *
     * @param pageParams        分页参数
     * @param queryCourseParams 查询条件
     * @return
     */

    @Transactional
    PageResult<CourseBase> queryCourseBaseList(PageParams pageParams, QueryCourseParamDto queryCourseParams);

    /**
     * 新增课程基本信息
     *
     * @param companyId    教学机构id
     * @param addCourseDto 课程基本信息
     * @return
     */
    CourseBaseInfoDto createCourseBase(Long companyId, AddCourseDto addCourseDto);

    /**
     * 根据课程id查询课程基本信息
     * @param courseId  课程id
     * @return
     */
    CourseBaseInfoDto getCourseBaseInfo(Long courseId);

    /**
     * 修改课程信息
     * @param companyId 机构id，本机构只能修改本机构课程
     * @return
     */
    CourseBaseInfoDto updateCourseBase(Long companyId, EditCourseDto editCourseDto);

    void delectCourse(Long companyId, Long courseId);
}
