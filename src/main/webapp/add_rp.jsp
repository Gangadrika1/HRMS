<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="com.weblabs.service.impl.AddRolesDAO" %>
<%@ page import="com.weblabs.beans.AddRolesBean" %>
<%@ page import="java.util.List" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Leaves - HRMS admin template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    
    <!-- Table styles CSS -->
    <link rel="stylesheet" href="css/styles.css">
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
   
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
   
    <title>Leave List</title>
</head>
<body>






<form action="./AddRPSrv" method="post">
    <div id="add_rp" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add RolePermission</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">RoleID <span class="text-danger">*</span></label>
                                   <!--  <input name="roleid" required class="form-control" type="number"> -->
                                    
                                    <select id="selectedEmployee" name="roleid" class="form-control">
                                    
                                    <%
    											List<AddRolesBean> dept = AddRolesDAO.getAllRoles();
    											for(AddRolesBean dep: dept)
    											{
    											%>
                                               <option value="<%= dep.getRoleID()%>"><%= dep.getRoleName() %></option>
                                            <%
                              					}
    									     %>                       
                                </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">ModuleName</label>
                                    <input name="module name" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">FormName <span class="text-danger">*</span></label>
                                    <input name="formname" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">PermissionType <span class="text-danger">*</span></label>
                                    <input name="permissiontype" required class="form-control" type="number">
                                </div>
                            </div>
                            
                                                       <div class="submit-section">
                            <button type="submit" name="delete_role" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                            
                           </div>
                          </div>
                        </div>
                         </div>
                        </div>
                      </form> 
                      <%   response.sendRedirect("roles-permissions.jsp"); %> 