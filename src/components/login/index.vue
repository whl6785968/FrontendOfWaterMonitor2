<template>
  <div class="login">
    <el-card class="box-card">
      <!--<div style="margin-bottom: 50px;">-->
        <!--<img src="../../../static/logo3.png"  height="100px" width="100px"/>
        <img src="../../../static/logo2.png"  height="70px" width="230px" style="margin-top: 10px;"/>-->
        <!--<h4>水质在线监控系统</h4>
      </div>-->
      
      <div slot="header" class="clearfix" style="text-align: center;">
        <span><h4>水质在线监控系统</h4></span>
      </div>
      
      <el-form style="margin-top: 35px;" :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" label-position="left" class="demo-ruleForm login-container">
        <!--<span class="title" style="margin-left: 150px;"><h3>BOSITU管理系统</h3></span>-->
        <el-form-item style="text-align: center;" label="账号" prop="username">
          <el-input type="text" v-model="ruleForm.username" autocomplete="off" size="medium"></el-input>
        </el-form-item>
        <el-form-item style="text-align: center;" label="密码" prop="password">
          <el-input type="password" v-model="ruleForm.password" autocomplete="off" size="medium"></el-input>
        </el-form-item>
        <el-form-item style="margin-top: 50px;">
          <el-button type="primary" @click.native.prevent="submitForm('ruleForm')" size="small" style="width: 100px;margin-left: -40px;">登录</el-button>
          <el-button @click="resetForm('ruleForm')" size="small" style="width: 100px;">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
  export default {
    data() {
      var validatePwd = (rule, value, callback) => {
        if(value == '') {
          callback(new Error("请输入密码"))
        } else {
          callback()
        }
      };

      var validateUsername = (rule, value, callback) => {
        if(value === '') {
          callback(new Error('请输入用户名'));
        } else {
          callback();
        }
      };

      return {
        ruleForm: {
          username: '',
          password: ''
        },
        rules: {
          password: [{
            validator: validatePwd,
            trigger: 'blur'
          }],
          username: [{
            validator: validateUsername,
            trigger: 'blur'
          }]
        }
      }
    },
    created() {
      if(this.$store.state.routes.length > 0) {
        location.reload()
      }
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if(valid) {
            this.$store.dispatch('user/login', this.ruleForm).then(result => {
              if(result.token != null) {
                this.$store.state.currUserId = this.ruleForm.username
                sessionStorage.setItem("username", this.ruleForm.username)
                this.$router.push("/")
                this.$message({
                  message: '登陆成功',
                  type: 'success'
                })
              } else {
                this.$router.push("/login")
                this.$message({
                  message: '请登录',
                  type: 'warning'
                })
              }
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>

<style scoped>
  .box-card {
    height: 400px;
    width: 400px;
    padding: 10px;
  }
  .login {
    display: flex;
    justify-content: center;
    align-items: center;
    /*height: 838px;*/
   height: 100%;
   width: 100%;
    background-image: url(../../../static/bg2.jpg);
    background-size: cover;
  }
  
  body {
    margin: 0px;
  }
</style>