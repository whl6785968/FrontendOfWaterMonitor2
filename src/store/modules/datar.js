import { getWQIByStation,getBasicData,getEquipAndStation,searchDataOnCond,getWaterData,getStationForMap,getStations,getWQIByDistrict,getDataBySid,getDynamicDataBySid } from '@/api/datar'
import { MessageBox, Message } from 'element-ui'
const state = {
  
}

const mutations = {
  
}

const actions = {
  getEquipAndStation({ commit },searchCondition){
    const { id,equipName,equipModel,station,status,level } = searchCondition
    return new Promise((resolve,reject) => {
      getEquipAndStation({id:id,equipName:equipName,equipModel:equipModel,station:station,status:status,level:level}).then(response => {
        if(response.status == 200){
          resolve(response.obj)
        }
       else{
          Message({
              message: response.msg || 'Error',
              type: 'error',
            })
            reject(new Error(response.msg || 'Error'))
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
   getWaterData({ commit },eid){
    return new Promise((resolve,reject) => {
      getWaterData(eid).then(response => {
        if(response.status == 200){
          resolve(response.obj)
        }
       else{
          Message({
              message: response.msg || 'Error',
              type: 'error',
            })
            reject(new Error(response.msg || 'Error'))
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getStationForMap({ commit },formLabelAlign){
    const { district,responsible,level } = formLabelAlign
    return new Promise((resolve,reject) => {
      getStationForMap(district,responsible,level).then(response => {
        if(response.status == 200){
          resolve(response.obj)
        }
       else{
          Message({
              message: response.msg || 'Error',
              type: 'error',
            })
            reject(new Error(response.msg || 'Error'))
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getStations(){
    return new Promise((resolve,reject) => {
      getStations().then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          Message({
              message: response.msg || 'Error',
              type: 'error',
            })
            reject(new Error(response.msg || 'Error'))
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getWQIByDistrict(){
    return new Promise((resolve,reject) => {
      getWQIByDistrict().then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          Message({
              message: response.msg || 'Error',
              type: 'error',
            })
            reject(new Error(response.msg || 'Error'))
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getDataBySid({ commit },stationId){
//  alert(1111)
    return new Promise((resolve,reject) => {
      getDataBySid(stationId).then(response => {
        if(response.status == 200){
          resolve(response)
        }
       else{
          Message({
              message: response.msg || 'Error',
              type: 'error',
            })
            reject(new Error(response.msg || 'Error'))
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getDynamicDataBySid({ commit },stationId){
    return new Promise((resolve,reject) => {
      getDynamicDataBySid(stationId).then(response => {
        if(response.status == 200){
          resolve(response)
        }
       else{
          Message({
              message: response.msg || 'Error',
              type: 'error',
            })
            reject(new Error(response.msg || 'Error'))
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getBasicData(){
    return new Promise((resolve,reject) => {
      getBasicData().then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          Message({
              message: response.msg || 'Error',
              type: 'error',
            })
            reject(new Error(response.msg || 'Error'))
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getWQIByStation(){
    return new Promise((resolve,reject) => {
      getWQIByStation().then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          Message({
              message: response.msg || 'Error',
              type: 'error',
            })
            reject(new Error(response.msg || 'Error'))
        }
      }).catch(error => {
        reject(error)
      })
    })
  }
  
}


export default {
  namespaced: true,
  state,
  mutations,
  actions
}
