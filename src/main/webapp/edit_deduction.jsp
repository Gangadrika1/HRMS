<%@page import="com.weblabs.beans.AddDeductions"%>
<%@page import="com.weblabs.service.impl.DeductionDAO"%>
<%@page import="com.weblabs.service.impl.GoalsTypeDAO"%>
<%@page import="com.weblabs.beans.AddGoalsType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.GoalsDao" %>
<%@ page import="com.weblabs.beans.AddGoals" %>
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

   
    <!-- <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script> -->
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("payrolldeductionid"); // Make sure the parameter name matches your form
    
    
    List<AddDeductions> goals = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "payrolldeductionid = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        goals = DeductionDAO.getFiltereddeductions(whereClause, start, limit);
    }

    if (goals != null && !goals.isEmpty()) {
    	AddDeductions goal = goals.get(0); // Access the first element
        if (goal != null) {
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
<form action="./EditDeductionServlet" method="post">
<div role="dialog">
					
								
					<div class="col-sm-6">
                        <div class="form-group">
										<label>ID <span class="text-danger">*</span></label>
										<input value="<%=goal.getPayroll_id() %>" name="id" class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Name <span class="text-danger">*</span></label>
										 <select class="select" name="name"  required >
											
											<option value="CONVEYANCE" <%= (goal.getDeductionName().equals("ESI")) ? "selected" : "" %>>ESI</option>
											<option value="ALLOWANCE" <%= (goal.getDeductionName().equals("TDS")) ? "selected" : "" %>>TDS</option>
											<option value="MEDICAL" <%= (goal.getDeductionName().equals("PF TAX")) ? "selected" : "" %>>PF TAX</option>
											<option value="BASIC" <%= (goal.getDeductionName().equals("lABOUR WELFARE")) ? "selected" : "" %>>lABOUR WELFARE</option>
											</select>
									</div>
									<div class="form-group">
										<label class="d-block">Unit calculation</label>
										<div class="status-toggle">
											<input  value="<%=goal.getUnitcalculation()%>" name="unitcalculation" type="checkbox" id="edit_unit_calculation_deduction" class="check">
											<label for="edit_unit_calculation_deduction" class="checktoggle">checkbox</label>
										</div>
									</div>
									<div class="form-group">
										<label>Unit Amount</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">$</span>
											</div>
											<input  value="<%=goal.getUnitAmount()%>" name="unitamount" type="text" class="form-control">
											<div class="input-group-append">
												<span class="input-group-text">.00</span>
											</div>
										</div>
									</div>
									<!-- <div class="form-group">
										<label class="d-block">Assignee</label>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="edit_deduction_assignee" id="edit_deduction_no_emp" value="option1">
											<label class="form-check-label" for="edit_deduction_no_emp">
											No assignee
											</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="edit_deduction_assignee" id="edit_deduction_all_emp" value="option2">
											<label class="form-check-label" for="edit_deduction_all_emp">
											All employees
											</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="edit_deduction_assignee" id="edit_deduction_single_emp" value="option3">
											<label class="form-check-label" for="edit_deduction_single_emp">
											Select Employee
											</label>
										</div>
										<div class="form-group">
											<select class="select">
												<option>-</option>
												<option>Select All</option>
												<option>John Doe</option>
												<option>Richard Miles</option>
											</select>
										</div>
									</div> -->
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Save</button>
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

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("goal-traking Position Updated Successfully!")) {
        response.sendRedirect("payroll-items.jsp");
    } else {
%>
   <div class="col-sm-6">
		<!-- <p>goal-tracking not found with the provided ID.</p> -->
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
				