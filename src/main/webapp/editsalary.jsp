<%@page import="com.weblabs.service.impl.SalaryDAO"%>
<%@page import="com.weblabs.beans.AddsalaryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


 </head>
<body>
<%
int start = 0;
int limit = 25;

String idFilter = request.getParameter("Employee_Id"); // Make sure the parameter name matches your form
List<AddsalaryBean> leaves = null; // Initialize the list as empty

String whereClause = ""; // Initialize an empty whereClause

if (idFilter != null && !idFilter.isEmpty()) {
    whereClause += "Employee_Id = '" + idFilter + "'";
}

if (!whereClause.isEmpty()) {
    // Apply the whereClause condition
    leaves = SalaryDAO.getFilteredSalary(whereClause, start, limit);
}

if (leaves != null && !leaves.isEmpty()) {
	AddsalaryBean leave = leaves.get(0); // Access the first element
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
<form action="./EditEmpSalarySrv" method="post">
<div role="dialog">
					
										<div class="col-sm-6"> 
											<div class="form-group">
												
												<div class="form-group">
								                    <label class="col-form-label">ID <span class="text-danger">*</span></label>
								                    <input name="empid" value="<%= leave.getEmployee_id()%>" required class="form-control" type="text" readonly>
								                </div>
											</div>
										</div>
										
										<div class="col-sm-6"> 
											<label>Net Salary</label>
											<input value="<%= leave.getNetSal()%>"  name="netsalary" class="form-control" type="text" >
										</div>
									</div>
									<div class="row"> 
										<div class="col-sm-6"> 
											<h4 class="text-primary">Earnings</h4>
											<div class="form-group">
												<label>Basic</label>
												<input value="<%= leave.getBasic()%>" name="basic" class="form-control" type="text" >
											</div>
											<div class="form-group">
												<label>DA(40%)</label>
												<input value="<%= leave.getDA()%>" name="da" class="form-control" type="text" >
											</div>
											<div class="form-group">
												<label>HRA(15%)</label>
												<input value="<%= leave.getHRA()%>" name="hra" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Conveyance</label>
												<input value="<%= leave.getCONVEYANCE()%>" name="conveyance" class="form-control" type="text" >
											</div>
											<div class="form-group">
												<label>Allowance</label>
												<input  name="allowance" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Medical  Allowance</label>
												<input value="<%= leave.getMEDICAL()%>" name="medicalallowance" class="form-control" type="text">
											</div>
											
										</div>
										<div class="col-sm-6">  
											<h4 class="text-primary">Deductions</h4>
											<div class="form-group">
												<label>TDS</label>
												<input value="<%= leave.getTDS()%>" name="tds" class="form-control" type="text">
											</div> 
											<div class="form-group">
												<label>ESI</label>
												<input value="<%= leave.getESI()%>" name="esi" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>PF</label>
												<input value="<%= leave.getPF()%>" name="pf" class="form-control" type="text">
											</div>
											<!-- <div class="form-group">
												<label>Leave</label>
												<input  name="leave" class="form-control" type="text">
											</div> -->
											<div class="form-group">
												<label>Prof. Tax</label>
												<input value="<%= leave.getPROF_TAX()%>" name="proftax" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Labour Welfare</label>
												<input value="<%= leave.getLABOUR_WELFARE()%>" name="labourwelfare" class="form-control" type="text">
											</div>
											<%-- <div class="form-group">
												<label>Fund</label>
												<input value="<%= leave.get%>" name="fund" class="form-control" type="text">
											</div> --%>
											<!-- <div class="form-group">
												<label>Others</label>
												<input  name="others" class="form-control" type="text">
											</div> -->
										</div>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Save</button>
									</div>
</form>
							</div>
						</div>
					</div>
				</div>

				
<%
    HttpSession sessionstatus = request.getSession(true);
   System.out.println(sessionstatus);
    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("salary Updated Successfully!")) {
        response.sendRedirect("salary.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>leaves not found with the provided ID.</p>
		<%
        out.println("in editsalary line 197 "+leaves.size());
%> 
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
				