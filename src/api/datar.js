import request from '@/utils/request'
export function getEquipAndStation(data){
  return request({
    url: '/data/basic/getEquipAndStation',
    method: 'post',
    data
  })
}

export function searchDataOnCond(data){
  return request({
      url: '/data/basic/searchDataOnCond',
      method: 'post',
      data
  })
}

export function getWaterData(eid){
  return request({
    url: '/data/basic/getWaterData',
    method: 'get',
    params: { eid }
  })
}

export function getStationForMap(district,responsible,level,page,pageSize){
  return request({
    url: '/data/basic/getAllInfoForStation',
    method: 'get',
    params: { district,responsible,level }
  })
}

export function getStations(){
  return request({
    url: '/data/basic/getStations',
    method: 'get'
  })
}

export function getWQIByDistrict(){
  return request({
    url: '/data/basic/getWQIByDistrict',
    method: 'get'
  })
}

export function getDataBySid(stationId){
  return request({
    url: '/data/basic/getDataBySid',
    method: 'get',
    params: { stationId }
  })
}

export function getDynamicDataBySid(stationId){
  return request({
    url: '/data/basic/getDynamicData',
    method: 'get',
    params: { stationId }
  })
}

export function getBasicData(){
  return request({
    url: '/data/basic/getBasicData',
    method: 'get'
  })
}

export function getWQIByStation(){
  return request({
    url: '/data/basic/getWQIByStation',
    method: 'get'
  })
}
