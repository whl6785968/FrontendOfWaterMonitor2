<template>
  <div class="errRecord">
    <el-table
    :data="tableData"
    border
    style="width: 100%">
    <el-table-column
      fixed
      prop="createTime"
      label="日期"
      width="150"
      align="center">
    </el-table-column>
    <el-table-column
      prop="recordId"
      label="记录编号"
      width="300"
      align="center">
    </el-table-column>
    <el-table-column
      prop="title"
      label="标题"
      width="220"
      align="center">
    </el-table-column>
    <el-table-column
      prop="seriousFactor"
      label="超标指标"
      width="100"
      align="center">
    </el-table-column>
    <el-table-column
      prop="emergency"
      label="异常等级"
      width="100"
      align="center">
    </el-table-column>
    <el-table-column
      prop="chargerName"
      label="负责人"
      width="100"
      align="center">
    </el-table-column>
    <el-table-column
      prop="chargerNumger"
      label="负责人电话"
      width="120"
      align="center">
    </el-table-column>
    <el-table-column
      prop="isSolve"
      label="状态"
      width="100"
      align="center"
      >
      <template slot-scope="scope">
        <span class="badge badge-danger" v-if='scope.row.isSolve == 0'>未解决</span>
        <span class="badge badge-success" v-if='scope.row.isSolve == 1'>已解决</span>
      </template>
    </el-table-column>
    
    <el-table-column
      fixed="right"
      label="操作"
      align="center">
      <template slot-scope="scope">
        <el-button @click="skip(scope.row)" type="text" size="small">查看详细报告</el-button>
        <el-button @click="handleClick(scope.row)" type="text" size="small" v-if="scope.row.chargerId == userId && scope.row.isSolve == 0 ">解决</el-button>
      </template>
    </el-table-column>
  </el-table>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        tableData: [],
        userId:''
      }
    },
    mounted(){
      this.getErrRecord()
    },
    methods: {
      getErrRecord(){
        this.userId = sessionStorage.getItem('username')
        this.$store.dispatch('algo/getErrRecord').then(response => {
          this.tableData = response
        })
      },
      skip(row){
        const reportId = row.recordReport.reportId
        this.$router.push("/errRecord/errReport/"+reportId)
      }
    }
  }
</script>

<style>
  .errRecord{
    width: 100%;
    background-color: #FFFFFF;
    padding: 32px;
  }
</style>