package com.springforum.dao;

import com.springforum.domain.Permission;
import com.springforum.domain.Resource;
import com.springforum.domain.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    List<Role> listAllRoles();

    List<Permission> listAllPermissions();

    List<Resource> listAllResources();

    Role getRoleById(int id);

    Permission getPermissionById(int id);

    Resource getResourceById(int id);

    int deleteRoleByPrimaryKey(int id);

    int deletePermissionByPrimaryKey(int id);

    int deleteResourceByPrimaryKey(int id);

    int insertRole(Role role);

    int insertPermission(Permission permission);

    int insertResource(Resource resource);

    int updateRole(Role role);

    int updatePermission(Permission permission);

    int updateResource(Resource resource);

    List<Permission> selectPermissionByRole(int id);

    int insertRolePermission(@Param("roleId")int roleId, @Param("permissionId")int permissionId);

    int deleteRolePermission(@Param("roleId") int roleId, @Param("permissionId") int permissionId);

    List<Resource> selectResourceByPermission(int id);

    int insertPermissionResource(@Param("permissionId")int permissionId, @Param("resourceId")int resourceId);

    int deletePermissionResource(@Param("permissionId")int permissionId, @Param("resourceId")int resourceId);

    List<Resource> selectUserResources(int id);



}
