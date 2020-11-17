<template>
  <div id="app">
    <!--<img src="./assets/logo.png">-->
    <router-view v-if="isRouterAlive"/>
  </div>
</template>

<script>
export default {
  name: 'App',
  data(){
    return {
      isRouterAlive: true
    }
  },
  provide() {
      return {
        reload: this.reload,
      }
  },
  mounted(){
  },
  methods: {
    reload() {
        this.isRouterAlive = false
        this.$nextTick(function() {
          this.isRouterAlive = true
        })
    }
  }
}
</script>

<style>
/*#app {
  
  margin-top: 60px;
}*/
#app{
  height: 100%;
  width: 100%;
  position: absolute;
  /*font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;*/
 /*border: 1px red solid;*/

}

*{
  margin: 0;
  padding: 0;
}
</style>
