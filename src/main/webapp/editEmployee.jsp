<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
    <!-- Add your CSS and JavaScript includes here -->
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

   <!-- Fontawesome CSS -->
     <link rel="stylesheet" href="css/font-awesome.min.css">

 <!--    Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

 <!--    Select2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">

 <!--    Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

 <!--    Main CSS -->
    <link rel="stylesheet" href="css/style.css">
 <!--    table styles CSS -->
    <link rel="stylesheet" href="css/tstyles.css">

   
    <!-- <script src="js/html5shiv.min.js"></script> -->
   <!--  <script src="js/respond.min.js"></script> -->
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("id"); // Make sure the parameter name matches your form
    List<EmployeeBean> employees = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Employee_Id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        employees = EmployeeDAO.getFilteredEmployees(whereClause, start, limit);
    }

    if (employees != null && !employees.isEmpty()) {
        EmployeeBean employee = employees.get(0); // Access the first element
        if (employee != null) {
%>

  
<form action="./EditEmployeeSrv" method="post">
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

                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-form-label">Employee ID <span class="text-danger">*</span></label>
                            <input name="Employee_Id" value="<%= employee.getEmployee_ID() %>" required class="form-control" type="text" readonly>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                            <input name="firstname" value="<%= employee.getFirstName() %>" required class="form-control" type="text">
                        </div>
              
                        <div class="form-group">
                            <label class="col-form-label">Last Name <span class="text-danger">*</span></label>
                            <input name="lastname" value="<%= employee.getLastName() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">User Name <span class="text-danger">*</span></label>
                            <input name="username" value="<%= employee.getUsername() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Email <span class="text-danger">*</span></label>
                            <input name="email" value="<%= employee.getEmail() %>" required class="form-control" type="text">
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">Phone <span class="text-danger">*</span></label>
                            <input name="phone" value="<%= employee.getPhone() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Department <span class="text-danger">*</span></label>
                            <input name="department" value="<%= employee.getDepartment() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Designation <span class="text-danger">*</span></label>
                            <input name="designation" value="<%= employee.getDesignation() %>" required class="form-control" type="text">
                        </div>
                          <div class="form-group">
                            <label class="col-form-label">Joining Date <span class="text-danger">*</span></label>
                            <input name="joiningdate" value="<%= employee.getJoining_Date()%>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Gender <span class="text-danger">*</span></label>
                            <input name="gender" value="<%= employee.getGender()%>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Location <span class="text-danger">*</span></label>
                            <input name="location" value="<%= employee.getLocation() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">PAN <span class="text-danger">*</span></label>
                            <input name="pan" value="<%= employee.getPAN() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">PF <span class="text-danger">*</span></label>
                            <input name="pf" value="<%= employee.getPF() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Pf_No <span class="text-danger">*</span></label>
                            <input name="Pf_No" value="<%= employee.getPf_No() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">UAN <span class="text-danger">*</span></label>
                            <input name="uan" value="<%= employee.getUAN() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">VPF <span class="text-danger">*</span></label>
                            <input name="vpf" value="<%= employee.getVPF() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">ESI <span class="text-danger">*</span></label>
                            <input name="esi" value="<%= employee.getESI() %>" required class="form-control" type="text">
                        </div>
                        <div class="submit-section">
                            <button type="submit" name="update_employee" class="btn btn-primary submit-btn">Update</button>
                        </div>
             </div>
                </div>
                       
                 </div>
        </div>
    </div>
</div>
 </form> 
 
 
<%
    HttpSession sessionstatus = request.getSession(true);

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("Employee Position Updated Successfully!")) {
        response.sendRedirect("employee.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>Employee not found with the provided ID.</p>
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
