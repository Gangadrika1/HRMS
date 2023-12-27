<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.AddRolesDAO" %>
<%@ page import="com.weblabs.beans.AddRolesBean" %>
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

String idFilter = request.getParameter("RoleID"); // Make sure the parameter name matches your form
List<AddRolesBean> leaves = null; // Initialize the list as empty

String whereClause = ""; // Initialize an empty whereClause

if (idFilter != null && !idFilter.isEmpty()) {
    whereClause += "RoleID = '" + idFilter + "'";
}

if (!whereClause.isEmpty()) {
    // Apply the whereClause condition
    leaves = AddRolesDAO.getFilteredEmployees(whereClause, start, limit);
}

if (leaves != null && !leaves.isEmpty()) {
	AddRolesBean leave = leaves.get(0); // Access the first element
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


<form action="./EditRolesSrv" method="post" >

                <div class="modal-body">

                        <div class="row">
                        
              <div class="col-sm-6">
                <div class="form-group">
                    <label class="col-form-label">ID <span class="text-danger">*</span></label>
       <input name="RoleID" value="<%= leave.getRoleID() %>" required class="form-control" type="text" readonly>
                </div>
                 </div>       
                        
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Role Name<span class="text-danger">*</span></label>
                                    <input name="rolename" required class="form-control" value="<%= leave.getRoleName() %>" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Description</label>
                                    <input name="description" required class="form-control" value="<%= leave.getDescription() %>" type="text">
                                </div>
                            </div>
                            
                             <div class="submit-section">
                            <button type="submit" name="edit_roles" class="btn btn-primary submit-btn">Submit</button>
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
        response.sendRedirect("roles.jsp");
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
