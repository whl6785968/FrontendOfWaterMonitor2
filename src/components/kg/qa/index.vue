<template>
  <div id="qaDiv">
    <div class="text_input">
      <div class="text_title">
       <strong>输入问题:</strong> 
      </div>
      <div class="text_content">
        <el-input
        type="textarea"
        autosize
        placeholder="请输入内容"
        v-model="textarea1">
      </el-input>
      <div class="submit">
          <el-button type="primary" style="width: 200px;margin-top: 20px;" @click="getAnswer">提交！</el-button>
       </div>
      </div>
    </div>
     <div class="qa_result">
      <div class="qa_title">
       <strong>[查看答案]:</strong> 
      </div>
      <div class="qa_content">
        <el-input
          type="textarea"
          :rows="10"
          placeholder="请输入内容"
          v-model="textarea2">
        </el-input>
      </div>
    </div>
  </div>
</template>

<script>
  export default{
    data(){
      return {
        textarea1: '',
        textarea2: ''
      }
    },
    methods: {
        getAnswer(){
          this.textarea2 = ''
          this.$store.dispatch('kg/qa',this.textarea1).then(response => {
            const data = response.obj
            
            for(let i = 0;i < data.length;i++){
              this.textarea2 += data[i] + '\n'
            }
          })
        }
      }
  }
</script>

<style>
  .text_title{
    background-color: #F0F2F5;
    padding: 10px;
    box-shadow: darkgrey 10px 10px 30px 5px;
    width: 100%;
  }
  
  .qa_title{
      background-color: #F0F2F5;
      padding: 10px;
      box-shadow: darkgrey 10px 10px 30px 5px;
      width: 100%;
  }
  
  .qa_content{
    background-color: white;
    padding: 30px;
    box-shadow: darkgrey 10px 10px 30px 5px;
    width: 100%;
  }
  
  .qa_result{
    margin-top: 20px;
  }
</style>