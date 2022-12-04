import request from '@/utils/request'

// 查询Teacher列表
export function listTeacher(query) {
  return request({
    url: '/people/teacher/list',
    method: 'get',
    params: query
  })
}

// 查询Teacher详细
export function getTeacher(tId) {
  return request({
    url: '/people/teacher/' + tId,
    method: 'get'
  })
}

// 新增Teacher
export function addTeacher(data) {
  return request({
    url: '/people/teacher',
    method: 'post',
    data: data
  })
}

// 修改Teacher
export function updateTeacher(data) {
  return request({
    url: '/people/teacher',
    method: 'put',
    data: data
  })
}

// 删除Teacher
export function delTeacher(tId) {
  return request({
    url: '/people/teacher/' + tId,
    method: 'delete'
  })
}
