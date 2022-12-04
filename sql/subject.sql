-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学科', '3', '1', 'subject', 'subject/subject/index', 1, 0, 'C', '0', '0', 'subject:subject:list', '#', 'admin', sysdate(), '', null, '学科菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学科查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'subject:subject:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学科新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'subject:subject:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学科修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'subject:subject:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学科删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'subject:subject:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学科导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'subject:subject:export',       '#', 'admin', sysdate(), '', null, '');