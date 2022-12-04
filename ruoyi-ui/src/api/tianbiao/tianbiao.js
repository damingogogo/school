import request from '@/utils/request'

// 查询填表管理列表
export function listTianbiao(query) {
  return request({
    url: '/tianbiao/tianbiao/list',
    method: 'get',
    params: query
  })
}

// 查询填表管理详细
export function getTianbiao(id) {
  return request({
    url: '/tianbiao/tianbiao/' + id,
    method: 'get'
  })
}

// 新增填表管理
export function addTianbiao(data) {
  return request({
    url: '/tianbiao/tianbiao',
    method: 'post',
    data: data
  })
}

// 修改填表管理
export function updateTianbiao(data) {
  return request({
    url: '/tianbiao/tianbiao',
    method: 'put',
    data: data
  })
}

// 删除填表管理
export function delTianbiao(id) {
  return request({
    url: '/tianbiao/tianbiao/' + id,
    method: 'delete'
  })
}
