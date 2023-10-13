package com.learneasy.content.api;

import com.learneasy.base.exception.ValidationGroups;
import com.learneasy.base.model.PageParams;
import com.learneasy.base.model.PageResult;
import com.learneasy.content.model.dto.AddCourseDto;
import com.learneasy.content.model.dto.CourseBaseInfoDto;
import com.learneasy.content.model.dto.EditCourseDto;
import com.learneasy.content.model.dto.QueryCourseParamDto;
import com.learneasy.content.model.po.CourseBase;
import com.learneasy.content.service.CourseBaseInfoService;
import com.learneasy.content.util.SecurityUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;



@Slf4j
@RestController
@Api(value = "课程信息编辑接口", tags = "课程信息编辑接口")
public class CourseBaseInfoController {
    @Autowired
    CourseBaseInfoService courseBaseInfoService;

    @ApiOperation("课程查询接口")
//    @PreAuthorize("hasAuthority('le_teachmanager_course_list')")//指定权限标识符,拥有此权限才可以访问此方法
    @PostMapping("/course/list")
    public PageResult<CourseBase> list(PageParams pageParams, @RequestBody(required=false) QueryCourseParamDto queryCourseParam) {
        //当前登录用户
        SecurityUtil.LeUser user = SecurityUtil.getUser();
        //用户所属机构id
//        Long companyId = null;
//        if(StringUtils.isNotEmpty(user.getCompanyId())){
//            companyId = Long.parseLong(user.getCompanyId());
//        }
        PageResult<CourseBase> courseBasePageResult = courseBaseInfoService.queryCourseBaseList(pageParams, queryCourseParam);

        return courseBasePageResult;

    }

    @ApiOperation("新增课程")
    @PostMapping("/course")
    public CourseBaseInfoDto createCourseBase(@RequestBody @Validated(ValidationGroups.Insert.class) AddCourseDto addCourseDto) {
        //获取到用户所属机构的id
        Long companyId = 1232141425L;
//        int i = 1/0;
        CourseBaseInfoDto courseBase = courseBaseInfoService.createCourseBase(companyId, addCourseDto);
        return courseBase;
    }

    @ApiOperation("根据课程id查询课程基础信息")
    @GetMapping("/course/{courseId}")
    public CourseBaseInfoDto getCourseBaseById(@PathVariable("courseId") Long courseId){
        log.info("根据课程id查询课程基础信息id:{}",courseId);
        //取出当前用户身份
//    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        SecurityUtil.LeUser user = SecurityUtil.getUser();
        System.out.println(user.getUsername());
        CourseBaseInfoDto courseBaseInfo = courseBaseInfoService.getCourseBaseInfo(courseId);
        return courseBaseInfo;
    }

    @ApiOperation("修改课程基础信息接口")
    @PutMapping("/course")
    public CourseBaseInfoDto modifyCourseBase(@RequestBody EditCourseDto editCourseDto) {
        Long companyId = 1232141425L;
        CourseBaseInfoDto courseBaseInfoDto = courseBaseInfoService.updateCourseBase(companyId, editCourseDto);
        return courseBaseInfoDto;
    }

    @ApiOperation("删除课程")
    @DeleteMapping("/course/{courseId}")
    public void deleteCourse(@PathVariable Long courseId) {
        SecurityUtil.LeUser user = SecurityUtil.getUser();
        Long companyId = 1232141425l;
        if (StringUtils.isNotEmpty(user.getCompanyId())) {
            companyId = Long.parseLong(user.getCompanyId());
        }
        courseBaseInfoService.delectCourse(companyId, courseId);
    }

}

