package com.learneasy.leUser.service.impl;

import com.learneasy.system.model.po.LeUserRole;
import com.learneasy.system.mapper.LeUserRoleMapper;
import com.learneasy.leUser.service.LeUserRoleService;
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
public class LeUserRoleServiceImpl extends ServiceImpl<LeUserRoleMapper, LeUserRole> implements LeUserRoleService {

}
