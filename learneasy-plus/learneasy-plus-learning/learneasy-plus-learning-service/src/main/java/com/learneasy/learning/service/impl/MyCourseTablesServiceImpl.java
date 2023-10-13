package com.learneasy.learning.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.learneasy.base.exception.LearnEasyPlusException;
import com.learneasy.base.model.PageResult;
import com.learneasy.content.model.po.CoursePublish;
import com.learneasy.learning.feignclient.ContentServiceClient;
import com.learneasy.learning.mapper.LeChooseCourseMapper;
import com.learneasy.learning.mapper.LeCourseTablesMapper;
import com.learneasy.learning.model.dto.LeChooseCourseDto;
import com.learneasy.learning.model.dto.LeCourseTablesDto;
import com.learneasy.learning.model.dto.MyCourseTableParams;
import com.learneasy.learning.model.po.LeChooseCourse;
import com.learneasy.learning.model.po.LeCourseTables;
import com.learneasy.learning.service.MyCourseTablesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Service
public class MyCourseTablesServiceImpl implements MyCourseTablesService {

    @Autowired
    LeChooseCourseMapper chooseCourseMapper;

    @Autowired
    LeCourseTablesMapper courseTablesMapper;

    @Autowired
    ContentServiceClient contentServiceClient;

    @Transactional
    @Override
    public LeChooseCourseDto addChooseCourse(String userId, Long courseId) {

        //远程调用内容管理服务查询课程的收费规则
        CoursePublish coursepublish = contentServiceClient.getCoursepublish(courseId);
        if(coursepublish==null){
            LearnEasyPlusException.cast("课程不存在");
        }
        //课程收费标准
        String charge = coursepublish.getCharge();
        //选课记录
        LeChooseCourse chooseCourse=null;
        if("201000".equals(charge)){//免费课程
            //向选课记录表写
            chooseCourse=addFreeCoruse(userId,coursepublish);
            //向我的课程表写
            LeCourseTables courseTables=addCourseTabls(chooseCourse);
        }else {
            //收费课程，会向选课记录表写数据
            chooseCourse=addChargeCoruse(userId,coursepublish);
        }

        //判断学生的学习资格
        LeCourseTablesDto leCourseTablesDto=getLearningStatus(userId,courseId);
        //构造返回值
        LeChooseCourseDto leChooseCourseDto=new LeChooseCourseDto();
        BeanUtils.copyProperties(chooseCourse,leChooseCourseDto);
        //设置学习资格状态
        leChooseCourseDto.setLearnStatus(leCourseTablesDto.getLearnStatus());
        return leChooseCourseDto;
    }

    @Override
    public LeCourseTablesDto getLearningStatus(String userId, Long courseId) {
        LeCourseTablesDto leCourseTablesDto = new LeCourseTablesDto();
        //查询我的课程表
        LeCourseTables leCourseTables = getLeCourseTables(userId, courseId);
        if(leCourseTables==null){
            //没有选课或选课后没有支付
            leCourseTablesDto.setLearnStatus("702002");
            return leCourseTablesDto;
        }
        //如果查到了，判断是否过期，如果过期不能继续学习，没有过期可以继续学习
        boolean before = leCourseTables.getValidtimeEnd().isBefore(LocalDateTime.now());
        if(before){
            //"code":"702003","desc":"已过期需要申请续期或重新支付"
            BeanUtils.copyProperties(leCourseTables,leCourseTablesDto);
            leCourseTablesDto.setLearnStatus("702003");
            return leCourseTablesDto;
        }else{
            //"code":"702001","desc":"正常学习"
            BeanUtils.copyProperties(leCourseTables,leCourseTablesDto);
            leCourseTablesDto.setLearnStatus("702001");
            return leCourseTablesDto;
        }

    }

    @Override
    public boolean saveChooseCourseStauts(String chooseCourseId) {
        //根据选课id查询选课表
        LeChooseCourse chooseCourse = chooseCourseMapper.selectById(chooseCourseId);
        if(chooseCourse == null){
            log.debug("接收购买课程的消息，根据选课id从数据库找不到选课记录,选课id:{}",chooseCourseId);
            return false;
        }
        //选课状态
        String status = chooseCourse.getStatus();
        //只有当未支付时才更新为已支付
        if("701002".equals(status)){
            //更新选课记录的状态为支付成功
            chooseCourse.setStatus("701001");
            int i = chooseCourseMapper.updateById(chooseCourse);
            if(i<=0){
                log.debug("添加选课记录失败:{}",chooseCourse);
                LearnEasyPlusException.cast("添加选课记录失败");
            }

            //向我的课程表插入记录
            LeCourseTables xcCourseTables = addCourseTabls(chooseCourse);
            return true;
        }


        return false;
    }

    @Override
    public PageResult<LeCourseTables> mycourestabls(MyCourseTableParams params) {
        //页码
        long pageNo = params.getPage();
        //每页记录数,固定为4
        long pageSize = 4;
        //分页条件
        Page<LeCourseTables> page = new Page<>(pageNo, pageSize);
        //根据用户id查询
        String userId = params.getUserId();
        LambdaQueryWrapper<LeCourseTables> lambdaQueryWrapper = new LambdaQueryWrapper<LeCourseTables>().eq(LeCourseTables::getUserId, userId);

        //分页查询
        Page<LeCourseTables> pageResult = courseTablesMapper.selectPage(page, lambdaQueryWrapper);
        List<LeCourseTables> records = pageResult.getRecords();
        //记录总数
        long total = pageResult.getTotal();
        PageResult<LeCourseTables> courseTablesResult = new PageResult<>(records, total, pageNo, pageSize);
        return courseTablesResult;

    }


    //添加免费课程,免费课程加入选课记录表、我的课程表
    public LeChooseCourse addFreeCoruse(String userId, CoursePublish coursepublish) {
        Long courseId = coursepublish.getId();
        //如果存在免费的选课记录，且选课的状态为成功，直接返回
        LambdaQueryWrapper<LeChooseCourse> queryWrapper = new LambdaQueryWrapper<LeChooseCourse>().eq(LeChooseCourse::getUserId, userId)
                .eq(LeChooseCourse::getCourseId, courseId)
                .eq(LeChooseCourse::getOrderType, "700001")//免费课程
                .eq(LeChooseCourse::getStatus, "701001");//选课成功
        List<LeChooseCourse> leChooseCourses = chooseCourseMapper.selectList(queryWrapper);
        if (leChooseCourses.size() > 0) {
            return leChooseCourses.get(0);
        }

        //向选课记录表写数据
        LeChooseCourse chooseCourse = new LeChooseCourse();
        chooseCourse.setCourseId(courseId);
        chooseCourse.setCourseName(coursepublish.getName());
        chooseCourse.setUserId(userId);
        chooseCourse.setCompanyId(coursepublish.getCompanyId());
        chooseCourse.setOrderType("700001");//免费课程
        chooseCourse.setCreateDate(LocalDateTime.now());
        chooseCourse.setCoursePrice(coursepublish.getPrice());
        chooseCourse.setValidDays(365);
        chooseCourse.setStatus("701001");//选课成功
        chooseCourse.setValidtimeStart(LocalDateTime.now());//有效期的开始时间
        chooseCourse.setValidtimeEnd(LocalDateTime.now().plusDays(365));//有效期的结束时间

        int insert = chooseCourseMapper.insert(chooseCourse);
        if(insert<=0){
            LearnEasyPlusException.cast("添加选课记录失败");
        }

        return chooseCourse;
    }
    //添加到我的课程表
    public LeCourseTables addCourseTabls(LeChooseCourse xcChooseCourse){

        //选课成功了才可以向我的课程表添加
        String status = xcChooseCourse.getStatus();
        if(!"701001".equals(status)){
            LearnEasyPlusException.cast("选课没有成功无法添加到课程表");
        }
        LeCourseTables leCourseTables = getLeCourseTables(xcChooseCourse.getUserId(), xcChooseCourse.getCourseId());
        if(leCourseTables!=null){
            return leCourseTables;
        }

        leCourseTables = new LeCourseTables();
        BeanUtils.copyProperties(xcChooseCourse,leCourseTables);
        leCourseTables.setChooseCourseId(xcChooseCourse.getId());//记录选课表的逐渐
        leCourseTables.setCourseType(xcChooseCourse.getOrderType());//选课类型
        leCourseTables.setUpdateDate(LocalDateTime.now());
        int insert = courseTablesMapper.insert(leCourseTables);
        if(insert<=0){
            LearnEasyPlusException.cast("添加我的课程表失败");
        }

        return leCourseTables;
    }

    /**
     * @description 根据课程和用户查询我的课程表中某一门课程
     * @param userId
     * @param courseId
     * @return com.learneasy.learning.model.po.LeCourseTables
     * @author Mr.M
     */
    public LeCourseTables getLeCourseTables(String userId,Long courseId){
        LeCourseTables leCourseTables = courseTablesMapper.selectOne(new LambdaQueryWrapper<LeCourseTables>()
                .eq(LeCourseTables::getUserId, userId)
                .eq(LeCourseTables::getCourseId, courseId));
        return leCourseTables;

    }
    //添加收费课程
    public LeChooseCourse addChargeCoruse(String userId,CoursePublish coursepublish){

        //如果存在待支付交易记录直接返回
        LambdaQueryWrapper<LeChooseCourse> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper = queryWrapper.eq(LeChooseCourse::getUserId, userId)
                .eq(LeChooseCourse::getCourseId, coursepublish.getId())
                .eq(LeChooseCourse::getOrderType, "700002")//收费订单
                .eq(LeChooseCourse::getStatus, "701002");//待支付
        List<LeChooseCourse> leChooseCourses = chooseCourseMapper.selectList(queryWrapper);
        if (leChooseCourses != null && leChooseCourses.size()>0) {
            return leChooseCourses.get(0);
        }

        LeChooseCourse leChooseCourse = new LeChooseCourse();
        leChooseCourse.setCourseId(coursepublish.getId());
        leChooseCourse.setCourseName(coursepublish.getName());
        leChooseCourse.setCoursePrice(coursepublish.getPrice());
        leChooseCourse.setUserId(userId);
        leChooseCourse.setCompanyId(coursepublish.getCompanyId());
        leChooseCourse.setOrderType("700002");//收费课程
        leChooseCourse.setCreateDate(LocalDateTime.now());
        leChooseCourse.setStatus("701002");//待支付

        leChooseCourse.setValidDays(coursepublish.getValidDays());
        leChooseCourse.setValidtimeStart(LocalDateTime.now());
        leChooseCourse.setValidtimeEnd(LocalDateTime.now().plusDays(coursepublish.getValidDays()));
        chooseCourseMapper.insert(leChooseCourse);
        return leChooseCourse;
    }

}
