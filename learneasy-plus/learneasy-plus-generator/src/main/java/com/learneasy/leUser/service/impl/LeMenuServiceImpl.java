package com.learneasy.leUser.service.impl;

import com.learneasy.system.model.po.LeMenu;
import com.learneasy.system.mapper.LeMenuMapper;
import com.learneasy.leUser.service.LeMenuService;
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
public class LeMenuServiceImpl extends ServiceImpl<LeMenuMapper, LeMenu> implements LeMenuService {

}
