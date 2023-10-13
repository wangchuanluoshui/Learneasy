package com.learneasy.learning.api;

import com.learneasy.base.exception.LearnEasyPlusException;
import com.learneasy.base.model.PageResult;
import com.learneasy.learning.model.dto.MyCourseTableParams;
import com.learneasy.learning.model.dto.LeChooseCourseDto;
import com.learneasy.learning.model.dto.LeCourseTablesDto;
import com.learneasy.learning.model.po.LeCourseTables;
import com.learneasy.learning.service.MyCourseTablesService;
import com.learneasy.learning.util.SecurityUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Mr.M
 * @version 1.0
 * @description 我的课程表接口
 */

@Api(value = "我的课程表接口", tags = "我的课程表接口")
@Slf4j
@RestController
public class MyCourseTablesController {

    @Autowired
    MyCourseTablesService myCourseTablesService;

    @ApiOperation("添加选课")
    @PostMapping("/choosecourse/{courseId}")
    public LeChooseCourseDto addChooseCourse(@PathVariable("courseId") Long courseId) {

        //当前登录的用户
        SecurityUtil.LeUser user=SecurityUtil.getUser();
        if(user==null){
            LearnEasyPlusException.cast("请登录");
        }
        //用户id
        String userId=user.getId();

        //添加选课
        LeChooseCourseDto leChooseCourseDto=myCourseTablesService.addChooseCourse(userId,courseId);

        return leChooseCourseDto;
    }

    @ApiOperation("查询学习资格")
    @PostMapping("/choosecourse/learnstatus/{courseId}")
    public LeCourseTablesDto getLearnstatus(@PathVariable("courseId") Long courseId) {
        //当前登录的用户
        SecurityUtil.LeUser user = SecurityUtil.getUser();
        if(user == null){
            LearnEasyPlusException.cast("请登录");
        }
        //用户id
        String userId = user.getId();

        LeCourseTablesDto learningStatus = myCourseTablesService.getLearningStatus(userId, courseId);

        return learningStatus;


    }

    @ApiOperation("我的课程表")
    @GetMapping("/mycoursetable")
    public PageResult<LeCourseTables> mycoursetable(MyCourseTableParams params) {
       //登录用户
        SecurityUtil.LeUser user = SecurityUtil.getUser();
        if(user == null){
            LearnEasyPlusException.cast("请登录后继续选课");
        }
        String userId = user.getId();
        //设置当前的登录用户
        params.setUserId(userId);

        return myCourseTablesService.mycourestabls(params);
    }
}
