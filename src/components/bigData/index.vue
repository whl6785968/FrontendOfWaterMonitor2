<template>
  <div class="bd" style="width: 100%;height:100%;background-color: #06132F;">
    <div id="header" style="text-align: center;margin-top: 20px;">
      <div>
        <div style="">
          <font color="#FFFFFF" size="5"><strong>全国水质数据展示平台</strong></font>
          <!--<dv-decoration-3 style="width:250px;height:30px;" />-->
          <el-button type="text" @click="handleFullScreen" style="float: right;padding-right: 20px;">{{fullscreen ? '取消全屏':'全屏'}}</el-button>
        </div>
        
        <div id="timeDiv"></div>

      </div>
    </div>
    <div id="container" style="width: 100%;height: 100%;" class="row">
      <div class="col-md-4" style="height: 100%;">
        <div class="left_header" style="">
          <dv-border-box-12>
            <div id="pie" style="height: 300px;margin: auto;padding: 20px;"></div>
          </dv-border-box-12>
        </div>
        <div class="left_middle" style="">
          <dv-border-box-12 style="height: 300px;">
            <!--<dv-charts :option="option_line" style="height: 300px;margin: auto;" />-->
            <div id="station_line" style="height: 300px;margin: auto;"></div>
          </dv-border-box-12>
        </div>
        <div class="left_bottom" style="height: 300px;">
          <dv-border-box-12 style="padding: 8px;">
            <!--<div style="text-align: center;">
              <font size="3" color="#FFFFFF"><strong>各流域WQI指数 </strong></font>
            </div>-->
            
            <!--<div>
              <div style="border-radius: 50%;border:10px #00A8FF solid;box-shadow: 0 0 1px 1px #00A8FF;text-align:center;width: 120px;height: 120px;padding: 25px;">
                <font size="4" color="#00A8FF"><strong>WQI</strong></font>
                <font size="4" color="#00A8FF"><strong>2.8</strong></font>
              </div>
            </div>-->
            
            <div style="text-align: center; background-color: #091C3B;margin-bottom: 20px;">
              <font size="3" color="#FFFFFF"><strong>各流域WQI指数</strong></font>
              <!--<font size="5" color="#FFFFFF">各流域WQI指数</font>-->
            </div>
            <dv-capsule-chart :config="config_basin" style="height:200px;width:400px;margin: auto;" />
          </dv-border-box-12>
        </div>
      </div>

      <div class="col-md-4" style="height: 100%;">
        <div class="middle_bottom" style="height: 650px;">
          <dv-border-box-9>
            <div class="box-water" id="tstArea" style="height: 500px;width: 500px;"></div>
            <div>
               
            </div>
          </dv-border-box-9>
        </div>
        <div class="middle_header" style="height: 200px;">
          <dv-border-box-12 style="height: 250px;">
            <div style="display: flex;padding-top: 10px;">
              <div style="width: 150px;text-align: center;">
                <font color="#13CE66" size="6"><strong>{{station_normal_num}}</strong></font>
                <div>
                  <font color="#FFFFFF" size="2">正常站点数</font>
                </div>
              </div>
              <div style="flex: 1;text-align: center;">
                <font color="#DD6161" size="6"><strong>{{station_err_num}}</strong></font>
                <div>
                  <font color="#FFFFFF" size="2">异常站点数</font>
                </div>
              </div>
              <div style="width: 150px;text-align: center;">
                <font color="#F0C78A" size="6"><strong>{{station_stop_num}}</strong></font>
                <div>
                  <font color="#FFFFFF" size="2">维修站点数</font>
                </div>
              </div>
            </div>
          </dv-border-box-12>

        </div>
        
      </div>
      <!--style="height:100%;width: 450px;display: flex;flex-direction: column;"-->
      <div class="col-md-4" style="height: 100%;">
        <div class="right_middle" style="">
          <dv-border-box-12 style="padding: 8px;">
            <div style="text-align: center; background-color: #091C3B;margin-bottom: 20px;">
              <font size="3" color="#FFFFFF"><strong>站点情况</strong></font>
              <!--<font size="5" color="#00ECFF">站点情况</font>-->
            </div>
            <dv-scroll-board :config="config1" style="height:420px;margin: auto;" />
          </dv-border-box-12>
        </div>
        <div class="right_header">
          <dv-border-box-12 style="height: 410px;padding: 15px;">
            <div style="text-align: center;">
              <font size="3" color="#FFFFFF"><strong>水质排行榜</strong></font>
            </div>
            <dv-scroll-ranking-board :config="config_scroll" style="height:350px;margin: auto;" />
          </dv-border-box-12>
        </div>
        
        <!--<div class="right_bottom"></div>-->
      </div>

    </div>
  </div>
</template>

<script>
  var echarts = require('echarts');
  import chinaJson from './china.json'
  import Swiper from 'swiper'; 
  
  export default {
    data() {
      return {
        slide: [1,2,3,4,5],
        station_normal_num: 0,
        station_err_num: 0,
        station_stop_num: 0,
        fullscreen: false,
        option_pie: '',
        station_data: [],
        geoCoordMap: {},
        config_basin: {},
        option_line: {},
        config_scroll: {},
        config1: {},
        option1: '',
        curry: [],
        station_id: [],
        station_name: [],
        station_cnt: 0,
        start_staion_index: 0
      }
    },
    inject: ['reload'],
    mounted() {
      this.getStations()
      this.timeMove()
      this.getNewestData()
      this.getWQIByDistrict()
      this.getBasicData()
      this.getWQIByStation()
      this.openWS()
    },
    destroyed(){
      this.closeWS()
    },
    updated() {
      
    },
    watch: {
      routes: function(val) {},
      changeMsg: function(val){
//      alert(val)
        this.reload()
      }     
    },
    computed: {
      routes() {
        return this.$store.state.routes
      },
      changeMsg(){
        return this.$store.state.msg.bdStatus
      }
    },
    methods: {
      openWS(){
        this.$store.dispatch("msg/connectForBd");
      },
      closeWS(){
        this.$store.dispatch("msg/closeForBd")
      },
      getWQIByStation(){
         this.$store.dispatch("datar/getWQIByStation").then(response => {
           const data = response.obj
           const config = {
             data: [],
             sort: false
           }
           
           for(let key in data){
             config.data.push({
               name: key,
               value: data[key].toFixed(2)
             })
           }
           config.data.sort(function(a,b){
             return b.value - a.value
           })
           this.config_scroll = config
         })
      },
      getWQIByDistrict(){
        this.$store.dispatch("datar/getWQIByDistrict").then(response => {
          const data = response.obj
          const config = {
            data: [],
            showValue: true
          }
          for(let key in data){
            config.data.push({
              name: key,
              value: data[key].toFixed(2)
            })
          }
          
          config.data.sort(function(a,b){
            return a.value - b.value
          })
          this.config_basin = config
        })
      },
      initOption() {
        this.option_pie = {
          title: {
            text: '当前水质情况',
            x: 'center',
            textStyle: {
              color: "#FFFFFF"
            }
          },
          tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
          },
          legend: {
            orient: 'vertical',
            left: 'left',
            data: this.tx,
            textStyle: {
              color: "#FFFFFF"
            }
          },
          series: [{
            name: '数量',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: this.curry,
            itemStyle: {
              emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }]
          }
        },
        showCharts() {
            let chart1 = echarts.init(document.getElementById('pie'), 'light')           
            chart1.setOption(this.option_pie)
            window.onresize = function() {
              chart1.resize()  
            }
          },
          getCreateTime() {
            let date = new Date()
            let sep = '-'
            let year = date.getFullYear()
            let month = date.getMonth() + 1
            let day = date.getDate();

            let create_time = year + sep + month + sep + day

            return create_time
          },
          getWaterDataBySid(station_index){
            let stationId = this.station_id[station_index]
            this.$store.dispatch("datar/getDataBySid",stationId).then(response => {
              const data = response.obj
              const x = []
              const chartData = {
                'ph': [],
                'disslove': [],
                'nh': [],
                'kmno': [],
                'totalp': []
              }

              for(let i = 0;i < data.length;i++){
                x.push(data[i].formatDate)
                for(let key in data[i]){
                  if(chartData.hasOwnProperty(key)){                 
                    chartData[key].push(data[i][key])
                  }
                }
              }
              
              let seriesData = []
              for(let key in chartData){
                seriesData.push({
                  name: key,
                  data: chartData[key],
                  type: 'line',
//                smooth: true
                })
              }
              
              const option_line = {
                title:{
                  text: this.station_name[station_index]+'指标趋势图',
                  textStyle: {
                    color: '#FFF'
                  },
                  left: '33%',
                  top: '10'
                },
                xAxis: {
                  type: 'category',
                  data: x,
                  axisLine: {
                    lineStyle: '#FFF'

                  },
                  show: true,
                  axisLabel:{
                      color: '#FFF'
                  }
                },
                yAxis: {
                  type: 'value',
                  axisLine: {
                    lineStyle: '#FFF'

                  },
                  show: true,
                  axisLabel:{
                      color: '#FFF'
                  }
                },
                series: seriesData,
                tooltip: {
                    trigger: 'axis'
                },
                legend:{
                  data: ['ph', 'disslove', 'nh','kmno','totalp'],
                  textStyle:{
                    color: "#FFF"
                  },
//                right: '10',
                  left: '15%',
                  top: '30'
                }
              }
              
              this.option_line = option_line
              
              let chart2 = echarts.init(document.getElementById('station_line'))
              
              chart2.setOption(option_line)
              window.onresize = function() {
                chart2.resize()
              }
              
              this.start_staion_index += 1
 
//            this.refreshLineChart()
            })
          },
          refreshLineChart(){
            let timeFun
            if(timeFun != null){
              timeFun.close()
            }
            
            timeFun = setInterval(() => {
              if(this.start_staion_index % this.station_cnt == 0){
                this.start_staion_index = 0
              }
              
              this.getWaterDataBySid(this.start_staion_index)
              
              let chart2 = echarts.init(document.getElementById('station_line'),'light')
              chart2.clear()
              chart2.setOption(this.option_line)
              window.onresize = function() {
                chart2.resize()
              }
              
            },10000)
          },
          getBasicData(){
            this.$store.dispatch('datar/getBasicData').then(response => {
              const data = response.obj
              this.station_normal_num = data.station_normal_num
              this.station_err_num = data.station_err_num
              this.station_stop_num = data.station_stop_num
            })
          },
          getStations() {
            this.$store.dispatch('datar/getStations').then(response => {
              const data = response.obj
              const geoCoordMap = {}
              const station_data = []

              for(let i = 0; i < data.length; i++) {
                station_data.push({
                  name: data[i].name,
                  value: data[i].isAlert
                })
                
                this.station_id.push(data[i].id)
                this.station_name.push(data[i].name)
                this.station_cnt += 1
                let name = data[i].name
                geoCoordMap[name] = []
                geoCoordMap[name].push(data[i].longtitude)
                geoCoordMap[name].push(data[i].latitude)
              }
             
              this.getWaterDataBySid(0)
              this.refreshLineChart()
              this.station_data = station_data
              this.geoCoordMap = geoCoordMap
              this.initChart()

              let cur_one = 0
              let cur_two = 0
              let cur_three = 0
              let cur_four = 0
              let cur_five = 0
              let cur_six = 0

              for(let i = 0; i < data.length; i++) {
                switch(data[i].currlevel) {
                  case 1:
                    cur_one += 1
                    break
                  case 2:
                    cur_two += 1
                    break
                  case 3:
                    cur_three += 1
                    break
                  case 4:
                    cur_four += 1
                    break
                  case 5:
                    cur_five += 1
                    break
                  case 6:
                    cur_six += 1
                    break
                }
              }

              const cur_level = []
              cur_level.push({
                name: 'Ⅰ类',
                value: cur_one
              })
              cur_level.push({
                name: 'Ⅱ类',
                value: cur_two
              })
              cur_level.push({
                name: 'Ⅲ类',
                value: cur_three
              })
              cur_level.push({
                name: 'Ⅳ类',
                value: cur_four
              })
              cur_level.push({
                name: 'Ⅴ类',
                value: cur_five
              })
              cur_level.push({
                name: '劣Ⅴ类',
                value: cur_six
              })

              this.curry = cur_level
              this.initOption()
              this.showCharts()
            })
          },
          getNewestData() {
            let arr = []
            this.$store.dispatch('report/getNewestData').then(response => {
              const data = response.obj
              for(let i = 0; i < data.length; i++) {
                let tmp = [data[i].district, data[i].province,data[i].station]
                let level = data[i].level
                switch(level){
                  case 1:
                    level = "<font color='#CCFFFF'>Ⅰ</font>"
                    break
                  case 2:
                    level = "<font color='#00CCFF'>Ⅱ</font>"
                    break
                  case 3:
                    level = "<font color='#00FF00'>Ⅲ</font>"
                    break
                  case 4:
                    level = "<font color='#ffff00'>Ⅳ</font>"
                    break
                  case 5:
                    level = "<font color='#ff9900'>Ⅴ</font>"
                    break
                  case 6:
                    level = "<font color='#ff5050'>劣Ⅴ</font>"
                    break
                }
                tmp.push(level)
                tmp.push(this.timeFormat(data[i].createTime,false))
                arr.push(tmp)
              }

              const config = {
                header: ['所属区域','所属省市','站点名称','站点等级','更新时间'],
                data: arr,
                headerBGC: '#4c60ff',
                oddRowBGC: '',
                //        evenRowBGC: '',
                align: 'center',
                rowNum: 6
              }

              this.config1 = config

            })

            //      alert(arr)
          },
          timeFormat(dateStr,needHour) {
            var dt = new Date(dateStr)
            var y = dt.getFullYear()
            var m = (dt.getMonth() + 1).toString().padStart(2, "0")
            var d = dt.getDate().toString().padStart(2, "0")
            
            var res = `${y}-${m}-${d}`
            if(needHour){
              var h = dt.getHours().toString().padStart(2, "0")
              var minute = dt.getMinutes().toString().padStart(2, "0")
              res = `${y}-${m}-${d} ${h}:${minute}`
            }

            return res
          },
          timeMove() {
            let timeDiv = document.getElementById("timeDiv")
            setInterval(function() {
              let dt = new Date()
              let y = dt.getFullYear()
              let m = dt.getMonth() + 1
              let d = dt.getDate()
              let h = dt.getHours()
              let minute = dt.getMinutes()
              let s = dt.getSeconds()

              let t = "<font color='#FFF'>" + y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + s + "</font>"

              timeDiv.innerHTML = t
            }, 1000)
          },
          handleFullScreen() {
            let element = document.documentElement;
            if(this.fullscreen) {
              if(document.exitFullscreen) {
                document.exitFullscreen();
              } else if(document.webkitCancelFullScreen) {
                document.webkitCancelFullScreen();
              } else if(document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
              } else if(document.msExitFullscreen) {
                document.msExitFullscreen();
              }
            } else {
              if(element.requestFullscreen) {
                element.requestFullscreen();
              } else if(element.webkitRequestFullScreen) {
                element.webkitRequestFullScreen();
              } else if(element.mozRequestFullScreen) {
                element.mozRequestFullScreen();
              } else if(element.msRequestFullscreen) {
                // IE11
                element.msRequestFullscreen();
              }
            }
            this.fullscreen = !this.fullscreen;
          },
          formatter(number) {
            const numbers = number.toString().split('').reverse()
            const segs = []

            while(numbers.length) segs.push(numbers.splice(0, 3).join(''))

            return segs.join(',').split('').reverse().join('')
          },
          convertData(data) {
            const geoCoordMap = this.geoCoordMap
            var res = [];
            for(var i = 0; i < data.length; i++) {
              var geoCoord = geoCoordMap[data[i].name];
              if(geoCoord) {
                res.push({
                  name: data[i].name,
                  value: geoCoord.concat(data[i].value)
                });
              }
            }

            return res;
          },
//        convertLineData(data){
//          let res = []
//          for(let i = 0;i < data.length;i++){
//            let 
//          }
//          
//        },
          initChart() {
            echarts.registerMap('china', chinaJson)
            const data = this.station_data
            const option1 = {
              tooltip: {
                trigger: 'item'
              },
              geo: {
                map: 'china',
                label: {
                  emphasis: {
                    show: false
                  }
                },
                //禁止方法缩小
                roam: false,
                itemStyle: {
                  normal: {
                    areaColor: '#072657',
//                  002097
                    borderColor: '#FFFFFF'
                  },
                  emphasis: {
                    areaColor: '#293fff'
                  }
                },
              },
              series: [{
                  name: '正常站点',
                  type: 'scatter',
                  coordinateSystem: 'geo',
                  data: this.convertData(data),
                  encode: {
                    value: 2
                  },
                  label: {
                    formatter: '{b}',
                    position: 'right',
                    show: false
                  },
                  itemStyle: {
                    color: '#00ff00'
                  },
                  emphasis: {
                    label: {
                      show: true
                    }
                  }
                },
                {
                  name: '异常站点',
                  type: 'effectScatter',
                  coordinateSystem: 'geo',
                  data: this.convertData(data.filter(function(a) {
                    return a.value == 1
                  })),
//                symbolSize: function(val) {
//                  return val[2] * 3;
//                },
                  encode: {
                    value: 2
                  },
                  showEffectOn: 'render',
                  rippleEffect: {
                    brushType: 'stroke'
                  },
                  hoverAnimation: true,
                  label: {
                    formatter: '{b}',
                    position: 'right',
                    show: true
                  },
                  itemStyle: {
                    color: 'red',
                    shadowBlur: 10,
                    shadowColor: '#333'
                  },
                  zlevel: 1
                }
              ]
            }

            var chart1 = echarts.init(document.getElementById("tstArea"))
            chart1.setOption(option1)
            window.onresize = function() {
              chart1.resize()
            }
          }
      }
    }

    //流域模型？怎么做？
    //流域面积+4
</script>

<style>
  * {
    padding: 0;
    margin: 0;
  }
  
  #header {
    /*position: fixed;
    left: 0;
    top: 0;
    right: 0;
    bottom: 0;*/
  }
  
  .swiper-slide {
    width: 100%;
    height: 200px;
    line-height: 200px;
    font-size: 50px;
    text-align: center;
    background-color: rosybrown;
  }
</style>