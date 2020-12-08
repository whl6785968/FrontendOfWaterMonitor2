<template>
  <div class="userinfo">
    <el-row :gutter="5">
      <el-col :span="8">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span style="font-size:15px; float: left;">个人信息</span>
            <!--<span style="float: right;">
              <el-upload
              class="upload-demo"
              action="/uploadPic"
              :headers="headers"
              :on-remove="handleRemove"
              :on-success="handleSuccess"
              multiple="false"
              :file-list="fileList">
              <el-button style="float: right; padding: 3px 0" type="text">上传头像</el-button>
            </el-upload>
            </span>-->
            <el-button style="float: right; padding: 3px 0" type="text" @click="dialogVisible = true">修改密码</el-button>
          </div>
          <div>
            <img :src="user_info.avatar" width="100px" height="100px"/>
            <table>
              <tr>
                <td align="left"><i class="el-icon-s-custom"></i>登录账号：</td>
                <td style="text-align: right;">{{username}}</td>
              </tr>
              <tr>
                <td align="left"><i class="el-icon-user"></i>用户名称：</td>
                <td style="text-align: right;">{{user_info.name}}</td>
              </tr>
              <tr>
                <td align="left"><i class="el-icon-female"></i>用户性别：</td>
                <td style="text-align: right;">{{user_info.sex}}</td>
              </tr>
              <tr>
                <td align="left"><i class="el-icon-service"></i>用户年龄：</td>
                <td style="text-align: right;">{{user_info.age}}</td>
              </tr>
              <tr >
                <td align="left"><i class="el-icon-mobile-phone"></i>联系方式：</td>
                <td style="text-align: right;">{{user_info.link}}</td>
              </tr>
              <tr>
                <td align="left"><i class="el-icon-chat-dot-square"></i>用户描述：</td>
                <td style="text-align: right;">{{user_info.descr}}</td>
              </tr>
            </table>
          </div>
        </el-card>
      </el-col>
      
      <el-col :span="16">
        <el-card class="box-card" style="width: 100%;">
          <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
            <el-tab-pane label="修改资料" name="first"><updateUser></updateUser></el-tab-pane>
            <el-tab-pane label="操作日志" name="second"><userLog></userLog></el-tab-pane>
          </el-tabs>
        </el-card>
        
      </el-col>
    </el-row>
      
    <el-dialog
      title="请输入新密码"
      :visible.sync="dialogVisible"
      width="30%"
      :modal-append-to-body = false 
      >
      <el-form :model="passForm" status-icon :rules="passRules" ref="passForm" label-width="100px" class="demo-passForm" label-position='left'>
        <el-form-item label="密码" prop="pass">
          <el-input type="password" v-model="passForm.pass" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="checkPass">
          <el-input type="password" v-model="passForm.checkPass" autocomplete="off"></el-input>
        </el-form-item>
      
        <el-form-item>
          <el-button type="primary" @click="updatePassword('passForm')">提交</el-button>
          <el-button @click="dialogVisible = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
  import { getToken } from '@/utils/auth'
  import userLog from '@/components/userLog/'
  import updateUser from '@/components/updateUser'
  
  export default {
    data() {
      let checkNumber = (rule,value,callback) => {
        if(!value){
          return callback(new Error('联系方式不能为空'))
        }
        else{
          if(!(/^1[^0-2]\d{9}$/).test(value)){
            callback(new Error('请输入正确的手机号码'))
          }
          else{
            callback()
          }
        }
      };
      
      let checkDecr = (rule,value,callback) => {
        if(value.length > 20){
          callback(new Error('字数限制在20个'))
        }
        else{
          callback()
        }
      }
      
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.passForm.checkPass !== '') {
            this.$refs.passForm.validateField('checkPass');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.passForm.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      
      return {
        username: '',
        user_info: '',
        activeName: 'first',
        headers: {'X-Token':getToken()},
        avatar: '',
        ruleForm: {
          name: '',
          link: '',
          age: '',
          descr: ''
        },
        dialogVisible: false,
        role: '',
        rules: {
          link: [
            {validator: checkNumber,trigger: 'blur'}
          ],
          descr: [
            {validator: checkDecr,trigger:'blur'}
          ],
        },
        passRules: {
           pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ]
        },
        passForm: {
          pass: '',
          checkPass: ''
        }
      }
    },
    created() {
      this.load_info()
    },
    inject:['reload'],
    components: {
      userLog,
      updateUser
    },
    methods: {
      load_info() {
        this.username = sessionStorage.getItem('username')
        this.$store.dispatch('user/getUserInfo', this.username).then(response => {
          const data = response.obj
          this.user_info = data
          this.ruleForm.name = this.user_info.name
          this.ruleForm.age = this.user_info.age
          this.ruleForm.link = this.user_info.link
          this.ruleForm.descr = this.user_info.descr
        })
        this.$store.dispatch('user/getRoleByUserId',this.username).then(response => {
          this.role = response.role_name
        })
      },
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if(valid) {
            const link = this.ruleForm.link
            const descr = this.ruleForm.descr
            const userid = this.username
            
            const info = {
              link: link,
              descr: descr,
              userid: userid
            }
            
            this.$store.dispatch('user/updateUserInfo',info).then(response => {
              if(response.status == 200){
                this.$message({
                  message: response.msg,
                  type: 'success'
                })
                this.reload()
              }
              else{
                this.$message({
                  message: response.msg,
                  type: 'error'
                })
              }
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      handleClick(tab, event) {
        console.log(tab, event);
      },
      handleRemove(file, fileList) {
        this.$store.dispatch('msg/deleteFile',file.response.obj).then(response => {
          if(response.status == 200){
            this.$message({
              message: '删除成功',
              type: 'success'
            })
          }
        })
      },      handleExceed(files, fileList) {
        this.$message.warning(`当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
      },
      handleSuccess(response,file,fileList){
        this.avatar = response.obj
        alert(this.avatar)
      },
      updatePassword(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            const userid = this.username
            const password = this.passForm.pass
            const info = {
              userid:userid,
              password:password
            }
            this.$store.dispatch('user/updatePassword',info).then(response => {
              if(response.status == 200){
                this.$message({
                  message: response.msg,
                  type: 'success'
                })
                this.reload()
              }
              else{
                this.$message({
                  message: response.msg,
                  type: 'error'
                })
              }
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      }
     
    }
  }
</script>

<style scoped="scoped">
  .userinfo {
    width: 100%;
    height: 100%;
    background-color: #FFFFFF;
    padding: 32px;
    text-align: center;
  }
  
  .user-avatar {
    height: 100px;
    width: 100px;
  }
  
  .avatar {
    width: 100%;
    text-align: center;
  }
  
  .info {
    width: 100%;
    text-align: center;
  }
  
  .demo-ruleForm {
    margin-left: 430px;
    width: 500px;
  }
  
  .text {
    font-size: 7px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 280px;
  }
  
  table{
    width: 100%;
  }
  
  td{
    height: 50px;
  }
  
  tr{
    border-bottom: 1px #DCDFE6 solid;
  }
</style>