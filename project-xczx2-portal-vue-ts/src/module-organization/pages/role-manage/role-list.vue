<template>
  <div class="course-list portal-content">
    <div class="workspace">
      <div class="banner">
        <span class="primary-title">角色明细</span>
      </div>

      <!-- 搜索栏 -->
      <div class="searcher">
<!--        <el-row :gutter="20">-->
<!--          <el-col :span="4">-->
<!--            <el-input-->
<!--                v-model="listQueryData.courseName"-->
<!--                class="el-input"-->
<!--                placeholder="请输入课程名称"-->
<!--                clearable-->
<!--            />-->
<!--          </el-col>-->
<!--          <el-col :span="4">-->
<!--            <el-select-->
<!--                v-model="listQueryData.status"-->
<!--                class="el-input"-->
<!--                placeholder="请选择结算状态"-->
<!--                clearable-->
<!--            >-->
<!--              <el-option-->
<!--                  v-for="item in orderTypeStatus"-->
<!--                  :key="item.code"-->
<!--                  :label="item.desc"-->
<!--                  :value="item.code"-->
<!--              ></el-option>-->
<!--            </el-select>-->
<!--          </el-col>-->
<!--          <el-col :span="4">-->
<!--            <el-input-->
<!--                v-model="listQueryData.orderNo"-->
<!--                class="el-input"-->
<!--                placeholder="请输入订单号"-->
<!--                clearable-->
<!--            />-->
<!--          </el-col>-->
<!--          <el-col :span="4">-->
<!--            <el-input-->
<!--                v-model="listQueryData.userId"-->
<!--                class="el-input"-->
<!--                placeholder="请输入学员ID"-->
<!--                clearable-->
<!--            />-->
<!--          </el-col>-->
<!--          <el-col :span="2" style="text-align: right;">-->
<!--            <el-button type="primary" size="medium" class="el-button" @click="getRolePageList">查询</el-button>-->
<!--          </el-col>-->
<!--        </el-row>-->
      </div>

      <!-- 数据列表 -->
      <el-table
          class="dataList"
          v-loading="listLoading"
          :data="listResult.items"
          border
          style="width: 100%"
          :header-cell-style="{ textAlign: 'center' }"
      >
        <el-table-column prop="roleName" label="角色名称" align="center"></el-table-column>

        <el-table-column prop="roleCode" label="角色编码" align="center"></el-table-column>

        <el-table-column label="操作" align="center">
          <template slot-scope="scope">
            <el-button
                type="text"
                size="mini"
                @click="handleUser(scope.$index, scope.row)"
            >分配用户</el-button>
            <el-button
                type="text"
                size="mini"
                @click="handlePermission(scope.$index, scope.row)"
            >分配权限</el-button>
          </template>
        </el-table-column>

      </el-table>

      <!-- 翻页控制 -->
      <div class="dataList-pagination">
        <Pagination
            v-show="listResult.counts > 0"
            :total="listResult.counts"
            :page.sync="listQuery.pageNo"
            :limit.sync="listQuery.pageSize"
            @pagination="getRolePageList"
        />
      </div>
    </div>

    <el-dialog
        title="分配用户"
        :visible.sync="userDialogVisible"
        width="30%"
        center>
      <el-select multiple v-model="user" placeholder="请选择用户">
        <el-option
            v-for="item in userOptions"
            :key="item.id"
            :label="item.name"
            :value="item.id">
        </el-option>
      </el-select>
      <span slot="footer" class="dialog-footer">
    <el-button @click="userDialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="saveUser">确 定</el-button>
  </span>
    </el-dialog>

    <el-dialog
        title="分配权限"
        :visible.sync="permissionDialogVisible"
        width="30%"
        center>
      <el-tree
          ref="tree"
          :data="permissionOptions"
          default-expand-all
          show-checkbox
          node-key="id"
          :default-checked-keys="checkedKeys"
          :props="defaultProps">
      </el-tree>
      <span slot="footer" class="dialog-footer">
    <el-button @click="permissionDialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="savePermission">确 定</el-button>
  </span>
    </el-dialog>

  </div>
</template>

<script lang="ts">
import { Component, Vue, Watch } from 'vue-property-decorator'
import Pagination from '@/components/pagination/index.vue'
import { IKVData } from '@/api/types'
import { ORDER_TYPE_STATUS } from '@/api/constants'
import { IOrderPageVO } from '@/entity/order-page-list'
import { getRolePageList,getUserPageList,getRoleUserList,saveRoleUserList,getMenuPageList,
  saveRolePermissionList,getRolePermissionList } from '@/api/my-user'
import {
  getToken
} from '@/utils/cookies'

@Component({
  components: {
    Pagination
  }
})
export default class OrderList extends Vue {
  // 订单交易类型状态
  private orderTypeStatus: IKVData[] = ORDER_TYPE_STATUS

  // 交易时间
  private orderDate: string[] = []

  private userOptions: string[] = []

  private user: string[] = []

  private permissionOptions: string[] = []

  private permission: string[] = []

  private checkedKeys: string[] = []

  private defaultProps: object = {
    children: 'children',
    label: 'name'
  }

  private roleId: string = ''
  // 是否载入中
  private listLoading: boolean = false

  private userDialogVisible: boolean = false

  private permissionDialogVisible: boolean = false
  // 请求参数Query
  private listQuery = {
    pageNo: 1,
    pageSize: 10
  }
  // 请求参数body
  private listQueryData = {
    orderStart: '',
    orderEnd: '',
    courseName: '',
    status: '',
    orderNo: '',
    userId: ''
  }
  // 订单列表
  private listResult: IOrderPageVO = {}

  // 计算属性
  getOrderTypeStatus(status: number) {
    let item = this.orderTypeStatus.find((value: IKVData) => {
      return status.toString() === value.code
    })
    return !item ? '' : item.desc
  }

  /**
   * 生命周期钩子
   */
  created() {
    this.getRolePageList()
  }

  /**
   * 订单列表
   */
  private async getRolePageList() {
    alert(getToken());
    this.listLoading = true
    this.listResult = await getRolePageList(this.listQuery, this.listQueryData)
    this.listLoading = false
  }

  private async handleUser(index,row){
    this.userDialogVisible = true;
    this.roleId = row.id;
    const userD = await getRoleUserList({
      id: row.id
    },{})
    let array = [];
    for(let i = 0;i<userD.length;i++){
      array.push(userD[i].id);
    }
    this.user = array;
    const result = await getUserPageList({
      pageNo: 1,
      pageSize: 1000
    },{})
    this.userOptions = result.items;
  }

  private async saveUser(){
    let userIds = '';
    for(let i = 0;i<this.user.length;i++){
      userIds = userIds + this.user[i] + ",";
    }
    const result = await saveRoleUserList({
      roleId: this.roleId,
      userIds: userIds
    },{})
    this.$message.success('操作成功')
    this.getRolePageList();
    this.userDialogVisible = false;
  }

  private async handlePermission(index,row){
    this.permissionDialogVisible = true;
    this.roleId = row.id;
    const result = await getMenuPageList({
      pageNo: 1,
      pageSize: 1000
    },{})
    this.permissionOptions = result;

    var array = [];
    this.checkedKeys = [];
    const resultD = await getRolePermissionList({
      id: row.id
    },{})
    for(let i=0;i<resultD.length;i++){
      array.push(resultD[i].id);
    }
    this.checkedKeys = array;
  }

  private async savePermission(){
    let array = this.$refs.tree.getCheckedKeys();
    let menuIds = '';
    for(let i = 0;i<array.length;i++){
      menuIds = menuIds + array[i] + ",";
    }
    const result = await saveRolePermissionList({
      roleId: this.roleId,
      menuIds: menuIds
    },{})
    this.$message.success('操作成功')
    this.getRolePageList();
    this.permissionDialogVisible = false;
  }

  // 监控 watch
  // 翻页 pageSize
  @Watch('listQuery.pageSize', { immediate: true })
  private watchListQueryPageSize(newVal: number) {
    this.listQuery.pageNo = 1
  }
}
</script>

<style lang="scss" scoped>
.course-list {
  .nav-bar {
    margin-top: 16px;
  }

  .searcher {
    margin-top: 16px;
  }

  .dataList {
    margin-top: 16px;
  }

  .dataList-pagination {
    text-align: center;
    width: 100%;
  }
}
</style>
