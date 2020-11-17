<template>
  <div id="errReport">
     <div class="top">
      <div class="back">
        <el-page-header @back="goBack" content="详情报告">
        </el-page-header>
      </div>
    </div>
    <div class="body">
      <div class="title" style="width: 100%;text-align: center;margin-bottom: 50px;">
        <h3>站点{{station_name}}异常报告</h3>
      </div>
      
      <div class="resultDiv" style="margin-bottom: 20px">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span><strong>站点异常原因</strong></span>
          </div>
          <div class="text">
            {{data.result}}
          </div>
        </el-card>
      </div>
      
      <div class="basinErrorDiv" style="margin-bottom: 20px;width: 100%;height: 200px;">
        <el-card class="box-card" style="float: left;width: 49%;height: 200px;">
          <div slot="header" class="clearfix" >
            <span><strong>流域情况 </strong></span>
          </div>
          <div class="text">
            {{data.basinError}}
          </div>
        </el-card>
        
        <el-card class="box-card" style="float: right;width: 49%;height: 200px;">
          <div slot="header" class="clearfix">
            <span><strong>周边企业情况</strong></span>
          </div>
          <div class="text">
            {{data.enterpriseError == '' ? '无':data.enterpriseError}}
          </div>
        </el-card>
      </div>
      
      <div class="dataShowDiv1" style="margin-bottom: 20px;">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span><strong>高锰酸盐最近趋势</strong></span>
            </div>
            <div class="text" id="kmnoDiv" style="height: 300px;">
              
            </div>
         </el-card>
      </div>
      
      <div class="dataShowDiv2" style="margin-bottom: 20px;">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span><strong>氨氮最近趋势</strong></span>
            </div>
            <div class="text" id="nhDiv" style="height: 300px;">
              
            </div>
         </el-card>
      </div>
      
      <div class="dataShowDiv3" style="margin-bottom: 20px;">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span><strong>总磷最近趋势</strong></span>
            </div>
            <div class="text" id="totalpDiv" style="height: 300px;">
              
            </div>
         </el-card>
      </div>
      
      <div class="dataShowDiv4" style="margin-bottom: 20px;">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span><strong>溶解氧最近趋势</strong></span>
            </div>
            <div class="text" id="disDiv" style="height: 300px;">
              
            </div>
         </el-card>
      </div>
      
      <div class="dataShowDiv5" style="margin-bottom: 20px;">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span><strong>ph最近趋势</strong></span>
            </div>
            <div class="text" id="phDiv" style="height: 300px;">
              
            </div>
         </el-card>
      </div>
      
      <div class="factorResultDiv" style="margin-bottom: 20px">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span><strong>指标一般异常原因</strong></span>
          </div>
          <div class="text">
            {{data.factorResult}}
          </div>
        </el-card>
      </div>
      
      <div class="factorSolutionDiv" style="margin-bottom: 20px">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span><strong>指标异常一般解决方法</strong></span>
          </div>
          <div class="text">
            {{data.factorSolution}}
          </div>
        </el-card>
      </div>
    </div>
  </div>
</template>

<script>
   var echarts = require('echarts');
   
  export default{
    data(){
      return {
        reportId: this.$route.params.id,
        data: '',
        sid: '',
        station_name: '',
        equip_id: '',
        equip_name: '',
        equip_model: ''
      }
    },
    mounted(){
      this.init()
    },
    methods: {
      init(){
        this.$store.dispatch('algo/getErrReport',this.reportId).then(response => {
          this.data = response.obj
          this.sid = this.data.sid
          
          this.$store.dispatch('algo/getStaticsDataBySid',this.sid).then(response => {
            const stationData = response.obj
            this.station_name = stationData.name
            this.equip_id = stationData.equipment.id
            this.equip_name = stationData.equipment.name
            this.equip_model = stationData.equipment.model
            
            const waterdatas = stationData.waterdatas
            const ph = []
            const dis = []
            const nh = []
            const kmno = []
            const totalp = []
            const x = []
            
            for(let i = 0;i < waterdatas.length;i++){
              ph.push(waterdatas[i].ph)
              dis.push(waterdatas[i].disslove)
              nh.push(waterdatas[i].nh)
              kmno.push(waterdatas[i].kmno)
              totalp.push(waterdatas[i].totalp)
              x.push(waterdatas[i].formatDate)
            }
            
            const option_kmno = {
                title: {
                    text: '高锰酸盐'
                },
                tooltip: {
                    trigger: 'axis'
                },
                xAxis: {
                    data: x
                },
                yAxis: {
                    splitLine: {
                        show: false
                    }
                },
                visualMap: {
                    top: 10,
                    right: 10,
                    pieces: [{
                        gt: 0,
                        lte: 2,
                        color: '#096'
                    }, {
                        gt: 2,
                        lte: 4,
                        color: '#ffde33'
                    }, {
                        gt: 4,
                        lte: 6,
                        color: '#ff9933'
                    }, {
                        gt: 6,
                        lte: 10,
                        color: '#cc0033'
                    }, {
                        gt: 10,
                        lte: 15,
                        color: '#660099'
                    }, {
                        gt: 15,
                        color: '#7e0023'
                    }],
                    outOfRange: {
                        color: '#999'
                    }
                },
                series: {
                    name: '高锰酸盐',
                    type: 'line',
                    data: kmno,
                    markLine: {
                        silent: true,
                        data: [{
                            yAxis: 2
                        }, {
                            yAxis: 4
                        }, {
                            yAxis: 6
                        }, {
                            yAxis: 10
                        }, {
                            yAxis: 15
                        }]
                    }
                }
            }
            
            const option_nh = {
                title: {
                    text: '氨氮'
                },
                tooltip: {
                    trigger: 'axis'
                },
                xAxis: {
                    data: x
                },
                yAxis: {
                    splitLine: {
                        show: false
                    }
                },
                visualMap: {
                    top: 10,
                    right: 10,
                    pieces: [{
                        gt: 0,
                        lte: 0.15,
                        color: '#096'
                    }, {
                        gt: 0.15,
                        lte: 0.5,
                        color: '#ffde33'
                    }, {
                        gt: 0.5,
                        lte: 1.0,
                        color: '#ff9933'
                    }, {
                        gt: 1.0,
                        lte: 1.5,
                        color: '#cc0033'
                    }, {
                        gt: 1.5,
                        lte: 2.0,
                        color: '#660099'
                    }, {
                        gt: 2.0,
                        color: '#7e0023'
                    }],
                    outOfRange: {
                        color: '#999'
                    }
                },
                series: {
                    name: '氨氮',
                    type: 'line',
                    data: nh,
                    markLine: {
                        silent: true,
                        data: [{
                            yAxis: 0.15
                        }, {
                            yAxis: 0.5
                        }, {
                            yAxis: 1.0
                        }, {
                            yAxis: 1.5
                        }, {
                            yAxis: 2.0
                        }]
                    }
                }
            }
            
            const option_totalp = {
                title: {
                    text: '总磷'
                },
                tooltip: {
                    trigger: 'axis'
                },
                xAxis: {
                    data: x
                },
                yAxis: {
                    splitLine: {
                        show: false
                    }
                },
                visualMap: {
                    top: 10,
                    right: 10,
                    pieces: [{
                        gt: 0,
                        lte: 0.02,
                        color: '#096'
                    }, {
                        gt: 0.02,
                        lte: 0.1,
                        color: '#ffde33'
                    }, {
                        gt: 0.1,
                        lte: 0.2,
                        color: '#ff9933'
                    }, {
                        gt: 0.2,
                        lte: 0.3,
                        color: '#cc0033'
                    }, {
                        gt: 0.3,
                        lte: 0.4,
                        color: '#660099'
                    }, {
                        gt: 0.4,
                        color: '#7e0023'
                    }],
                    outOfRange: {
                        color: '#999'
                    }
                },
                series: {
                    name: '总磷',
                    type: 'line',
                    data: totalp,
                    markLine: {
                        silent: true,
                        data: [{
                            yAxis: 0.02
                        }, {
                            yAxis: 0.1
                        }, {
                            yAxis: 0.2
                        }, {
                            yAxis: 0.3
                        }, {
                            yAxis: 0.4
                        }]
                    }
                }
            }
            
            const option_dis = {
                title: {
                    text: '溶解氧'
                },
                tooltip: {
                    trigger: 'axis'
                },
                xAxis: {
                    data: x
                },
                yAxis: {
                    splitLine: {
                        show: false
                    }
                },
                visualMap: {
                    top: 10,
                    right: 10,
                    pieces: [{
                        gt: 0,
                        lte: 2,
                        color: '#7e0023'
                    }, {
                        gt: 2,
                        lte: 3,
                        color: '#660099'
                    }, {
                        gt: 3,
                        lte: 5,
                        color: '#cc0033'
                    }, {
                        gt: 5,
                        lte: 6,
                        color: '#ff9933'
                    }, {
                        gt: 6,
                        lte: 7.5,
                        color: '#ffde33'
                    }, {
                        gt: 7.5,
                        color: '#096'
                    }],
                    outOfRange: {
                        color: '#999'
                    }
                },
                series: {
                    name: '溶解氧',
                    type: 'line',
                    data: dis,
                    markLine: {
                        silent: true,
                        data: [{
                            yAxis: 2
                        }, {
                            yAxis: 3
                        }, {
                            yAxis: 5
                        }, {
                            yAxis: 6
                        }, {
                            yAxis: 7.5
                        }]
                    }
                }
            }
            
            const option_ph = {
                title: {
                    text: 'ph'
                },
                tooltip: {
                    trigger: 'axis'
                },
                xAxis: {
                    data: x
                },
                yAxis: {
                    splitLine: {
                        show: false
                    }
                },
                visualMap: {
                    top: 10,
                    right: 10,
                    pieces: [{
                        gt: 0,
                        lte: 6,
                        color: '#7e0023'
                    }, 
                    {
                        gt: 6,
                        lte: 9,
                        color: '#ff9933'
                    }, 
                    {
                        gt: 9,
                        color: '#096'
                    }],
                    outOfRange: {
                        color: '#999'
                    }
                },
                series: {
                    name: 'ph',
                    type: 'line',
                    data: ph,
                    markLine: {
                        silent: true,
                        data: [{
                            yAxis: 6
                        }, {
                            yAxis: 9
                        }]
                    }
                }
            }
            
            const chartkmno = echarts.init(document.getElementById('kmnoDiv'))
            chartkmno.setOption(option_kmno)
            
            const chartDis = echarts.init(document.getElementById('disDiv'))
            chartDis.setOption(option_dis)
            
            const chartNh = echarts.init(document.getElementById('nhDiv'))
            chartNh.setOption(option_nh)
            
            const chartTotalp = echarts.init(document.getElementById('totalpDiv'))
            chartTotalp.setOption(option_totalp)
            
            const chartph = echarts.init(document.getElementById('phDiv'))
            chartph.setOption(option_ph)
            
            window.onresize = function() {
              chartkmno.resize()
              chartDis.resize()
              chartNh.resize()
              chartTotalp.resize()
              chartph.resize()
            }
          })
        })
      },
      goBack() {
        if(window.history.length <= 1) {
          this.$router.push({
            path: '/home'
          })
          return false
        } else {
          this.$router.go(-1)
        }
      }
    }
  }
</script>

<style>
  .report {
    width: 100%;
    background-color: #FFFFFF;
  }
  
  .top{
    padding: 20px;
    width: 100%;
    background-color: #B3D8FF;
    margin-bottom: 20px;
  }
  
  .body{
    width: 100%;
    padding: 32px;
  }
</style>