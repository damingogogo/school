import request from '@/utils/request'

// 查询报名管理列表
export function listSignup(query) {
  return request({
    url: '/signup/signup/list',
    method: 'get',
    params: query
  })
}

// 查询报名管理详细
export function getSignup(id) {
  return request({
    url: '/signup/signup/' + id,
    method: 'get'
  })
}

// 新增报名管理
export function addSignup(data) {
  return request({
    url: '/signup/signup',
    method: 'post',
    data: data
  })
}

// 修改报名管理
export function updateSignup(data) {
  return request({
    url: '/signup/signup',
    method: 'put',
    data: data
  })
}

// 删除报名管理
export function delSignup(id) {
  return request({
    url: '/signup/signup/' + id,
    method: 'delete'
  })
}
