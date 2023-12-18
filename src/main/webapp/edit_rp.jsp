<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.AddRPDAO" %>
<%@ page import="com.weblabs.beans.AddRolePermissionBean" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>
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
   
    <title>roles List</title>
</head>
<body>

<%

int start = 0;
int limit = 25;

String idFilter = request.getParameter("RolePermissionID"); // Make sure the parameter name matches your form
List<AddRolePermissionBean> leaves = null; // Initialize the list as empty

String whereClause = ""; // Initialize an empty whereClause

if (idFilter != null && !idFilter.isEmpty()) {
    whereClause += "RolePermissionID = '" + idFilter + "'";
}

if (!whereClause.isEmpty()) {
    // Apply the whereClause condition
    leaves = AddRPDAO.getFilteredRP(whereClause, start, limit);
}

if (leaves != null && !leaves.isEmpty()) {
	AddRolePermissionBean leave = leaves.get(0); // Access the first element
    if (leave != null) {
%>

<div class="main-wrapper">

    <!-- Header -->
    <!-- Include your header HTML here -->
    <jsp:include page="header.jsp" />

    <!-- Sidebar -->
    <!-- Include your sidebar HTML here -->
    <jsp:include page="sidebar.jsp" />

    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <!-- Page Content -->
        <div class="content container-fluid">

            <!-- Page Header -->
            
            <div class="page-header">
            
               
        <form action="./EditRPSrv" method="post">
   
       
                <div class="modal-body">

                        <div class="row">
                        <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">RolePermissionID <span class="text-danger">*</span></label>
                                    <input name="RolePermissionID" value="<%= leave.getRolePermissionID() %>"  required class="form-control" type="text" readonly>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">RoleID <span class="text-danger">*</span></label>
                                    <input name="roleid" required class="form-control" type="text"  value="<%= leave.getRoleID() %>"  >
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">ModuleName</label>
                                    <input name="modulename" required class="form-control" type="text" value="<%= leave.getModuleName() %>" >
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">FormName <span class="text-danger">*</span></label>
                                    <input name="formname" required class="form-control" type="text" value="<%= leave.getFormName() %>" >
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">PermissionType <span class="text-danger">*</span></label>
                                    <input name="permissiontype" required class="form-control" type="number" value="<%= leave.getPermissionType() %>" >
                                </div>
                                
                                
                                                       <div class="submit-section">
                            <button type="submit" name="edit_rp" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                            </div>
                           </div>
                          </div>
                      
                      
                      </form>   
  </div>
 </div>
 </div>                    
 </div>                      
                    

<%
    HttpSession sessionstatus = request.getSession(true);

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals(" Position Updated Successfully!")) {
        response.sendRedirect("rolepermission.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>leaves not found with the provided ID.</p>
</div>
<%
    }
%>
<%
        }
%>
<%
        }
%> 
<!-- Include your JavaScript libraries here -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>
                      