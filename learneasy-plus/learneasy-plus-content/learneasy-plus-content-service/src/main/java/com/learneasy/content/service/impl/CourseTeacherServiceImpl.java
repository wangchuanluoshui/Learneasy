package com.learneasy.content.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.learneasy.base.exception.LearnEasyPlusException;
import com.learneasy.content.mapper.CourseTeacherMapper;
import com.learneasy.content.model.po.CourseTeacher;
import com.learneasy.content.service.CourseTeacherService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Service
public class CourseTeacherServiceImpl implements CourseTeacherService {
    @Autowired
    private CourseTeacherMapper courseTeacherMapper;

    @Override
    public List<CourseTeacher> getCourseTeacherList(Long courseId) {
        // SELECT * FROM course_teacher WHERE course_id = 117
        LambdaQueryWrapper<CourseTeacher> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CourseTeacher::getCourseId, courseId);
        List<CourseTeacher> courseTeachers = courseTeacherMapper.selectList(queryWrapper);
        return courseTeachers;
    }

    @Transactional
    @Override
    public CourseTeacher saveCourseTeacher(CourseTeacher courseTeacher) {
        Long id = courseTeacher.getId();
        if (id == null) {
            // id为null，新增教师
            CourseTeacher teacher = new CourseTeacher();
            BeanUtils.copyProperties(courseTeacher, teacher);
            teacher.setCreateDate(LocalDateTime.now());
            int flag = courseTeacherMapper.insert(teacher);
            if (flag <= 0)
                LearnEasyPlusException.cast("新增失败");
            return getCourseTeacher(teacher);
        } else {
            // id不为null，修改教师
            CourseTeacher teacher = courseTeacherMapper.selectById(id);
            BeanUtils.copyProperties(courseTeacher, teacher);
            int flag = courseTeacherMapper.updateById(teacher);
            if (flag <= 0)
                LearnEasyPlusException.cast("修改失败");
            return getCourseTeacher(teacher);
        }
    }

    @Override
    public void deleteCourseTeacher(Long courseId, Long teacherId) {
        LambdaQueryWrapper<CourseTeacher> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CourseTeacher::getId, teacherId);
        queryWrapper.eq(CourseTeacher::getCourseId, courseId);
        int flag = courseTeacherMapper.delete(queryWrapper);
        if (flag < 0)
            LearnEasyPlusException.cast("删除失败");
    }

    public CourseTeacher getCourseTeacher(CourseTeacher courseTeacher) {
        return courseTeacherMapper.selectById(courseTeacher.getId());
    }
}
