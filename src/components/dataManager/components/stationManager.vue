<template>
  <div class="stationManager">
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
      <el-table-column prop="longtitude" label="经度" width="120" align="center">
      </el-table-column>
      <el-table-column prop="latitude" label="纬度" width="120" align="center">
      </el-table-column>
      <el-table-column prop="currlevel" label="当前水质等级" width="100" align="center">
      </el-table-column>
      <el-table-column prop="prelevel" label="上周水质等级" width="100" align="center">
      </el-table-column>
      <el-table-column label="站点状态" width="100" align="center">
        <template slot-scope="scope">
          <div v-show="scope.row.isAlert == 0">正常</div>
          <div v-show="scope.row.isAlert == 1">异常</div>
          <div v-show="scope.row.isAlert == 2">停站</div>
          <div v-show="scope.row.isAlert == 3">维修</div>
          <!--{{scope.row.isAlert==0}}-->
        </template>
      </el-table-column>
      <el-table-column prop="responsible" label="负责人ID" width="120" align="center">
      </el-table-column>
      <el-table-column prop="userinfo.name" label="负责人名称" width="120" align="center">
      </el-table-column>
      <el-table-column prop="district.name" label="所属流域" width="200" align="center">
      </el-table-column>
      <el-table-column prop="province.name" label="所属省市" width="100" align="center">
      </el-table-column>
      <el-table-column fixed="right" label="操作" align="center" width="250">
        <template slot-scope="scope">
          <el-button @click="showModifyWindow(scope.row)" type="text" size="small">修改</el-button>
          <el-button type="text" size="small" @click="showDeleteWindow(scope.row)">删除</el-button>
          <el-button type="text" size="small" @click="showBasin(scope.row)">查看该站点流域结构</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog title="添加" :visible.sync="dialogFormVisible" @open="open" :modal="true" :modal-append-to-body="false" style="margin-left:200px;margin-top: -100px; " width="600px">
      <div class="add_form" style="padding-left: 100px;">
        <el-form ref="form" :model="form" label-width="120px" label-position="left" style="width: 500px" size="small">
          <el-form-item label="站点编号">
            <el-input v-model="form.id" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="站点名称">
            <el-input v-model="form.name" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="站点经度">
            <el-input v-model="form.longtitude" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="站点纬度">
            <el-input v-model="form.latitude" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="当前水质等级">
            <el-input v-model="form.currLevel" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="上周水质等级">
            <el-input v-model="form.preLevel" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="省市">
            <el-select v-model="form.province" placeholder="请选择所属省市">
              <el-option label="无" value="null"></el-option>
              <el-option :label="item.name" :value="item.id" v-for="(item,index) in provinces" :key="index"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="上游站点">
            <el-select v-model="form.upstreamId" placeholder="请选择下游站点">
              <el-option label="无" value="null"></el-option>
              <el-option :label="item.stationName" :value="item.stationId" v-for="(item,index) in stations" :key="index"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="下游站点">
            <el-select v-model="form.downstreamId" placeholder="请选择下游站点">
              <el-option label="无" value="null"></el-option>
              <el-option :label="item.stationName" :value="item.stationId" v-for="(item,index) in stations" :key="index"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="负责人">
            <el-select v-model="form.user" placeholder="请选择负责人">
              <el-option :label="item.name" :value="item.uid" v-for="(item,index) in users" :key="index"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="所属流域 ">
            <el-select v-model="form.district" placeholder="请选择流域">
              <el-option :label="item.name" :value="item.id" v-for="(item,index) in districts" :key="index"></el-option>
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
          <el-form-item label="站点编号">
            <el-input v-model="form1.id" style="width: 200px;" disabled></el-input>
          </el-form-item>
          <el-form-item label="站点名称">
            <el-input v-model="form1.name" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="站点经度">
            <el-input v-model="form1.longtitude" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="站点纬度">
            <el-input v-model="form1.latitude" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="当前水质等级">
            <el-input v-model="form1.currLevel" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="上周水质等级">
            <el-input v-model="form1.preLevel" style="width: 200px;"></el-input>
          </el-form-item>
          <el-form-item label="站点状态">
            <el-input v-model="form1.isAlert" style="width: 200px;"></el-input>
          </el-form-item>
          <!--<el-form-item label="上游站点">
            <el-select v-model="form1.upstreamId" placeholder="请选择上游站点">
              <el-option label="无" :value="null"></el-option>
              <el-option :label="item.stationName" :value="item.stationId" v-for="(item,index) in stations" :key="index"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="下游站点">
            <el-select v-model="form1.downstreamId" placeholder="请选择下游站点">
              <el-option label="无" :value="null"></el-option>
              <el-option :label="item.stationName" :value="item.stationId" v-for="(item,index) in stations" :key="index"></el-option>
            </el-select>
          </el-form-item>-->
          <el-form-item label="省市">
            <el-select v-model="form1.province" placeholder="请选择所属省市">
              <el-option label="无" value="null"></el-option>
              <el-option :label="item.name" :value="item.id" v-for="(item,index) in provinces" :key="index"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="负责人">
            <el-select v-model="form1.user" placeholder="请选择负责人">
              <el-option :label="item.name" :value="item.uid" v-for="(item,index) in users" :key="index"></el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="所属区域 ">
            <el-select v-model="form1.district" placeholder="请选择所属区域">
              <el-option :label="item.name" :value="item.id" v-for="(item,index) in districts" :key="index"></el-option>
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
    
     <el-dialog :title="station_title" :visible.sync="dialogFormVisible3" @open="open" :modal="true" :modal-append-to-body="false" style="margin-left:200px;margin-top: -100px; " width="600px">
       <div id="chartArea" style="height: 500px;width: 500px;"></div>
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
        this.$store.dispatch('sysd/getAllStation', info).then(response => {
//        const station_id_list = []
          const data = response.obj.list
//        for(let i = 0; i < data.length; i++) {
//          station_id_list.push({
//            'stationId': data[i].id,
//            'stationName': data[i].name
//          })
//        }
          this.tableData = response.obj.list
          this.totalPage = response.obj.total
//        this.stations = station_id_list
          //        alert(station_id_list)
        })
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
        this.defalut_pageSize = val
        const info = {
          page: this.currentPage,
          pageSize: this.defalut_pageSize
        }
        this.$store.dispatch('sysd/getAllStation', info).then(response => {
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
        this.$store.dispatch('sysd/getAllStation', info).then(response => {
          this.tableData = response.obj.list
          this.totalPage = response.obj.total
        })
      },
      open() {
        this.$store.dispatch('sysd/getAllUser').then(response => {
          this.users = response.obj
          const info = {
            page: 1,
            pageSize: 10000
          }
          this.$store.dispatch('sysd/getAllDistrict', info).then(response => {
            this.districts = response.obj.list
          })
          
          this.$store.dispatch('sysd/getAllStation',info).then(response =>  {
            const station_id_list = []
            const data = response.obj.list
            for(let i = 0; i < data.length; i++) {
              station_id_list.push({
                'stationId': data[i].id,
                'stationName': data[i].name
              })
            }
     
            this.stations = station_id_list
          })
        })
      },
      add() {
        //      alert(JSON.stringify(this.form))
        this.$store.dispatch('sysd/addStation', this.form).then(response => {
          if(response.status == 200) {
            this.$message({
              message: response.msg,
              type: 'success'
            })
            this.reload()
          }
        })
      },
      showBasin(row) {
        this.dialogFormVisible3 = true
        this.station_title = row.name
        this.$store.dispatch('sysd/getRelBySid',row.id).then(response => {
          let data = response.obj
          const nodes = new Set()
          const links = []
          for(let i = 0;i < data.length;i++){
            let arr = data[i].split("@")
            
            nodes.add(arr[0])
            nodes.add(arr[2])
            
            let tmp = {
              source: arr[0],
              target: arr[2],
              name: arr[1]
            }
            
            console.log(tmp)
            links.push(tmp)
          }
          
          const nodesConfig = []
          nodes.forEach((e, i) => {
            const tmp = {
              name: e,
              symbolSize: 50,
              itemStyle: {
                normal: {
//                color: this.generate_color(),
                  show: true,
                }
              }
            }
            nodesConfig.push(tmp)
          })
          
          const option = {
            //          title: {
            //            text: '水质知识图谱',
            //            textStyle: {
            //              color: '#fff'
            //            }
            //          },
            //设置鼠标移动到节点处显示的信息
            tooltip: {
              formatter: function(x) {
                return x.data.name;
              }
            },
            animationDurationUpdate: 1500,
            animationEasingUpdate: 'quinticInOut',
            series: [{
              type: 'graph',
//            layout: 'circular',
              layout: 'force',
              symbolSize: 80,
              roam: true,
              label: {
                normal: {
                  show: true,
                  color: 'black'
                }
              },
              edgeSymbol: ['circle', 'arrow'],
              edgeSymbolSize: [4, 10],
              edgeLabel: {
                normal: {
                  textStyle: {
                    //                  color: '#fff',  
                    fontSize: 20
                  }
                }
              },
              force: {
                repulsion: 3000, //斥力
                edgeLength: [20, 80] //默认距离
              },
              //            layout:'circular',
              draggable: true,
              lineStyle: {
                normal: {
                  width: 2,
                  color: 'black',
                  curveness: 0.2,
                  length: 20
                }
              },
              edgeLabel: {
                normal: {
                  show: true,
                  formatter: function(x) {
                    return x.data.name;
                  }
                }
              },
              data: nodesConfig,
              links: links
            }]
          }
          
          let chartRel = echarts.init(document.getElementById('chartArea'))
          chartRel.setOption(option)
        })
      },
//    showBasinRel(){
//      
//    },
      showModifyWindow(row) {
        //      alert(JSON.stringify(row.province))
        this.dialogFormVisible2 = true
        this.form1.id = row.id
        this.form1.name = row.name
        this.form1.longtitude = row.longtitude
        this.form1.latitude = row.latitude
        this.form1.currLevel = row.currlevel
        this.form1.preLevel = row.prelevel
        this.form1.user = row.userinfo.uid
        this.form1.district = row.district.id
        //      this.form1.upstreamId = row.upstreamId
        //      this.form1.downstreamId = row.downstreamId
        this.form1.province = row.province.id
        this.form1.isAlert = row.isAlert

      },
      modify() {
        this.$store.dispatch('sysd/modifyStation', this.form1).then(response => {
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
        this.stationId = row.id
        this.centerDialogVisible = true
      },
      deleteStation() {
        this.$store.dispatch('sysd/deleteStation', this.stationId).then(response => {
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
        districts: '',
        users: '',
        totalPage: 0,
        stations: [],
        centerDialogVisible: false,
        stationId: '',
        form: {
          id: '',
          name: '',
          longtitude: '',
          latitude: '',
          currLevel: '',
          preLevel: '',
          user: '',
          district: '',
          province: '',
          upstreamId: '',
          downstreamId: ''
        },
        form1: {
          id: '',
          name: '',
          longtitude: '',
          latitude: '',
          currLevel: '',
          preLevel: '',
          user: '',
          district: '',
          upstreamId: '',
          downstreamId: '',
          province: '',
          isAlert: ''
        },
        provinces: [{
            id: 8601,
            name: '北京市'
          },
          {
            id: 8602,
            name: '上海市'
          },
          {
            id: 8603,
            name: '天津市'
          },
          {
            id: 8604,
            name: '重庆市'
          },
          {
            id: 8605,
            name: '河北省'
          },
          {
            id: 8606,
            name: '山西省'
          },
          {
            id: 8607,
            name: '内蒙古自治区'
          },
          {
            id: 8608,
            name: '辽宁省'
          },
          {
            id: 8609,
            name: '吉林省'
          },
          {
            id: 8610,
            name: '黑龙江省'
          },
          {
            id: 8611,
            name: '江苏省'
          },
          {
            id: 8612,
            name: '浙江省'
          },
          {
            id: 8613,
            name: '安徽省'
          },
          {
            id: 8614,
            name: '江西省'
          },
          {
            id: 8615,
            name: '山东省'
          },
          {
            id: 8616,
            name: '河南省'
          },
          {
            id: 8617,
            name: '湖北省'
          },
          {
            id: 8618,
            name: '广西壮族自治区'
          },
          {
            id: 8619,
            name: '四川省'
          },
          {
            id: 8620,
            name: '云南省'
          },
          {
            id: 8621,
            name: '陕西省'
          },
          {
            id: 8622,
            name: '甘肃省'
          },
          {
            id: 8623,
            name: '宁夏回族自治区'
          },
          {
            id: 8624,
            name: '湖南省'
          },
          {
            id: 8625,
            name: '广东省'
          }
        ],
        station_title: ''
      }
    }
  }
</script>

<style>
  .stationManager {
    background-color: #FFFFFF;
    padding: 32px;
  }
</style>