package com.learneasy.ucenter.service.impl;

import com.learneasy.ucenter.model.po.LeTeacher;
import com.learneasy.ucenter.mapper.LeTeacherMapper;
import com.learneasy.ucenter.service.LeTeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author itcast
 */
@Slf4j
@Service
public class LeTeacherServiceImpl extends ServiceImpl<LeTeacherMapper, LeTeacher> implements LeTeacherService {

}
