<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.LeaveDAO" %>
<%@ page import="com.weblabs.beans.AddLeaves" %>
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

   
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
 </head>
<body>

<%

int start = 0;
int limit = 25;

String idFilter = request.getParameter("id"); // Make sure the parameter name matches your form
List<AddLeaves> leaves = null; // Initialize the list as empty

String whereClause = ""; // Initialize an empty whereClause

if (idFilter != null && !idFilter.isEmpty()) {
    whereClause += "Id = '" + idFilter + "'";
}

if (!whereClause.isEmpty()) {
    // Apply the whereClause condition
    leaves = LeaveDAO.getFilteredLeaveRequests(whereClause, start, limit);
}

if (leaves != null && !leaves.isEmpty()) {
    AddLeaves leave = leaves.get(0); // Access the first element
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



        <form action="./UpdateLeave" method="post">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="col-form-label">ID <span class="text-danger">*</span></label>
                    <input name="id" value="<%= leave.getId() %>" required class="form-control" type="text" readonly>
                </div>
                <div class="form-group">
                    <label class="col-form-label">Employee Name <span class="text-danger">*</span></label>
                    <input name="Employee" value="<%= leave.getEmployee() %>" required class="form-control" type="text">
                </div>
                <div class="form-group">
                    <label class="col-form-label">Starting Date <span class="text-danger">*</span></label>
                    <input name="starting_at" value="<%= leave.getStarting_At() %>" required class="form-control" type="text">
                </div>
                <div class="form-group">
                    <label class="col-form-label">Ending Date <span class="text-danger">*</span></label>
                    <input name="ends_on" value="<%= leave.getEnding_On() %>" required class="form-control" type="text">
                </div>
                <div class="form-group">
                    <label class="col-form-label">Days <span class="text-danger">*</span></label>
                    <input name="days_count" value="<%= leave.getDays() %>" required class="form-control" type="text">
                </div>
                <div class="form-group">
                    <label class="col-form-label">Reason <span class="text-danger">*</span></label>
                    <input name="reason" value="<%= leave.getReason() %>" required class="form-control" type="text">
                </div>
                <div class="submit-section">
                    <button type="submit" name="update_leave" class="btn btn-primary submit-btn">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</div>
<%
    HttpSession sessionstatus = request.getSession(true);

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("leaves Position Updated Successfully!")) {
        response.sendRedirect("leaves.jsp");
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
