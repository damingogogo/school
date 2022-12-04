import request from '@/utils/request'

// 查询syudent_grade列表
export function listGrade(query) {
  return request({
    url: '/system/grade/list',
    method: 'get',
    params: query
  })
}

// 查询syudent_grade详细
export function getGrade(id) {
  return request({
    url: '/system/grade/' + id,
    method: 'get'
  })
}

// 新增syudent_grade
export function addGrade(data) {
  return request({
    url: '/system/grade',
    method: 'post',
    data: data
  })
}

// 修改syudent_grade
export function updateGrade(data) {
  return request({
    url: '/system/grade',
    method: 'put',
    data: data
  })
}

// 删除syudent_grade
export function delGrade(id) {
  return request({
    url: '/system/grade/' + id,
    method: 'delete'
  })
}
