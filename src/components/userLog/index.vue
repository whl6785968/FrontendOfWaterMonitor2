<template>
  <div id="userLog">
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="itr" label="访问接口" width="180">
      </el-table-column>
      <el-table-column prop="behavior" label="用户行为" width="100">
      </el-table-column>
      <el-table-column prop="ip" label="ip地址" width="120">
      </el-table-column>
      <el-table-column prop="ipOrigin" label="ip来源">
      </el-table-column>
      <el-table-column prop="browser" label="访问浏览器">
      </el-table-column>
      <el-table-column prop="createTime" label="创建时间">
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        tableData: [],
        userid: sessionStorage.getItem("username")
      }
    },
    mounted(){
      this.init()
    },
    methods: {
      init(){
        this.$store.dispatch('user/getLog',this.userid).then(response => {
          if(response.status == 200){
            this.tableData = response.obj
          }
          
        })
      }
    }
  }
</script>

<style>

</style>