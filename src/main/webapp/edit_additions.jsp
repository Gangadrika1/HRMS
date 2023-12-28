<%@page import="com.weblabs.service.impl.AdditionDAO"%>
<%@page import="com.weblabs.beans.AddAddition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
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
    <title>Payroll Additions - HRMS admin template</title>

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
    <link rel="stylesheet" href="css/tstyles.css">
        <!-- table styles CSS -->
     

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <title>payroll List</title>
</head>
<body> 
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("Payroll_id"); // Make sure the parameter name matches your form
    List<AddAddition> terminations = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Payroll_id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        terminations = AdditionDAO.getFilteredAddClient(whereClause, start, limit);
    }

    if (terminations != null && !terminations.isEmpty()) {
    	AddAddition train = terminations.get(0); // Access the first element
        if (train != null) {
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
<form  action="./EditAdditionServlet" method="post">
<div  role="dialog">
					
							
							<div class="modal-body">
					                <div class="form-group">
				                      <label>ID <span class="text-danger">*</span></label>
				                      <input readonly value="<%=train.getPayroll_id() %>" name="id" required class="form-control" type="text">
				                     </div>
									<div class="form-group">
										<label>Name <span class="text-danger">*</span></label>
                                        <select class="select" name="name"  required >
											
											<option value="CONVEYANCE" <%= (train.getAdditionName().equals("CONVEYANCE")) ? "selected" : "" %>>CONVEYANCE</option>
											<option value="ALLOWANCE" <%= (train.getAdditionName().equals("ALLOWANCE")) ? "selected" : "" %>>ALLOWANCE</option>
											<option value="MEDICAL" <%= (train.getAdditionName().equals("MEDICAL")) ? "selected" : "" %>>MEDICAL</option>
											<option value="BASIC" <%= (train.getAdditionName().equals("BASIC")) ? "selected" : "" %>>Basic</option>
											<option value="DA" <%= (train.getAdditionName().equals("DA")) ? "selected" : "" %>>DA</option>
											<option value="HRA" <%= (train.getAdditionName().equals("HRA")) ? "selected" : "" %>>HRA</option>
										</select>									
									</div>
									<div class="form-group">
										<label>Category <span class="text-danger">*</span></label>
										<select value="<%=train.getCategory()%>" name="category" class="select">
											<option>Select a category</option>
											<option>Monthly remuneration</option>
											<option>Additional remuneration</option>
										</select>
										
									</div>
									<div class="form-group">
										<label class="d-block">Unit calculation</label>
										<div class="status-toggle">
											<input value="<%=train.getUnitcalculation()%>" name="unitcalculation" type="checkbox" id="edit_unit_calculation" class="check">
											<label for="edit_unit_calculation" class="checktoggle">checkbox</label>
										</div>
									</div>
									<div class="form-group">
										<label>Unit Amount</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">$</span>
											</div>
											<input value="<%=train.getUnitAmount()%>" name="unitamount" type="text" class="form-control">
											<div class="input-group-append">
												<span class="input-group-text">.00</span>
											</div>
										</div>
									</div>
									
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

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("termination Position Updated Successfully!")) {
        response.sendRedirect("payroll-items.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>termination not found with the provided ID.</p>
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
			
</body>
</html>