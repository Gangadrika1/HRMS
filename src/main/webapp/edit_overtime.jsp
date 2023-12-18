<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.OvertimeDAO" %>
<%@ page import="com.weblabs.beans.AddOverTime" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Over Time</title>
    <!-- Add your CSS and JavaScript includes here -->
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">

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

   
    <!-- <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script> -->
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("Employee_Id"); // Make sure the parameter name matches your form
    List<AddOverTime> overtime = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Employee_Id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        overtime = OvertimeDAO.getFiltereddeductions(whereClause, start, limit);
    }

    if (overtime != null && !overtime.isEmpty()) {
    	AddOverTime over = overtime.get(0); // Access the first element
        if (over != null) {
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
<form action="./EditOvertimeSrv" method="post">
<div id="edit_overtime" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Edit Overtime</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">								
								<div class="form-group">
										<label> ID <span class="text-danger">*</span></label>
										<input name="id" required class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Employee ID <span class="text-danger">*</span></label>employeename
										<select id="selectedEmployee" name="employeename" class="form-control">
                                <%
											List<EmployeeBean> dept = EmployeeDAO.getAllEmployees();
											for(EmployeeBean dep: dept)
											{
											%>
                                           <option><%= dep.getEmployee_ID() %></option>
                                        <%
                          					}
									     %>                       
                            </select>
									</div>
									<div class="form-group">
										<label>Overtime Date <span class="text-danger">*</span></label>
										<div class="cal-icon">
											<input name="overtimedate" required class="form-control datetimepicker" type="text">
										</div>
									</div>
									<div class="form-group">
										<label>Overtime Hours <span class="text-danger">*</span></label>
										<input name="hours" required class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Type <span class="text-danger">*</span></label>
										<input name="type" required class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Description <span class="text-danger">*</span></label>
										<textarea name="description" required rows="4" class="form-control"></textarea>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								
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

    if (sessionstatus.getAttribute("message") != null && sessionstatus.getAttribute("message").equals("Overtime Updated Successfully!")) {
        response.sendRedirect("payroll-items.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>goal-tracking not found with the provided ID.</p>
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
