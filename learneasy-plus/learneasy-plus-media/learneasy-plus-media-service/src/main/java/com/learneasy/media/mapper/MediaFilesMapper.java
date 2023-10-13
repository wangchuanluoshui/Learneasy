package com.learneasy.media.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.learneasy.media.model.po.MediaFiles;
import com.learneasy.media.model.po.MediaProcess;

/**
 * <p>
 * 媒资信息 Mapper 接口
 * </p>
 *
 * @author itcast
 */
public interface MediaFilesMapper extends BaseMapper<MediaFiles> {

    void insert(MediaProcess mediaProcess);
}
