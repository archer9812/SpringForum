package com.springforum.service.impl;

import com.springforum.dao.AdminMapper;
import com.springforum.dao.UserMapper;
import com.springforum.domain.Permission;
import com.springforum.domain.Resource;
import com.springforum.domain.Role;
import com.springforum.domain.User;
import com.springforum.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class IAdminService implements AdminService {

    public final UserMapper userDao;

    public final AdminMapper adminDao;

    public IAdminService(AdminMapper adminDao, UserMapper userDao) {
        this.adminDao = adminDao;
        this.userDao = userDao;
    }

    @Override
    public List<Role> getAllRoles() {
        return adminDao.listAllRoles();
    }

    @Override
    public List<Permission> getAllPermissions() {
        return adminDao.listAllPermissions();
    }

    @Override
    public List<Resource> getAllResources() {
        return adminDao.listAllResources();
    }

    @Override
    public Boolean insertRole(Role role) {
        return adminDao.insertRole(role) > 0;
    }

    @Override
    public Boolean insertPermission(Permission permission) {
        return adminDao.insertPermission(permission) > 0;
    }

    @Override
    public Boolean insertResource(Resource resource) {
        return adminDao.insertResource(resource) > 0;
    }

    @Override
    public Role getRole(int id) {
        return adminDao.getRoleById(id);
    }

    @Override
    public Permission getPermission(int id) {
        return adminDao.getPermissionById(id);
    }

    @Override
    public Resource getResource(int id) {
        return adminDao.getResourceById(id);
    }

    @Override
    public Boolean deleteRole(int id) {
        return adminDao.deleteRoleByPrimaryKey(id) > 0;
    }

    @Override
    public Boolean deletePermission(int id) {
        return adminDao.deletePermissionByPrimaryKey(id) > 0;
    }

    @Override
    public Boolean deleteResource(int id) {
        return adminDao.deleteResourceByPrimaryKey(id) > 0;
    }

    @Override
    public List<Permission> getPermissionsByRoleId(int id) {
        return adminDao.selectPermissionByRole(id);
    }

    @Override
    public Boolean addRolePermission(int roleId, int permissionId) {
        return adminDao.insertRolePermission(roleId, permissionId) > 0;
    }

    @Override
    public Boolean deleteRolePermission(int roleId, int permissionId) {
        return adminDao.deleteRolePermission(roleId, permissionId) > 0;
    }

    @Override
    public List<Resource> getResourcesByPermissionId(int id) {
        return adminDao.selectResourceByPermission(id);
    }

    @Override
    public Boolean addPermissionResource(int permissionId, int resourceId) {
        return adminDao.insertPermissionResource(permissionId, resourceId) > 0;
    }

    @Override
    public Boolean deletePermissionResource(int permissionId, int resourceId) {
        return adminDao.deletePermissionResource(permissionId, resourceId) > 0;
    }

    @Override
    public List<Resource> getUserResources(int id) {
        return adminDao.selectUserResources(id);
    }

}
