<template>
  <div id="re">
    <div class="text_input">
      <div class="text_title">
       <strong>输入文本:</strong> 
      </div>
      <div class="text_content">
        <el-input
          type="textarea"
          :rows="10"
          placeholder="请输入内容"
          v-model="textarea">
        </el-input>
        <div class="submit">
          <el-button type="primary" style="width: 350px;margin-top: 20px;" @click="predict">提交！</el-button>
        </div>
      </div>
    </div>
    <div class="rec_result">
      <div class="rec_title">
       <strong>[查看抽取结果]:</strong> 
      </div>
      <div class="rec_content">
        <el-input
          type="textarea"
          :rows="10"
          placeholder=""
          v-model="resultArea">
        </el-input>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        textarea: '',
        resultArea: ''
      }
    },
    methods: {
      predict(){
        
      }
    }
  }
</script>

<style>
  .rec_content{
    background-color: white;
    padding: 30px;
    box-shadow: darkgrey 10px 10px 30px 5px;
    width: 100%;
  }
  .text_content{
    background-color: white;
    padding: 30px;
    box-shadow: darkgrey 10px 10px 30px 5px;
    width: 100%;
  }
  .text_title{
    background-color: #F0F2F5;
    padding: 10px;
    box-shadow: darkgrey 10px 10px 30px 5px;
    width: 100%;
  }
  .submit{
    width: 100%;
    text-align: center;
  }
  .rec_result{
   margin-top: 20px;
  }
  .rec_title{
      background-color: #F0F2F5;
      padding: 10px;
      box-shadow: darkgrey 10px 10px 30px 5px;
      width: 100%;
  }
</style>