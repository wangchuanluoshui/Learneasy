package com.learneasy.ucenter.service.impl;

import com.learneasy.ucenter.model.po.LeUserRole;
import com.learneasy.ucenter.mapper.LeUserRoleMapper;
import com.learneasy.ucenter.service.LeUserRoleService;
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
