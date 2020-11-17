import { getBreakDownEquip,getHistoryList,getHistoryDetails,getHistoryByDistrict,getErrStation,getErrStationAndRecord,getNewestData } from '@/api/report'

const state = {
  
}

const mutations = {
  
}

const actions = {
  getBreakDownEquip({ commit }){
    return new Promise((resolve,reject) => {
      getBreakDownEquip().then(response => {
        if(response.status == 200){
          resolve(response)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getHistoryList({ commit }){
    return new Promise((resolve,reject) => {
      getHistoryList().then(response => {
        if(response.status == 200){
          resolve(response)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getHistoryDetails({ commit },createTime){
    return new Promise((resolve,reject) => {
      getHistoryDetails(createTime).then(response => {
        if(response.status == 200){
          resolve(response)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getHistoryByDistrict({ commit },createTime){
    return new Promise((resolve,reject) => {
      getHistoryByDistrict(createTime).then(response => {
        if(response.status == 200){
          resolve(response)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getErrStation({ commit }){
    return new Promise((resolve,reject) => {
      getErrStation().then(response => {
        if(response.status == 200){
          resolve(response)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
 getErrStationAndRecord({ commit }){
    return new Promise((resolve,reject) => {
      getErrStationAndRecord().then(response => {
        if(response.status == 200){
          resolve(response)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getNewestData({ commit }){
    return new Promise((resolve,reject) => {
      getNewestData().then(response => {
        if(response.status == 200){
          resolve(response)
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