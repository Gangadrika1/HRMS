<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.weblabs.beans.AddAddition"%>
<%@page import="com.weblabs.service.impl.PayrollAdditionDAO"%>
<%@page import="com.weblabs.service.impl.DesignationDAO"%>
<%@page import="com.weblabs.service.impl.PayrollDAO"%>
<%@page import="com.weblabs.beans.Payroll"%>
<%@page import="com.weblabs.service.impl.SalaryDAO"%>
<%@page import="com.weblabs.srv.NumberToWordsConverter" %>
<%@page import="com.weblabs.beans.EmployeeBean"%>
<%@page import="com.weblabs.beans.AddsalaryBean"%>
<%@page import="com.weblabs.service.impl.EmployeeDAO"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Salary - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/log.png">
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="css/line-awesome.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/tstyles.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="js/html5shiv.min.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
    
    <%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("id");// Make sure the parameter name matches your form
    String year= request.getParameter("year");
    String month = request.getParameter("month");
    
    List<EmployeeBean> emp = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Employee_Id = '" + idFilter + "'";
    }
    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        emp = EmployeeDAO.getFilteredEmployees(whereClause, start, limit);
    }

    if (emp != null && !emp.isEmpty()) {
    	EmployeeBean employee = emp.get(0); // Access the first element
        if (employee != null) {
        	
        	String employee_id= employee.getEmployee_ID();
        	List<AddsalaryBean> salary = SalaryDAO.getSalaryDetails(employee_id);
        	// Check if the list is not empty
        	if (!salary.isEmpty()) {
        	    // Get the first record
        	    AddsalaryBean salrec = salary.get(0);

            	List<Payroll> payroll = PayrollDAO.getpayrollID(year, month);
            
            	// Check if the list is not empty
            	if (!payroll.isEmpty()) {
            	    // Get the first record
            	    Payroll payrol = payroll.get(0);
            	    
            	    String employeeIdString = payrol.getPayroll_id();
            	    int payrollId = Integer.parseInt(employeeIdString);
            	    
            	    List<AddAddition> addaddition = PayrollAdditionDAO.getPayrollDetails(payrollId);
                	// Check if the list is not empty
                 	if (!addaddition.isEmpty()) {
                	    // Get the first record
                	    AddAddition addadditions = addaddition.get(0); 
                	 
%>
    
		<!-- Main Wrapper -->
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
						<div class="row align-items-center">
							<div class="col">
								<h3 class="page-title">Payslip</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Payslip</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<div class="btn-group btn-group-sm">
									<button class="btn btn-white">CSV</button>
									<button class="btn btn-white">PDF</button>
									<button class="btn btn-white"><i class="fa fa-print fa-lg"></i> Print</button>
								</div>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
								<%
                           int numericMonth = Integer.parseInt(month);
                        String monthName = java.time.Month.of(numericMonth).toString();
                                %>
								
									<h4 class="payslip-title">Payslip for the month of <%= monthName %> <%=year%> </h4>
									<div class="row">
										<div class="col-sm-6 m-b-20">
											<img src="assets/img/logo2.png" class="inv-logo" alt="">
											<ul class="list-unstyled mb-0">
												<li>Weblabs Techologies</li>
												<li>Madeenaguda,Hyderabad</li>
												<li>Telangana,India</li>
											</ul>
										</div>
										<div class="col-sm-6 m-b-20">
											<div class="invoice-details">
												<h3 class="text-uppercase">Payslip #49029</h3>
												<ul class="list-unstyled">
													<li>Salary Month: <span><%= monthName %>,<%=year%></span></li>
													<%
													System.out.println(payrol.getYear());
													%>
												</ul>
											</div>
										</div>
									</div>
									<%
								
                                   // Assuming you have a DesignationDAO class with a method getDesignationNameById
                                     String designationId = employee.getDesignation(); // Replace with the actual method to get designation ID
                                      String designationName = DesignationDAO.getDesignationNameById(designationId);
                                    
                                    %>
									
									<div class="row">
										<div class="col-lg-12 m-b-20">
											<ul class="list-unstyled">
												<li><h5 class="mb-0"><strong><%=employee.getUsername()%></strong></h5></li>
												<li><span><%=designationName%></span></li>
												<li>Employee ID:<%=employee.getEmployee_ID()%></li>
												<li>Joining Date:<%=employee.getJoining_Date()%> </li>
											</ul>
										</div>
									</div>
									
									<div class="row">
								
										<div class="col-sm-6">
											<div>
												
												<h4 class="m-b-10"><strong>Earnings</strong></h4>
												
												<table class="table table-bordered">
												
													<tbody>
											
														<tr>
														
															<td><strong>Basic Salary</strong> <span class="float-right"><%=salrec.getBasic() %></span></td>
														</tr>
														<tr>
															<td><strong>House Rent Allowance (H.R.A.)</strong> <span class="float-right"><%=salrec.getHRA()%></span></td>
														</tr>
														<tr>
															<td><strong>Conveyance</strong> <span class="float-right"><%=salrec.getCONVEYANCE()%></span></td>
														</tr>
														
														<tr>
															<td><strong>Other Allowance</strong> <span class="float-right"><%=salrec.getALLOWANCE()%></span></td>
														</tr>
														
														<tr>
														
															<td><strong>DA</strong> <span class="float-right"><strong><%=salrec.getDA()%></strong></span></td>
														</tr>
														<tr>
														
															<td><strong>Medical Allowance</strong> <span class="float-right"><strong><%=salrec.getMEDICAL()%></strong></span></td>
														</tr>
														<tr>
															<td><strong>Unit Amount</strong> <span class="float-right"><%=addadditions.getUnitAmount()%></span></td>
														</tr>
														<tr>
														  <td><strong>Grose Salary</strong> <span id="totalEarnings" class="float-right"></span></td>
														</tr>

														 
													</tbody>
													
												</table>
												
											</div>
										</div>
										
										<div class="col-sm-6">
											<div>
												<h4 class="m-b-10"><strong>Deductions</strong></h4>
												<table class="table table-bordered">
													<tbody>
														<tr>
															<td><strong>Tax Deducted at Source (T.D.S.)</strong> <span class="float-right"><%=salrec.getTDS()%></span></td>
														</tr>
														<tr>
															<td><strong>Provident Fund</strong> <span class="float-right"><%=salrec.getPF()%></span></td>
														</tr>
														<tr>
															<td><strong>ESI</strong> <span class="float-right"><%=salrec.getESI()%></span></td>
														</tr>
														<tr>
															<td><strong>Pf TAX</strong> <span class="float-right"><%=salrec.getPROF_TAX()%></span></td>
														</tr>
														<tr>
															<td><strong>LABOUR_WELFARE</strong> <span class="float-right"><%=salrec.getLABOUR_WELFARE()%></span></td>
														</tr>
														<tr style="height: 45px">
														<td></td>
														</tr>
										                <tr style="height: 45px">
														<td></td>
														</tr>
														<tr>
															<td><strong>Total Deductions</strong> <span class="float-right"><strong><%=salrec.getDeducationTotal()%></strong></span></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
						     			
										<div class="col-sm-12">
										<%
										    
										        String grosesal = salrec.getOTHERS();
										        String unitamount = addadditions.getUnitAmount();
										
										        double g = Double.parseDouble(grosesal);
										        double u = Double.parseDouble(unitamount);
										        
										        int gose = (int) g;
										        int unit = (int) u;
										
										        // Calculate total earnings
										        int totalEarnings = gose + unit;
										
										        String totalDeductions = salrec.getDeducationTotal();
										        double t= Double.parseDouble(totalDeductions);
										        int totaDeductionInt = (int)t;
										
										        
										        int netSalarycal = totalEarnings - totaDeductionInt;
										
										        String netSalaryInWords = NumberToWordsConverter.convertToWords(netSalarycal);
										    
										%>
										    <p><strong>Net Salary: <%=netSalarycal %> -> <%= netSalaryInWords %></strong></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
            </div>
			<!-- /Page Wrapper -->

        </div>
		<!-- /Main Wrapper -->

		<!-- jQuery -->
	 <script>
    var grosesal = <%=salrec.getOTHERS()%>;
    var unitamount = <%=addadditions.getUnitAmount()%>;

    // Calculate total earnings
    var totalEarnings = grosesal + unitamount;

    // Update the Total Earnings element in the HTML
    document.getElementById('totalEarnings').textContent = totalEarnings.toFixed(2); // You can adjust the number of decimal places as needed
</script>
    <%--// Calculate and update Net Salary
    var totalDeductions = <%=salrec.getDeducationTotal()%>;
    var netSalary = totalEarnings - totalDeductions;

    // Update the Net Salary element in the HTML (assuming you have a span with the id 'netSalaryDisplay')
    document.getElementById('netSalaryDisplay').textContent = netSalary.toFixed(2); // You can adjust the number of decimal places as neede
</script> --%>



		<%
    }
            	
%>
<%
}
    }
        }
    }
%>


        <script src="js/jquery-3.2.1.min.js"></script>

		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>

		<!-- Custom JS -->
		<script src="js/app.js"></script>

    </body>
</html>