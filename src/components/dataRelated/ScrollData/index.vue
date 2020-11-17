<template>
  <div id="scorllData">
    <dv-scroll-board :config="config1" style="height:600px;margin: auto;" />
  </div>
</template>

<script>
  export default {
    data() {
      return {
        config1: {}
      }
    },
    mounted() {
      this.initData()
    },
    methods: {
      initData() {
        let arr = []
        this.$store.dispatch('report/getNewestData').then(response => {

              const data = response.obj
              for(let i = 0;i < data.length;i++){
                let tmp = [
                  data[i].district,data[i].province,data[i].id,data[i].station,data[i].status,data[i].createTime,data[i].ph,data[i].dis,
                  data[i].nh,data[i].kmno,data[i].totalp
                ]
                let level = data[i].level
                switch(level){
                  case 1:
                    tmp.push('Ⅰ')
                    break
                  case 2:
                    tmp.push('Ⅱ')
                    break
                  case 3:
                    tmp.push('Ⅲ')
                    break
                  case 4:
                    tmp.push('Ⅳ')
                    break
                  case 5:
                    tmp.push('Ⅴ')
                    break
                  case 6:
                    tmp.push('劣Ⅴ')
                    break
                }
                arr.push(tmp)
                console.log(tmp)
              }
              
              const config = {
                    header: ['所属流域', '所属省市', '站点编号','站点名称','站点状态','更新时间','pH','溶解氧(mg/L)','氨氮(mg/L)','高锰酸盐指数(mg/L)','总有机碳','水质类别'],
                    data: arr,
                    headerBGC: '#4c60ff',
//                  oddRowBGC: '',
                    //        evenRowBGC: '',
                    align: 'center',
                    rowNum: 8
                  }
              
              this.config1 = config

        })
      }

    }
  }
</script>

<style>

</style>