<template>
  <div id="dynamicDiv" style="background-color: #06132F;height: 100%;width: 100%;">
    <!--<font color="#FFFFFF">xixiix</font>-->
    <div id="header" style="text-align: center;margin-bottom: 20px;margin-top: 20px;">
      <font size="5" color="#FFFFFF"><strong>全国各站点实时数据监控</strong></font>
    </div>
    <div id="container" style="width: 100%;height: 100%;" class="row">
      <div class="col-md-4" v-for="(item,index) in stationIds">
        <dv-border-box-8><div :id="item" style="height: 400px;"></div></dv-border-box-8>
        
      </div>
      
      <!--<el-button type="primary" style="height: 50px;" @click="getDynamicDataBySid">按我</el-button>-->
    </div>

  </div>
</template>

<script>
  import Stomp from 'stompjs'
  import SockJS from 'sockjs-client'
  var echarts = require('echarts');
  
  export default {
    data() {
      return {
        stationIds: [],
        stationNames: [],
        station_cnt: 0,
        options: {},
        features: ['ph', 'disslove', 'nh', 'kmno', 'totalp'],
        cnt_arr: {}
      }
    },
    mounted() {
//    this.tst()
//    this.connect()
      this.getStations()
    },
    methods: {
      getStations() {
        this.$store.dispatch("datar/getStations").then(response => {
          const data = response.obj
          for(let i = 0; i < data.length; i++) {
            this.connect(data[i].id)
            this.stationIds.push(data[i].id)
            this.stationNames.push(data[i].name)
            
          }
          
          this.station_cnt = this.stationIds.length
          for(let i = 0;i < this.station_cnt;i++){
            this.initOption(this.stationIds[i], this.stationNames[i]) 
          }
                    
          console.log(this.options)
          for(let i = 0;i < this.station_cnt;i++){
            this.getDynamicDataBySid(this.stationIds[i])
            this.cnt_arr[this.stationIds[i]] = 0
          }
        })
      },
      initOption(station_id, station_name) {
        this.$store.dispatch("datar/getDataBySid", station_id).then(response => {
          const data = response.obj
          const x = []
          const chartData = {
            'ph': [],
            'disslove': [],
            'nh': [],
            'kmno': [],
            'totalp': []
          }

          for(let i = 0; i < data.length; i++) {
            x.push(data[i].formatDate)
            for(let key in data[i]) {
              if(chartData.hasOwnProperty(key)) {
                chartData[key].push(data[i][key])
              }
            }
          }

          let seriesData = []
          for(let key in chartData) {
            seriesData.push({
              name: key,
              data: chartData[key],
              type: 'line',
            })
          }
        
          let option_line = {
            title: {
              text: station_name + '指标趋势图',
              textStyle: {
                width: '100%',
                color: '#FFF'
              },
              left: 'center',
//            textAlign:'center'

            },
            xAxis: {
              type: 'category',
              data: x,
              axisLine: {
                lineStyle: '#FFF'

              },
              show: true,
              axisLabel: {
                color: '#FFF'
              }
            },
            yAxis: {
              type: 'value',
              axisLine: {
                lineStyle: '#FFF'

              },
              show: true,
              axisLabel: {
                color: '#FFF'
              }
            },
            series: seriesData,
            tooltip: {
              trigger: 'axis'
            },
            legend: {
              data: ['ph', 'disslove', 'nh', 'kmno', 'totalp'],
              textStyle: {
                color: "#FFF"
              },
              left: '15%',
              top: '30'
            }
          }
          
          this.options[station_id] = option_line
          let chart_id = station_id.toString()
          let chart2 = echarts.init(document.getElementById(chart_id),'dark')
  
          chart2.setOption(this.options[station_id])
          window.onresize = function() {
            chart2.resize()
          }
        })

      },
      getDynamicDataBySid(station_id) {
        this.$store.dispatch("datar/getDynamicDataBySid", station_id)
      },
      connect(station_id) {
        let stomp = Stomp.over(new SockJS("http://localhost:8088/ws/pullMsg"))
        stomp.connect({}, frame => {
          stomp.subscribe("/topic/getDynamicData_" + station_id, message => {
            if(this.cnt_arr[station_id] != 0){
              const data = JSON.parse(message.body)
              
              if(this.options[station_id].xAxis.data.length == 20){
                for(let i = 0;i < data.length;i++){
                  this.options[station_id].xAxis.data.pop()
                  this.options[station_id].xAxis.data.unshift(data[i].formatDate)
                  for(let j = 0;j < this.features.length;j++){
                    this.options[station_id].series[j].data.pop()
                    this.options[station_id].series[j].data.unshift(data[i][this.features[j]])
                  }
                }
              }
             else{
               for(let i = 0;i < data.length;i++){
                this.options[station_id].xAxis.data.unshift(data[i].formatDate)
                for(let j = 0;j < this.features.length;j++){
                  this.options[station_id].series[j].data.unshift(data[i][this.features[j]])
                }
               }
              
             }
              let chart_id = station_id.toString()
              let chart2 = echarts.init(document.getElementById(chart_id),'dark')
      
              chart2.setOption(this.options[station_id])
              window.onresize = function() {
                chart2.resize()
              }
            }
            else{
              this.cnt_arr[station_id] += 1
            }
              
            
          })
        })
      },
      timeFormat(dateStr, needHour) {
        var dt = new Date(dateStr)
        var y = dt.getFullYear()
        var m = (dt.getMonth() + 1).toString().padStart(2, "0")
        var d = dt.getDate().toString().padStart(2, "0")

        var res = `${y}-${m}-${d}`
        if(needHour) {
          var h = dt.getHours().toString().padStart(2, "0")
          var minute = dt.getMinutes().toString().padStart(2, "0")
          res = `${y}-${m}-${d} ${h}:${minute}`
        }

        return res
      },
    }
  }
</script>

<style>
  * {
    margin: 0;
    padding: 0;
  }
</style>