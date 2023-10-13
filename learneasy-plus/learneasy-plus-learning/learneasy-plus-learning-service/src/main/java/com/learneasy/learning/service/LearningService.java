package com.learneasy.learning.service;

import com.learneasy.base.model.RestResponse;

/**
 * @author Mr.M
 * @version 1.0
 * @description 在线学习相关的接口
 */
public interface LearningService {

    /**
     * @description 获取教学视频
     * @param courseId 课程id
     * @param teachplanId 课程计划id
     * @param mediaId 视频文件id
     * @return com.learneasy.base.model.RestResponse<java.lang.String>
     */
    public RestResponse<String> getVideo(String userId, Long courseId, Long teachplanId, String mediaId);

}
