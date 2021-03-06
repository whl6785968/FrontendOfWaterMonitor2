import { initMenu,getroleById } from '@/api/user'
import { constantRoutes } from '@/router'
import page404 from '@/components/404/'

import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export const getRoleById = (store,userid) => {
return new Promise((resolve,reject) => {
    getroleById(userid).then(response => {
      if(response.status == 200){
        const role = response.obj
        store.commit('storageRole',role)
        resolve(role)
      }
    }).catch(error => {
      reject(error)
    })
})
}

export const initmenu = (router,store,userId) => {
  var fmtRoutes
  initMenu(userId).then(response => {
    if (response){
      fmtRoutes = fmtRouters(response.obj)
//    alert(JSON.stringify(fmtRoutes))
      store.commit('initMenu', fmtRoutes)
//    resetRouter()
      router.matcher = new Router({mode:'hash'}).matcher
      router.options.routes = constantRoutes
      router.addRoutes(constantRoutes)
      router.addRoutes(fmtRoutes)
      router.options.routes.push({
        path: "*",
        component: page404
      })
      
    }
  })
  console.log(router)
  return router.options.routes
} 

export const fmtRouters = (routes) => {
  let fmtRoutes = [];
  routes.forEach(router => {
    let {
      path,
      component,
      title,
      iconcls,
      keepalive,
      requireauth,
      enable,
      children
    } = router;
    
    if(children && children instanceof Array){
      children = fmtRouters(children)
    }
    var cname = '';
    if(component.startsWith('dash')){
      cname = () => import('../components/dashboard.vue')
    }
    else if(component.startsWith('auth')){
      cname = () => import('../components/userManager/authControl/')
    }
    else if(component.startsWith('check')){
      cname = () => import('../components/dataRelated/')
    }
    else if(component.startsWith('menuConfig')){   
      cname = () => import('../components/userManager/menuConfig/')
    }
    else if(component.startsWith('dataDetails')){
      cname = () => import('../components/dataRelated/DataDeatils/')
    }
    else if(component.startsWith('map')){
      cname = () => import('../components/dataRelated/map/')
    }
    else if(component.startsWith('posting')){
      cname = () => import('../components/msg/posting/')
    }
    else if(component.startsWith('readable')){
      cname = () => import('../components/msg/readablePost/')
    }
    else if(component.startsWith('review')){
      cname = () => import('../components/msg/review/')
    }
    else if(component.startsWith('postDetail')){
      cname = () => import('../components/msg/postDetail/')
    }
    else if(component.startsWith('reportList')){
      cname = () => import('@/components/report/reportList/')
    }
    else if(component.startsWith("reportDetails")){
      cname = () => import('@/components/report/')
    }
    else if(component.startsWith("isoForest")){
      cname = () => import('@/components/algo/isoForest/')
    }
    else if(component.startsWith('stationManager')){
      cname = () => import('@/components/dataManager/components/stationManager')
    }
    else if(component.startsWith('districtManager')){
      cname = () => import('@/components/dataManager/components/districtManager.vue')
    }
    else if(component.startsWith('equipManager')){
      cname = () => import('@/components/dataManager/components/equipManager')
    }
    else if(component.startsWith("enterpriseManager")){
      cname = () => import('@/components/dataManager/components/enterpriseManager')
    }
    else if(component.startsWith("provinceManager")){
      cname = () => import('@/components/dataManager/components/provinceManager')
    }
    else if(component.startsWith('errRecord')){
      cname = () => import('@/components/algo/errRecord/')
    }
    else if(component.startsWith('showKg')){
      cname = () => import('@/components/kg/')
    }
    else if(component.startsWith('ner')){
      cname = () => import('@/components/kg/ner/')
    }
    else if(component.startsWith('qa')){
      cname = () => import('@/components/kg/qa/')
    }
    else if(component.startsWith('relationExtract')){
      cname = () => import('@/components/kg/relationExtract/')
    }
    else if(component.startsWith('kgManager')){
      cname = () => import('@/components/kg/knowledgeManager/')
    }
    else if(component.startsWith('userList')){
      cname = () => import('@/components/user/userList/')
    }
//  alert(cname);
    let fmRouter = {
      path: path,
      component: cname,
      name: title,
      children:children,
      meta: {
        title: title,
        iconCls: iconcls,
        keepAlive: keepalive,
        requireAuth: requireauth,
        enable: enable
      }
    };   
    fmtRoutes.push(fmRouter)
  })
  return fmtRoutes
}
