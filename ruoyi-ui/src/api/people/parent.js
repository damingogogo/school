import request from '@/utils/request'

// 查询Parent列表
export function listParent(query) {
  return request({
    url: '/people/parent/list',
    method: 'get',
    params: query
  })
}

// 查询Parent详细
export function getParent(pId) {
  return request({
    url: '/people/parent/' + pId,
    method: 'get'
  })
}

// 新增Parent
export function addParent(data) {
  return request({
    url: '/people/parent',
    method: 'post',
    data: data
  })
}

// 修改Parent
export function updateParent(data) {
  return request({
    url: '/people/parent',
    method: 'put',
    data: data
  })
}

// 删除Parent
export function delParent(pId) {
  return request({
    url: '/people/parent/' + pId,
    method: 'delete'
  })
}
