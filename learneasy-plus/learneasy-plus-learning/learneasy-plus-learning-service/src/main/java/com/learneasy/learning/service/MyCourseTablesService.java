package com.learneasy.learning.service;

import com.learneasy.base.model.PageResult;
import com.learneasy.learning.model.dto.LeChooseCourseDto;
import com.learneasy.learning.model.dto.LeCourseTablesDto;
import com.learneasy.learning.model.dto.MyCourseTableParams;
import com.learneasy.learning.model.po.LeCourseTables;

public interface MyCourseTablesService {


    public LeChooseCourseDto addChooseCourse(String userId,Long courseId);

    /**
     * @description 判断学习资格
     * @param userId
     * @param courseId
     * @return LeCourseTablesDto 学习资格状态 [{"code":"702001","desc":"正常学习"},{"code":"702002","desc":"没有选课或选课后没有支付"},{"code":"702003","desc":"已过期需要申请续期或重新支付"}]
     * @author Mr.M
     */
    public LeCourseTablesDto getLearningStatus(String userId, Long courseId);

    public boolean saveChooseCourseStauts(String chooseCourseId);

    /**
     * @description 我的课程表
     * @param params
     * @return com.learneasy.base.model.PageResult<com.xuecheng.learning.model.po.XcCourseTables>
     * @author Mr.M
     */
    public PageResult<LeCourseTables> mycourestabls(MyCourseTableParams params);
}


