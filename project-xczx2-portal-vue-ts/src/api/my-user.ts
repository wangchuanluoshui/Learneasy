import { createAPI } from '@/utils/request'
import { IOrderPageVO } from '@/entity/order-page-list'

// 用户列表及明细
export async function getUserPageList(
    params: any,
    body: any
): Promise<IOrderPageVO> {
    const { data } = await createAPI(
        '/system/user/userList',
        'post',
        params,
        body
    )
    return data
}

// 角色列表及明细
export async function getRolePageList(
    params: any,
    body: any
): Promise<IOrderPageVO> {
    const { data } = await createAPI(
        '/system/role/roleList',
        'post',
        params,
        body
    )
    return data
}

// 菜单列表及明细
export async function getMenuPageList(
    params: any,
    body: any
): Promise<IOrderPageVO> {
    const { data } = await createAPI(
        '/system/menu/menuList',
        'post',
        params,
        body
    )
    return data
}

// 菜单列表及明细
export async function getRoleUserList(
    params: any
): Promise<IOrderPageVO> {
    const { data } = await createAPI(
        '/system/role/findUser',
        'post',
        params
    )
    return data
}

export async function getRolePermissionList(
    params: any
): Promise<IOrderPageVO> {
    const { data } = await createAPI(
        '/system/role/findPermission',
        'post',
        params
    )
    return data
}

export async function saveRoleUserList(
    params: any,
    body: any
): Promise<IOrderPageVO> {
    const { data } = await createAPI(
        '/system/role/insertUser',
        'post',
        params,
        body
    )
    return data
}

export async function saveRolePermissionList(
    params: any,
    body: any
): Promise<IOrderPageVO> {
    const { data } = await createAPI(
        '/system/role/insertPermission',
        'post',
        params,
        body
    )
    return data
}
