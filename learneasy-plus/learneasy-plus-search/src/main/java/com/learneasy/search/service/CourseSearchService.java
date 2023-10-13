package com.learneasy.search.service;

import com.learneasy.search.dto.SearchPageResultDto;
import com.learneasy.base.model.PageParams;
import com.learneasy.search.dto.SearchCourseParamDto;
import com.learneasy.search.po.CourseIndex;

/**
 * @description 课程搜索service
 * @author Mr.M
 * @version 1.0
 */
public interface CourseSearchService {


    /**
     * @description 搜索课程列表
     * @param pageParams 分页参数
     * @param searchCourseParamDto 搜索条件
     * @return com.learneasy.base.model.PageResult<com.learneasy.search.po.CourseIndex> 课程列表
     * @author Mr.M
    */
    SearchPageResultDto<CourseIndex> queryCoursePubIndex(PageParams pageParams, SearchCourseParamDto searchCourseParamDto);

 }
