<template>
  <div class="enterpriseManager">
    <!--<div style="padding: 10px;float: right;">
      <el-button type="primary" size="small">主要按钮</el-button>
    </div>-->
    <div style="margin-bottom: 20px;float: left;">
      <el-button type="success" @click="dialogFormVisible = true">添加</el-button>

    </div>
    <div class="block" style="float: right;">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="currentPage" :page-sizes="[5, 10, 15, 20]" :page-size="defalut_pageSize" layout="total, sizes, prev, pager, next, jumper" :total="totalPage">
      </el-pagination>
    </div>
    <el-table :data="tableData" border style="width: 100%">
      <el-table-column fixed prop="id" label="站点编号" width="100" align="center">
      </el-table-column>
      <el-table-column prop="name" label="站点名称" width="120" align="center">
      </el-table-column>
      <el-table-column prop="contacts" label="企业联系人" width="120" align="center">
      </el-table-column>
      <el-table-column prop="contactsNumber" label="企业联系方式" width="120" align="center">
      </el-table-column>
      <el-table-column prop="mainPollutions" label="主要污染物" width="100" align="center">
      </el-table-column>
      <el-table-column prop="pollutionsNum" label="排污量" width="100" align="center">
      </el-table-column>
      <el-table-column label="是否超标" width="100" align="center">
        <template slot-scope="scope">
          <div v-show="scope.row.isExceed == 0">正常</div>
          <div v-show="scope.row.isExceed == 1">超标</div>
        </template>
      </el-table-column>
      <el-table-column prop="exceedFactor" label="超标指标" width="120" align="center">
      </el-table-column>
      <el-table-column prop="station.name" label="所属站点" width="120" align="center">
      </el-table-column>
     
      <el-table-column fixed="right" label="操作" align="center" width="250">
        <template slot-scope="scope">
          <el-button @click="showModifyWindow(scope.row)" type="text" size="small">修改</el-button>
          <el-button type="text" size="small" @click="showDeleteWindow(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog title="添加" :visible.sync="dialogFormVisible" @open="open" :modal="true" :modal-append-to-body="false" style="margin-left:200px;margin-top: -100px; " width="600px">
      <div class="add_form" style="padding-left: 100px;">
        <el-form ref="form" :model="form" label-width="120px" label-position="left" style="width: 500px" size="small">
          <el-form-item label="企业编号">
            <el-input v-model="form.id" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="企业名称">
            <el-input v-model="form.name" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="企业联系人">
            <el-input v-model="form.contacts" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="企业联系方式">
            <el-input v-model="form.contactsNumber" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="主要污染物">
            <el-input v-model="form.mainPollutions" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="排污量">
            <el-input v-model="form.pollutionsNum" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="是否超标">
            <el-input v-model="form.isExceed" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="超标指标">
            <el-input v-model="form.exceedFactor" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="所属站点">
            <el-select v-model="form.station" placeholder="请选择所属站点">
              <el-option :label="item.name" :value="item.id" v-for="(item,index) in stations" :key="index"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </div>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="add">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="修改" :visible.sync="dialogFormVisible2" @open="open" :modal="true" :modal-append-to-body="false" style="margin-left:200px;margin-top: -100px; " width="600px">
      <div class="modify_form" style="padding-left: 100px;">
        <el-form ref="form1" :model="form1" label-width="120px" label-position="left" style="width: 350px;" size="small">
          <el-form-item label="企业编号">
            <el-input v-model="form1.id" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="企业名称">
            <el-input v-model="form1.name" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="企业联系人">
            <el-input v-model="form1.contacts" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="企业联系方式">
            <el-input v-model="form1.contactsNumber" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="主要污染物">
            <el-input v-model="form1.mainPollutions" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="排污量">
            <el-input v-model="form1.pollutionsNum" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="是否超标">
            <el-input v-model="form1.isExceed" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="超标指标">
            <el-input v-model="form1.exceedFactor" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="所属站点">
            <el-select v-model="form1.stationId" placeholder="请选择所属站点">
              <el-option :label="item.name" :value="item.id" v-for="(item,index) in stations" :key="index"></el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="modify">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="提示" :visible.sync="centerDialogVisible" width="30%" center :modal-append-to-body="false" style="margin-top: 20px;">
      <span>该操作会删除位于该站点的设备信息和此设备具有的数据，确定删除吗？</span>
      <span slot="footer" class="dialog-footer">
      <el-button @click="centerDialogVisible = false">取 消</el-button>
      <el-button type="primary" @click="deleteStation">确 定</el-button>
    </span>
    </el-dialog>
  </div>
</template>
<script>
  var echarts = require('echarts');
  
  export default {

    methods: {
      initData() {
        const info = {
          page: this.currentPage,
          pageSize: this.defalut_pageSize
        }
        this.$store.dispatch('sysd/getAllEnterprise', info).then(response => {
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
        this.$store.dispatch('sysd/getAllEnterprise', info).then(response => {
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
        this.$store.dispatch('sysd/getAllEnterprise', info).then(response => {
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
            this.stations = response.obj.list
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
  .enterpriseManager {
    background-color: #FFFFFF;
    padding: 32px;
  }
</style>