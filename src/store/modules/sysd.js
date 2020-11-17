import { deleteEnterprise,updateEnterprise,addEnterprise,getAllEnterprise,getAllProvince,getAllStation,getAllUser,getAllDistrict,addStation,addDistrict,getAllEquip,addEquip,modifyStation,deleteStation,modifyDistrict,deleteDistrict,modifyEquip,getRelBySid } from '@/api/sysd'

const state = {
  
}

const mutations = {}

const actions = {
  getAllStation({ commit },info){
    const { page,pageSize } = info
    return new Promise((resolve,reject) => {
      getAllStation(page,pageSize).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
   getAllUser({ commit }){
    return new Promise((resolve,reject) => {
      getAllUser().then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
   getAllDistrict({ commit },info){
    const { page,pageSize } = info
    return new Promise((resolve,reject) => {
      getAllDistrict(page,pageSize).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  addStation( {commit },info){
    const { id,name,longtitude,latitude,currLevel,preLevel,user,district,province,upstreamId,downstreamId } = info
    return new Promise((resolve,reject) => {
      addStation({id:id,name:name,longtitude:longtitude,latitude:latitude,currlevel:currLevel,prelevel:preLevel,upstreamId:upstreamId,downstreamId:downstreamId,responsible:user,district:{id:district},province:{id:province}}).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  modifyStation( {commit },info){
    const { id,name,longtitude,latitude,currLevel,preLevel,user,district,upstreamId,downstreamId,province,isAlert } = info
   return new Promise((resolve,reject) => {
      modifyStation({id:id,name:name,longtitude:longtitude,latitude:latitude,currlevel:currLevel,prelevel:preLevel,upstreamId:upstreamId,downstreamId:downstreamId,isAlert:isAlert,responsible:user,district:{id:district},province:{id:province}}).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg);
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  deleteStation({ commit },stationId){
    return new Promise((resolve,reject) => {
      deleteStation(stationId).then(response => {
        if(response.status != 200){
          this.$message.error(response.msg);
        }
        else{
          resolve(response)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  addDistrict({ commit },info){
    const { id,name } = info
    return new Promise((resolve,reject) => {
      addDistrict({id:id,name:name}).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  modifyDistrict({ commit },info){
    const { id,name } = info
    return new Promise((resolve,reject) => {
      modifyDistrict({id:id,name:name}).then(response => {
        if(response.status == 200){
          resolve(response)
        }else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  deleteDistrict({ commit },id){
    return new Promise((resolve,reject) => {
      deleteDistrict(id).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getAllEquip({ commit },info){
    const { page,pageSize } = info
    return new Promise((resolve,reject) => {
      getAllEquip(page,pageSize).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  addEquip({ commit },info){
    let { id,name,model,productiontime,availabletime,productionplace,status,stationId } = info
    productiontime = new Date(productiontime)
    return new Promise((resolve,reject) => {
      addEquip({id:id,name:name,model:model,productiontime:productiontime,availabletime:availabletime,productionplace,productionplace,status:status,station:{id:stationId}}).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  modifyEquip({ commit },info){
    let { id,name,model,productiontime,availabletime,productionplace,status,stationId } = info
    productiontime = new Date(productiontime)
    return new Promise((resolve,reject) => {
      modifyEquip({id:id,name:name,model:model,productiontime:productiontime,availabletime:availabletime,productionplace,productionplace,status:status,station:{id:stationId}}).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getRelBySid({ commit },id){
    return new Promise((resolve,reject) => {
      getRelBySid(id).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getAllProvince({ commit },info){
    const { page,pageSize } = info
    return new Promise((resolve,reject) => {
      getAllProvince(page,pageSize).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  getAllEnterprise({ commit },info){
    const { page,pageSize } = info
    return new Promise((resolve,reject) => {
      getAllEnterprise(page,pageSize).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  addEnterprise({ commit },info){
    let { id,name,contacts,contactsNumber,mainPollutions,pollutionsNum,isExceed,exceedFactor,station } = info
    return new Promise((resolve,reject) => {
      addEnterprise({id:id,name:name,contacts:contacts,contactsNumber:contactsNumber,mainPollutions:mainPollutions,pollutionsNum,pollutionsNum,isExceed:isExceed,exceedFactor:exceedFactor,station:{id:station}}).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  updateEnterprise({ commit },info){
    let { id,name,contacts,contactsNumber,mainPollutions,pollutionsNum,isExceed,exceedFactor,stationId } = info
    return new Promise((resolve,reject) => {
      updateEnterprise({id:id,name:name,contacts:contacts,contactsNumber:contactsNumber,mainPollutions:mainPollutions,pollutionsNum,pollutionsNum,isExceed:isExceed,exceedFactor:exceedFactor,station:{id:stationId}}).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
        }
      }).catch(error => {
        reject(error)
      })
    })
  },
  deleteEnterprise({ commit },id){
    return new Promise((resolve,reject) => {
      deleteEnterprise(id).then(response => {
        if(response.status == 200){
          resolve(response)
        }
        else{
          this.$message.error(response.msg)
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
