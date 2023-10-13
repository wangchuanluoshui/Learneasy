package com.learneasy.content.service.impl;

import com.alibaba.fastjson.JSON;
import com.learneasy.base.exception.CommonError;
import com.learneasy.base.exception.LearnEasyPlusException;
import com.learneasy.content.config.MultipartSupportConfig;
import com.learneasy.content.feignclient.MediaServiceClient;
import com.learneasy.content.mapper.CourseBaseMapper;
import com.learneasy.content.mapper.CourseMarketMapper;
import com.learneasy.content.mapper.CoursePublishMapper;
import com.learneasy.content.mapper.CoursePublishPreMapper;
import com.learneasy.content.model.dto.CourseBaseInfoDto;
import com.learneasy.content.model.dto.CoursePreviewDto;
import com.learneasy.content.model.dto.TeachplanDto;
import com.learneasy.content.model.po.CourseBase;
import com.learneasy.content.model.po.CourseMarket;
import com.learneasy.content.model.po.CoursePublish;
import com.learneasy.content.model.po.CoursePublishPre;
import com.learneasy.content.service.CourseBaseInfoService;
import com.learneasy.content.service.CoursePublishService;
import com.learneasy.content.service.TeachplanService;
import com.learneasy.messagesdk.model.po.MqMessage;
import com.learneasy.messagesdk.service.MqMessageService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Mr.M
 * @version 1.0
 * @description 课程发布相关接口实现
 */
@Slf4j
@Service
public class CoursePublishServiceImpl implements CoursePublishService {

 @Autowired
 CourseBaseInfoService courseBaseInfoService;

 @Autowired
 TeachplanService teachplanService;

 @Autowired
 CourseBaseMapper courseBaseMapper;

 @Autowired
 CourseMarketMapper courseMarketMapper;

 @Autowired
 CoursePublishPreMapper coursePublishPreMapper;
 @Autowired
 CoursePublishMapper coursePublishMapper;

 @Autowired
 MqMessageService mqMessageService;

 @Autowired
 MediaServiceClient mediaServiceClient;


 @Override
 public CoursePreviewDto getCoursePreviewInfo(Long courseId) {
  CoursePreviewDto coursePreviewDto = new CoursePreviewDto();
  //课程基本信息,营销信息
  CourseBaseInfoDto courseBaseInfo = courseBaseInfoService.getCourseBaseInfo(courseId);
  coursePreviewDto.setCourseBase(courseBaseInfo);
  //课程计划信息
  List<TeachplanDto> teachplanTree = teachplanService.findTeachplanTree(courseId);
  coursePreviewDto.setTeachplans(teachplanTree);

  return coursePreviewDto;
 }

 @Transactional
 @Override
 public void commitAudit(Long companyId, Long courseId,String status) {

  CourseBaseInfoDto courseBaseInfo = courseBaseInfoService.getCourseBaseInfo(courseId);
  if (courseBaseInfo == null) {
   LearnEasyPlusException.cast("课程找不到");
  }
  //审核状态
  String auditStatus = courseBaseInfo.getAuditStatus();

  //如果课程的审核状态为已提交则不允许提交
//  if(auditStatus.equals("202003")){
//   LearnEasyPlusException.cast("课程已提交请等待审核");
//  }
  //本机构只能提交本机构的课程
  //todo:本机构只能提交本机构的课程

  //课程的图片、计划信息没有填写也不允许提交
  String pic = courseBaseInfo.getPic();
  if(StringUtils.isEmpty(pic)){
   LearnEasyPlusException.cast("请求上传课程图片");
  }
  //查询课程计划
  //课程计划信息
  List<TeachplanDto> teachplanTree = teachplanService.findTeachplanTree(courseId);
  if(teachplanTree == null || teachplanTree.size()==0){
   LearnEasyPlusException.cast("请编写课程计划");
  }

  //查询到课程基本信息、营销信息、计划等信息插入到课程预发布表
  CoursePublishPre coursePublishPre = new CoursePublishPre();
  BeanUtils.copyProperties(courseBaseInfo,coursePublishPre);
  //设置机构id
  coursePublishPre.setCompanyId(companyId);
  //营销信息
  CourseMarket courseMarket = courseMarketMapper.selectById(courseId);
  //转json
  String courseMarketJson = JSON.toJSONString(courseMarket);
  coursePublishPre.setMarket(courseMarketJson);
  //计划信息
  //转json
  String teachplanTreeJson = JSON.toJSONString(teachplanTree);
  coursePublishPre.setTeachplan(teachplanTreeJson);
  //状态为已提交
  coursePublishPre.setStatus(status);
  //提交时间
  coursePublishPre.setCreateDate(LocalDateTime.now());
  //查询预发布表，如果有记录则更新，没有则插入
  CoursePublishPre coursePublishPreObj = coursePublishPreMapper.selectById(courseId);
  if(coursePublishPreObj==null){
   //插入
   coursePublishPreMapper.insert(coursePublishPre);
  }else {
   //更新
   coursePublishPreMapper.updateById(coursePublishPre);
  }

  //更新课程基本信息表的审核状态为已提交
  CourseBase courseBase = courseBaseMapper.selectById(courseId);
  courseBase.setAuditStatus(status);//审核状态为已提交
//  courseBase.setAuditStatus("202004");//审核状态为审核通过

  courseBaseMapper.updateById(courseBase);
 }

 @Transactional
 @Override
 public void publish(Long companyId, Long courseId) {

  //查询预发布表
  CoursePublishPre coursePublishPre = coursePublishPreMapper.selectById(courseId);
  if(coursePublishPre == null){
   LearnEasyPlusException.cast("课程没有审核记录，无法发布");
  }
  //状态
  String status = coursePublishPre.getStatus();
  //课程如果没有审核通过不允许发布
  if(!status.equals("202004")){
   LearnEasyPlusException.cast("课程没有审核通过不允许发布");
  }

  //向课程发布表写入数据
  CoursePublish coursePublish = new CoursePublish();
  BeanUtils.copyProperties(coursePublishPre,coursePublish);
  //先查询课程发布，如果有则更新，没有再添加
  CoursePublish coursePublishObj = coursePublishMapper.selectById(courseId);
  if(coursePublishObj == null){
   coursePublishMapper.insert(coursePublish);
  }else{
   coursePublishMapper.updateById(coursePublish);
  }

  //向消息表写入数据
//        mqMessageService.addMessage("course_publish",String.valueOf(courseId),null,null);
  saveCoursePublishMessage(courseId);

  //将预发布表数据删除
  coursePublishPreMapper.deleteById(courseId);

 }

 @Override
 public File generateCourseHtml(Long courseId) {
//静态化文件
  Configuration configuration = new Configuration(Configuration.getVersion());
  //最终的静态文件
  File htmlFile  = null;
  try {
   //得到classpath路径
   String classpath = this.getClass().getResource("/").getPath();
   //指定模板的目录
   configuration.setDirectoryForTemplateLoading(new File(classpath + "/templates/"));
   //设置字符编码
   configuration.setDefaultEncoding("utf-8");

   //指定模板文件名称
   Template template = configuration.getTemplate("course_template.ftl");
   //准备数据
   CoursePreviewDto coursePreviewInfo = this.getCoursePreviewInfo(courseId);
   Map<String, Object> map = new HashMap<>();
   map.put("model", coursePreviewInfo);

   //参数1：模板，参数2：数据模型
   String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
   //将静态化内容输出到文件中
   InputStream inputStream = IOUtils.toInputStream(html, "utf-8");
   htmlFile = File.createTempFile("coursepublish",".html");
   log.debug("课程静态化，生成静态文件:{}",htmlFile.getAbsolutePath());
   //输出流
   FileOutputStream outputStream = new FileOutputStream(htmlFile);
   //使用流将html写入文件
   IOUtils.copy(inputStream, outputStream);
  } catch (Exception ex){
   log.error("页面静态化出现问题,课程id:{}",courseId,ex);
   ex.printStackTrace();
  }

  return htmlFile;
 }

 @Override
 public void uploadCourseHtml(Long courseId, File file) {
  try {
   //将file转成MultipartFile
   MultipartFile multipartFile = MultipartSupportConfig.getMultipartFile(file);
   //远程调用得到返回值
   String upload = mediaServiceClient.upload(multipartFile, "course/"+courseId+".html");
   if(upload==null){
    log.debug("远程调用走降级逻辑得到上传的结果为null，课程id:{}",courseId);
    LearnEasyPlusException.cast("上传静态文件异常");
   }
//   int a =1;

  }catch (Exception ex){
//   log.error("输出异常",ex);
   ex.printStackTrace();
   LearnEasyPlusException.cast("上传静态文件过程中存在异常");
  }


 }
 /**
  * @description 保存消息表记录
  * @param courseId  课程id
  * @return void
  * @author Mr.M
  * @date 2023/8/16 16:32
  */
 private void saveCoursePublishMessage(Long courseId) {
  MqMessage mqMessage = mqMessageService.addMessage("course_publish", String.valueOf(courseId), null, null);
  if (mqMessage == null) {
   LearnEasyPlusException.cast(CommonError.UNKOWN_ERROR);
  }

 }
 @Override
 public CoursePublish getCoursePublish(Long courseId) {
  CoursePublish coursePublish = coursePublishMapper.selectById(courseId);
  return coursePublish ;
 }



}
