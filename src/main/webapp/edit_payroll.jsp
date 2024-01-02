<%@page import="com.weblabs.service.impl.PayrollDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.weblabs.beans.Payroll"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Payroll</title>
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

    String idFilter = request.getParameter("payroll_id"); // Make sure the parameter name matches your form
    List<Payroll> Holiday = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "payroll_id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        Holiday = PayrollDAO.getFiltereddeductions(whereClause, start, limit);
    }

    if (Holiday != null && !Holiday.isEmpty()) {
    	Payroll holiday = Holiday.get(0); // Access the first element
        if (holiday != null) {
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
<form action="./EditPayrollSrv" method="post">
<div class="col-sm-6">
                <div class="form-group">
                        <label for="payroll">ID<span class="text-danger">*</span></label>
                         <input value="<%=holiday.getPayroll_id() %>" name="payroll_id" required  class="form-control" type="text"> 
                    </div>
                   <!--  <div class="form-group">
                        <label for="payroll">EmployeeId<span class="text-danger">*</span></label>
                         <input name="empid" required  class="form-control" type="text"> 
                    </div> -->
                    <!-- <div class="form-group">
                        <label for="payroll">Name<span class="text-danger">*</span></label>
                         <input name="name" required  class="form-control" type="text"> 
                    </div> -->
                    <div class="form-group">
                        <label for="payroll">Year<span class="text-danger">*</span></label>
                         <input value="<%=holiday.getYear() %>" name="year" required  class="form-control" type="text"> 
                    </div>
                    <div class="form-group">
                        <label for="payroll">Month<span class="text-danger">*</span></label>
                         <input value="<%=holiday.getMonth() %>" name="month" required  class="form-control" type="text"> 
                    </div>
                    <div class="form-group">
                        <label for="payroll">Is_opened<span class="text-danger">*</span></label>
                         <input value="<%=holiday.getIs_opened() %>" name="isopen" required  class="form-control" type="text"> 
                    </div>
                    <div class="form-group">
                        <label for="payroll">Ranby<span class="text-danger">*</span></label>
                         <input value="<%=holiday.getRanby()%>" name="ranby" required  class="form-control" type="text"> 
                    </div>
                    <div class="form-group">
                        <label for="payroll">last_modified_time<span class="text-danger">*</span></label>
                         <input value="<%=holiday.getLast_modified_time()%>" name="lasttime" required  class="form-control" type="text"> 
                    </div>
                    
                    
                    <div class="submit-section">
                        <button type="submit" class="btn btn-primary submit-btn">Submit</button>
                    </div>
                    <%}} %>
 </div>
    
</form>
</div>
</div>
</div>

</div>