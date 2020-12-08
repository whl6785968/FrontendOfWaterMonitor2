<template>
  <div id="updateUser" style="width: 100%;height: 100%;text-align: center;">
    <el-form :label-position="labelPosition" label-width="80px" :model="formLabelAlign" style="width: 500px;margin: 0 auto;">
      <el-form-item label="用户名称">
        <el-input v-model="formLabelAlign.name" style="width: 300px"></el-input>
      </el-form-item>
      <el-form-item label="联系方式">
        <el-input v-model="formLabelAlign.link" style="width: 300px"></el-input>
      </el-form-item>
      <el-form-item label="用户描述">
        <el-input v-model="formLabelAlign.descr" style="width: 300px"></el-input>
      </el-form-item>
      <el-form-item label="上传头像">
        <el-upload
            action="/uploadPic"
            :headers="headers"
            :multiple="false"
            :show-file-list="false"
            class="avatar-uploader"
            :on-remove="handleRemove"
            :on-success="handleSuccess">
             <img v-if="dialogImageUrl" :src="dialogImageUrl" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
         
      </el-form-item>
      
      <el-form-item>
        <el-button type="primary" @click="onSubmit">修改 </el-button>
        <el-button>取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
  import { getToken } from '@/utils/auth'
  
  export default {
    data() {
      return {
        labelPosition: 'right',
        formLabelAlign: {
          name: '',
          link: '',
          descr: '',
          avatar: '',
          userid: sessionStorage.getItem('username')
        },
        
        dialogImageUrl: '',
        dialogVisible: false,
        headers: {'X-Token':getToken()}
      };
    },
    inject: ['reload'],
    methods: {
       handleRemove(file, fileList) {
        console.log(file, fileList);
        this.$store.dispatch('msg/deleteFile',file.response.obj).then(response => {
          if(response.status == 200){
            this.$message({
              message: '删除成功',
              type: 'success'
            })
          }
        })
      },
      handleSuccess(response,file,fileList){
        this.dialogImageUrl = file.response.obj
        this.formLabelAlign.avatar = response.obj
      },
      onSubmit(){
//      alert(JSON.stringify(this.formLabelAlign))
        this.$store.dispatch('user/updateUserInfo',this.formLabelAlign).then(response => {
          if(response.status == 200){
            this.$message.success(response.msg)
            this.reload()
          }
          else{
            this.$message.error(response.msg)
          }
        })
      }
    }
  }
</script>

<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 100px;
    height: 100px;
    line-height: 100px;
    text-align: center;
  }
  .avatar {
    width: 100px;
    height: 100px;
    display: block;
  }
</style>