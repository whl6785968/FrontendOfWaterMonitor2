<template>
  <div>
    <el-button type="primary" @click="tst">
      点我
    </el-button>
   
    <div class="row">
      <div class="col-md-3" style="border: 1px red solid;">.col-md-4</div>
      <div class="col-md-6" style="border: 1px red solid;">.col-md-4</div>
      <div class="col-md-3" style="border: 1px red solid;">.col-md-4</div>
    </div>
    <div class="row">
      <div class="col-md-6">.col-md-6</div>
      <div class="col-md-6">.col-md-6</div>
    </div>
  </div>
</template>

<script>
  var echarts = require('echarts');
  export default {
    data() {
      return {
        sentence: '王海龙就读于南京理工大学'
      }
    },
    mounted() {

    },
   
    methods: {
      tst() {
        this.$store.dispatch('kg/ner',this.sentence).then(response => {

        })
      }
    }

  }
</script>

<style>
  #pic_dis {
    margin-left: 500px;
  }
</style>