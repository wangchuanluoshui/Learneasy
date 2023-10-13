package com.learneasy.content.service;

import com.learneasy.content.model.dto.CoursePreviewDto;
import com.learneasy.content.model.po.CoursePublish;

import java.io.File;

/**
 * @description 课程预览、发布接口
 * @author Mr.M
 * @version 1.0
 */
public interface CoursePublishService {


    /**
     * @description 获取课程预览信息
     * @param courseId 课程id
     * @return com.learneasy.content.model.dto.CoursePreviewDto
     * @author Mr.M
     */
    public CoursePreviewDto getCoursePreviewInfo(Long courseId);

    /**
     * @description 提交审核
     * @param courseId  课程id
     * @return void
     * @author Mr.M
     */
    public void commitAudit(Long companyId,Long courseId,String status);

    /**
     * @description 课程发布接口
     * @param companyId 机构id
     * @param courseId 课程id
     * @return void
     * @author Mr.M
     */
    public void publish(Long companyId,Long courseId);
    /**
     * @description 课程静态化
     * @param courseId  课程id
     * @return File 静态化文件
     * @author Mr.M
     */
    public File generateCourseHtml(Long courseId);
    /**
     * @description 上传课程静态化页面
     * @param file  静态化文件
     * @return void
     * @author Mr.M
     */
    public void  uploadCourseHtml(Long courseId,File file);


    public CoursePublish getCoursePublish(Long courseId);
}
