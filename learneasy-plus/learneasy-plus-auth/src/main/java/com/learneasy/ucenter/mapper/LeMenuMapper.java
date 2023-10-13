package com.learneasy.ucenter.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.learneasy.ucenter.model.po.LeMenu;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author itcast
 */
public interface LeMenuMapper extends BaseMapper<LeMenu> {
    @Select("SELECT	* FROM le_menu WHERE id IN (SELECT menu_id FROM le_permission WHERE role_id IN ( SELECT role_id FROM le_user_role WHERE user_id = #{userId} ))")
    List<LeMenu> selectPermissionByUserId(@Param("userId") String userId);
}
