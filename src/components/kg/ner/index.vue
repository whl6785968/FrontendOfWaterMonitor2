<template>
  <div class="ner">
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
       <strong>[查看识别结果]:</strong> 
      </div>
      <div class="rec_content">
        <el-input
          type="textarea"
          :rows="10"
          placeholder="请输入内容"
          v-model="resultArea">
        </el-input>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
  data() {
    return {
      textarea: '',
      resultArea: ''
    }
  },
  methods: {
    predict(){
        this.$store.dispatch('kg/ner',this.textarea).then(response => {
            const data = response.obj
            let res = ''
            for(let i = 0;i < data.length;i++){
              res += data[i] +'\n'
            }
            
            if(res == ''){
              this.resultArea = '没有识别出任何实体'
            }
            
            this.resultArea = res
        })
    }
  }
}
</script>

<style>
  .ner{
   /* padding: 32px;*/
  width: 100%;
  }
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