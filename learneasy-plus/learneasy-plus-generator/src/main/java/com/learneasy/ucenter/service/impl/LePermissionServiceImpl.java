package com.learneasy.ucenter.service.impl;

import com.learneasy.ucenter.model.po.LePermission;
import com.learneasy.ucenter.mapper.LePermissionMapper;
import com.learneasy.ucenter.service.LePermissionService;
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
public class LePermissionServiceImpl extends ServiceImpl<LePermissionMapper, LePermission> implements LePermissionService {

}
