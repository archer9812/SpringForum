package com.springforum.service;

import com.springforum.domain.Permission;
import com.springforum.domain.Resource;
import com.springforum.domain.Role;

import java.util.List;

public interface AdminService {
    List<Role> getAllRoles();

    List<Permission> getAllPermissions();

    List<Resource> getAllResources();

    Boolean insertRole(Role role);

    Boolean insertPermission(Permission permission);

    Boolean insertResource(Resource resource);

    Role getRole(int id);

    Permission getPermission(int id);

    Resource getResource(int id);

    Boolean deleteRole(int id);

    Boolean deletePermission(int id);

    Boolean deleteResource(int id);

    List<Permission> getPermissionsByRoleId(int id);

    Boolean addRolePermission(int roleId, int permissionId);

    Boolean deleteRolePermission(int roleId, int permissionId);

    List<Resource> getResourcesByPermissionId(int id);

    Boolean addPermissionResource(int permissionId, int resourceId);

    Boolean deletePermissionResource(int permissionId, int resourceId);

    List<Resource> getUserResources(int id);
}
