package com.weblabs.service;

public interface RPService {
	public String addRP(String RoleID,String ModuleName, String FormName,String PermissionType);
	public String deleteRP(String RolePermissionID);
	public String updateRP(String RolePermissionID ,String RoleID,String ModuleName, String FormName,String PermissionType);
}
