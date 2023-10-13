package com.learneasy.content.service;

import com.learneasy.content.model.dto.BindTeachplanMediaDto;
import com.learneasy.content.model.dto.TeachplanDto;
import com.learneasy.content.model.po.Teachplan;
import com.learneasy.content.model.po.TeachplanMedia;

import java.util.List;

public interface TeachplanService {
    List<TeachplanDto> findTeachplanTree(Long courseId);

    void saveTeachplan(Teachplan teachplan);

    void deleteTeachplan(Long teachplanId);

    void orderByTeachplan(String moveType, Long teachplanId);

    Teachplan getTeachplan(Long teachplanId);

    /**
     * 教学计划绑定媒资信息
     *
     * @param bindTeachplanMediaDto
     */
    public TeachplanMedia associationMedia(BindTeachplanMediaDto bindTeachplanMediaDto);

    /** 解绑教学计划与媒资信息
     * @param teachPlanId       教学计划id
     * @param mediaId           媒资信息id
     */
    void unassociationMedia(Long teachPlanId, String mediaId);
}
