import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import login from '@/components/login'
import dashboard from '@/components/dashboard'
import homepage from '@/components/homePage/'
import page404 from '@/components/404/'
import userinfo from '@/components/user/'
import tst from '@/components/tst/'
import kgManager from '@/components/kg/kgManager/'
import ner from '@/components/kg/ner/'
import klm from '@/components/kg/knowledgeManager/'
import bd from '@/components/bigData/'
import sd from '@/components/dataRelated/ScrollData/'
import dynChart from '@/components/bigData/dynamicData/'
import report from '@/components/algo/errReport/'


Vue.use(Router)

export const constantRoutes = [
  {
      path: '/',
      component: dashboard,
      children: [
        {
          path: '/',
          redirect: '/homepage'
        },
        {
          path: '/homepage',
          component: homepage
        },
        {
          path: '/userinfo',
          component: userinfo
        },
        {
          path: '/aaaaaa',
          component: tst
        },
        {
          path: '/kgManager',
          component: kgManager
        },
        {
          path: '/ner',
          component: ner
        },
        {
          path: '/klm',
          component: klm
        },
        {
          path: 'sd',
          component: sd
        },
        {
          path: '/errRecord/errReport/:id',
          component: report
        }
//      {
//        path: '/algo',
//        component: algo
//      }
      ]
    },
    {
      path:'/login',
      name:'login',
      component: login,
    },
    {
      path: '/404',
      name: '404',
      component: page404
    },
    {
      path: '/bd',
      component: bd
    },
    {
      path: '/dynChart',
      component: dynChart
    }
        
]


export default new Router({
  mode: 'hash',
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})



const originalPush = Router.prototype.push;
Router.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
};