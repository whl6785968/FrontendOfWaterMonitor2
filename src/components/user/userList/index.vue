<template>
  <div id="userList">
    <div style="margin-bottom: 20px;float: left;">
      <el-button type="success" @click="dialogFormVisible = true">添加</el-button>

    </div>
    <div class="block" style="float: right;">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="currentPage" :page-sizes="[5, 10, 15, 20]" :page-size="defalut_pageSize" layout="total, sizes, prev, pager, next, jumper" :total="totalPage">
      </el-pagination>
    </div>
    <el-table :data="tableData" border style="width: 100%">
      <el-table-column fixed prop="userid" label="用户id" width="100" align="center">
      </el-table-column>
      <el-table-column prop="userinfo.name" label="用户名称" width="120" align="center">
      </el-table-column>
      <el-table-column prop="userinfo.sex" label="用户性别" width="120" align="center">
      </el-table-column>
      <el-table-column prop="userinfo.age" label="用户年龄" width="120" align="center">
      </el-table-column>
      <el-table-column prop="userinfo.link" label="用户联系方式" width="120" align="center">
      </el-table-column>
      <el-table-column prop="userinfo.descr" label="用户描述" width="100" align="center">
      </el-table-column>
      <el-table-column label="是否锁定" width="100" align="center">
        <template slot-scope="scope">
          <div v-show="scope.row.usersecurityinfo.locked == 0">否</div>
          <div v-show="scope.row.usersecurityinfo.locked == 1">是</div>
        </template>
      </el-table-column>
      <el-table-column label="是否可用" width="100" align="center">
        <template slot-scope="scope">
          <div v-show="scope.row.usersecurityinfo.enabled == 0">是</div>
          <div v-show="scope.row.usersecurityinfo.enabled == 1">否</div>
        </template>
      </el-table-column>
      <el-table-column fixed="right" label="操作" align="center">
        <template slot-scope="scope">
          <el-button @click="showModifyWindow(scope.row)" type="text" size="small">修改</el-button>
          <el-button type="text" size="small" @click="showDeleteWindow(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
  export default {

    methods: {
      initData() {
        const info = {
          page: this.currentPage,
          pageSize: this.defalut_pageSize
        }
        this.$store.dispatch('user/getAllUser', info).then(response => {
          const data = response.obj.list

          this.tableData = response.obj.list
          this.totalPage = response.obj.total
        })
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
        this.defalut_pageSize = val
        const info = {
          page: this.currentPage,
          pageSize: this.defalut_pageSize
        }
        this.$store.dispatch('./getAllUser', info).then(response => {
          this.tableData = response.obj.list
          this.totalPage = response.obj.total
        })
      },
      handleCurrentChange(val) {
        console.log(`当前页: ${val}`);
        this.currentPage = val
        const info = {
          page: this.currentPage,
          pageSize: this.defalut_pageSize
        }
        this.$store.dispatch('user/getAllUser', info).then(response => {
          this.tableData = response.obj.list
          this.totalPage = response.obj.total
        })
      },
      open() {
        const info = {
            page: 1,
            pageSize: 10000
        }
        
        this.$store.dispatch('sysd/getAllStation',info).then(response => {
            this.stations = response.obj
        })
      },
      add() {
        this.$store.dispatch('sysd/addEnterprise', this.form).then(response => {
          if(response.status == 200) {
            this.$message({
              message: response.msg,
              type: 'success'
            })
            this.reload()
          }
        })
      },
      showModifyWindow(row) {
        this.dialogFormVisible2 = true
        this.form1.id = row.id
        this.form1.name = row.name
        this.form1.contacts = row.contacts
        this.form1.contactsNumber = row.contactsNumber
        this.form1.mainPollutions = row.mainPollutions
        this.form1.pollutionsNum = row.pollutionsNum
        this.form1.isExceed = row.isExceed
        this.form1.exceedFactor = row.exceedFactor
        this.form1.stationId = row.station.id
      },
      modify() {
      alert(JSON.stringify(this.form1))
        this.$store.dispatch('sysd/updateEnterprise', this.form1).then(response => {
          if(response.status == 200) {
            this.$message({
              message: response.msg,
              type: 'success'
            })
            this.reload()
          }
        })
      },
      showDeleteWindow(row) {
        this.id = row.id
        this.centerDialogVisible = true
      },
      deleteStation() {
        this.$store.dispatch('sysd/deleteEnterprise', this.id).then(response => {
          this.$message.success(response.msg)
          this.reload()
        })
      }
    },
    inject: ['reload'],
    mounted() {
      this.initData()
    },
    data() {
      return {
        tableData: [],
        currentPage: 1,
        defalut_pageSize: 10,
        dialogFormVisible: false,
        dialogFormVisible2: false,
        dialogFormVisible3: false,
        stations: [],
        id: '',
        totalPage: 0,
        centerDialogVisible: false,
        form: {
          id: '',
          name: '',
          contacts: '',
          contactsNumber: '',
          mainPollutions: '',
          pollutionsNum: '',
          isExceed: '',
          exceedFactor: '',
          station: ''
        },
        form1: {
          id: '',
          name: '',
          contacts: '',
          contactsNumber: '',
          mainPollutions: '',
          pollutionsNum: '',
          isExceed: '',
          exceedFactor: '',
          stationId: ''
        }
      }
    }
  }

</script>

<style>
  #userList{
    background-color: #FFFFFF;
    padding: 32px;
  }
</style>