import request from '@/utils/request'

export function initMenu(userid){
  return request({
    url: '/user/basic/getMenuList',
    method: 'get',
    params: { userid }
  })
}

export function getUser(token){
  return request({
    url: '/getUserByToken',
    method: 'get'
  })
}

export function login(data){
  return request({
    url: '/login',
    method: 'post',
    data
  })
}

export function getUserRole(){
  return request({
    url: '/sys/user/getAllRole',
    method: 'get'
  })
}

export function getRoleByUserId(user_id){
  return request({
    url: '/sys/user/getRoleByUserId',
    method: 'get',
    params: { user_id }
  })
}

export function changeRole(id,user_id,role_id){
  return request({
    url: '/sys/user/changeRole',
    method: 'get',
    params: { id,user_id,role_id }
  })
}


export function getroleById(userid){
  return request({
    url:'/user/basic/getRoleById',
    method:'get',
    params: { userid }
  })
}

export function getUserInfo(userid){
  return request({
    url: '/user/basic/getUserInfo',
    method: 'get',
    params: { userid }
  })
}

export function updateUserInfo(name,link,descr,avatar,userid){
  return request({
    url: '/user/basic/updateUserInfo',
    method: 'post',
    params: { name,link,descr,avatar,userid }
  })
}

export function updatePassword(userid,pass){
  return request({
    url: '/user/basic/updatePassword',
    method: 'post',
    params: {userid,pass}
  })
}

export function getLog(userid){
  return request({
    url: '/user/basic/getLog',
    method: 'get',
    params: { userid }
  })
}

export function getAllUser(page,pageSize){
  return request({
    url: '/user/basic/getAllUser',
    method: 'get',
    params: { page,pageSize }
  })
}
