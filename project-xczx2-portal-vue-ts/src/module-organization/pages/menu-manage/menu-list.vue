<template>
  <div class="course-list portal-content">
    <div class="workspace">
      <div class="banner">
        <span class="primary-title">权限明细</span>
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
<!--            <el-button type="primary" size="medium" class="el-button" @click="getMenuPageList">查询</el-button>-->
<!--          </el-col>-->
<!--        </el-row>-->
      </div>

      <!-- 数据列表 -->
      <el-table
          class="dataList"
          :data="listResult"
          border
          style="width: 100%"
          :header-cell-style="{ textAlign: 'center' }"
          row-key="id"
          default-expand-all
          :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
        <el-table-column prop="id" label="菜单编码" align="center"></el-table-column>

        <el-table-column prop="code" label="菜单编码" align="center"></el-table-column>

        <el-table-column prop="path" label="菜单路径" align="center"></el-table-column>

        <el-table-column prop="name" label="菜单名称" align="center"></el-table-column>

        <el-table-column prop="isMenu" label="是否菜单" align="center"></el-table-column>

      </el-table>

      <!-- 翻页控制 -->
<!--      <div class="dataList-pagination">-->
<!--        <Pagination-->
<!--            v-show="listResult.counts > 0"-->
<!--            :total="listResult.counts"-->
<!--            :page.sync="listQuery.pageNo"-->
<!--            :limit.sync="listQuery.pageSize"-->
<!--            @pagination="getMenuPageList"-->
<!--        />-->
<!--      </div>-->
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Watch } from 'vue-property-decorator'
import { IOrderPageVO } from '@/entity/order-page-list'
import { getMenuPageList } from '@/api/my-user'

@Component({
  components: {
  }
})
export default class MenuList extends Vue {
  // 是否载入中
  private listLoading: boolean = false
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
  private listResult: IOrderPageVO = []

  /**
   * 生命周期钩子
   */
  created() {
    this.getMenuPageList()
  }

  /**
   * 订单列表
   */
  private async getMenuPageList() {
    this.listLoading = true
    this.listResult = await getMenuPageList(this.listQuery, this.listQueryData)
    this.listLoading = false
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
