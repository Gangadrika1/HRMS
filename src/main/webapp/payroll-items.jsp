<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.weblabs.service.impl.PayrollDAO"%>
<%@page import="com.weblabs.beans.Payroll"%>
<%@page import="com.weblabs.service.impl.DeductionDAO"%>
<%@page import="com.weblabs.service.impl.OvertimeDAO"%>
<%@page import="com.weblabs.beans.AddOverTime"%>
<%@page import="com.weblabs.service.impl.PayrollAdditionDAO"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%@ page import="com.weblabs.beans.AddAddition" %>
<%@ page import="com.weblabs.beans.AddDeductions" %>
<%@ page import="com.weblabs.beans.AddPayrollDeductionAssigne" %>
<%@ page import="com.weblabs.beans.AddPayrollAdditionAssigne" %>
<%@ page import="com.weblabs.service.impl.AddAdditionServiceimpl" %>
<%@ page import="com.weblabs.service.impl.AddDeductionServiceImpl" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Payroll Items - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="css/line-awesome.min.css">
		
		<!-- Datatable CSS -->
		<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="css/select2.min.css">
		
		<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
		 <link rel="stylesheet" href="css/tstyles.css">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
	[	<![endif]-->
    </head>
    <body>
    <%
HttpSession sessionRec = request.getSession(true);
// Initialize recordsPerPage and currentPage as Java variables
String recordsPerPageStr = (String) sessionRec.getAttribute("recordsPerPage");
String currentPageStr = (String) sessionRec.getAttribute("currentPage");

if (recordsPerPageStr == null || "0".equals(recordsPerPageStr)) {
    recordsPerPageStr = "5"; // Set a default value, e.g., 1
    sessionRec.setAttribute("recordsPerPage", recordsPerPageStr);
}
int recordsPerPage = Integer.parseInt(recordsPerPageStr);

if (currentPageStr == null || "0".equals(currentPageStr)) {
    currentPageStr = "1"; // Set a default value, e.g., 1
    sessionRec.setAttribute("currentPage", currentPageStr);
}
int currentPage = Integer.parseInt(currentPageStr);

// Handle the change in recordsPerPage here
int newRecordsPerPage = 5; // Default value
String newRecordsPerPageParam = request.getParameter("newRecordsPerPage");
if (newRecordsPerPageParam != null) {
    newRecordsPerPage = Integer.parseInt(newRecordsPerPageParam);
    sessionRec.setAttribute("recordsPerPage", String.valueOf(newRecordsPerPage));
    //currentPage = 1; // Reset to the first page when changing recordsPerPage
    //sessionRec.setAttribute("currentPage", "1");
}

%>
<script>
    var recordsPerPage = <%= recordsPerPage %>; // Use Java variable in JavaScript
    var currentPage = <%= currentPage %>; 
 
    function changeRecordsPerPage() {
        var recordsPerPageSelect = document.getElementById("recordsPerPage");
        var selectedValue = recordsPerPageSelect.value;
        
        // Update the URL with the selected "recordsPerPage" value and navigate to it
        var baseUrl = window.location.href.split('?')[0];
        var newUrl = baseUrl + '?newRecordsPerPage=' + selectedValue;
        window.location.href = newUrl;
    }

</script> 
    
		<!-- Main Wrapper -->
        <div class="main-wrapper">
		
			
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
								<h3 class="page-title">Payroll Items</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
									<li class="breadcrumb-item active">Payroll Items</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<!-- Page Tab -->
					<div class="page-menu">
						<div class="row">
							<div class="col-sm-12">
								<ul class="nav nav-tabs nav-tabs-bottom">
									<li class="nav-item">
										<a class="nav-link active" data-toggle="tab" href="#tab_additions">Additions</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#tab_overtime">Overtime</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#tab_deductions">Deductions</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#tab_payroll">Payroll</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Tab -->
					
					<!-- Tab Content -->
					<div class="tab-content">
					
						<!-- Additions Tab -->
						<div class="tab-pane show active" id="tab_additions">
						
							<!-- Add Addition Button -->
							<div class="text-right mb-4 clearfix">
							<!-- <button class="btn btn-primary add-btn" type="button" data-toggle="modal" data-target="#delete_addition"><i class="fa fa-plus"></i> Delete Addition</button>
							<button class="btn btn-primary add-btn" type="button" data-toggle="modal" data-target="#edit_addition"><i class="fa fa-plus"></i>Edit Addition</button> -->
						   <button class="Addbutton" type="button" data-toggle="modal" data-target="#add_addition"><i class="fa fa-plus"></i> Add Addition</button>
							</div>
							<!-- /Add Addition Button -->

							<!-- Payroll Additions Table -->
							<div class="payroll-table card">
								<div class="table-responsive">
									<table class="table table-hover table-radius">
										<thead>
											<tr>
												<th>payrolladditionid</th>
												<th>AdditionName</th>
												<th>Category</th>
												<th>Unitcalculation</th>
												<th>Unit Amount</th>
												<th>Payroll_id</th>
												<th style="text-align: center;" colspan="2">Actions</th>
											</tr>
										</thead>
									 <%
                        int start = currentPage;
                        int limit = newRecordsPerPage;
                        //pagenation code start
            		    int pageno = 1;
            		    int noOfPages =0;
            		   
            		     String pageNoStr = request.getParameter("page");
            		     
            		     if (pageNoStr != null) {
            		         pageno = Integer.parseInt(pageNoStr);
            		     }

            		      start = (pageno - 1) * limit;
            		     //pagenation code ended
                        String holidayNameFilter = request.getParameter("AdditionName");
                        String idFilter = request.getParameter("payrolladditionid");
                        List<AddAddition> holidays;

                        String whereClause = "";

                        if (holidayNameFilter != null && !holidayNameFilter.isEmpty()) {
                            whereClause = "AdditionName = '" + holidayNameFilter + "'";
                        }

                        if (idFilter != null && !idFilter.isEmpty()) {
                            if (!whereClause.isEmpty()) {
                                whereClause += " or ";
                            }
                            whereClause += "payrolladditionid = '" + idFilter + "'";
                        }
                        //page
                        int recordcount= PayrollAdditionDAO.totalCount();

                       noOfPages = (int) Math.ceil((double) recordcount / limit);
                      //pagee
                        if (!whereClause.isEmpty()) {
                            holidays = PayrollAdditionDAO.getFilteredadditions(whereClause, start, limit);
                        } else {
                            holidays =  PayrollAdditionDAO.getFilteredadditions("", start, limit);
                        }
                        for (AddAddition holiday : holidays) {
                    %>
                    <tr>
                        <td><%= holiday.getPayrolladditionid()%></td>
                        <td><%= holiday.getAdditionName()%></td>
                        <td><%= holiday.getCategory()%></td>
                         <td><%= holiday.getUnitcalculation()%></td>
                          <td><%= holiday.getUnitAmount()%></td>
                           <td><%= holiday.getPayroll_id()%></td>
                        <td>
                            <a class="edit" href="edit_additions.jsp?Payroll_id=<%= holiday.getPayroll_id()%>">Edit</a>
                            </td>
                            <td>
                            <a class="delete" href="DeleteAdditionServlet?id=<%= holiday.getPayroll_id()%>">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %> 
                </table>
<div class="row justify-content-center align-items-center custom-pagination d-flex justify-content-center" id="flag1">
   
   <!-- Pagination links -->

    <% if (pageno > 1) { %>
        <a href="payroll-items.jsp?page=<%=pageno - 1%>"><span class="pagination-label">Previous</span></a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <span class="pagination-number active"><%=i%></span>
        <% } else { %>
            <a href="payroll-items.jsp?page=<%=i%>"><span class="pagination-number"><%=i%></span></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="payroll-items.jsp?page=<%=pageno + 1%>"><span class="pagination-label">Next</span></a>
    <% } %>

</div>
								</div>
							</div>
							<!-- /Payroll Additions Table -->
							
						</div>
						<!-- Additions Tab -->
						
						<!-- Overtime Tab -->
						<div class="tab-pane" id="tab_overtime">
						
							<!-- Add Overtime Button -->
							<div class="text-right mb-4 clearfix">
							<!-- <button class="btn btn-primary add-btn" type="button" data-toggle="modal" data-target="#delete_overtime"><i class="fa fa-plus"></i> Delete Overtime</button>
							<button class="btn btn-primary add-btn" type="button" data-toggle="modal" data-target="#edit_overtime"><i class="fa fa-plus"></i> Edit Overtime</button> -->
								<button class="Addbutton" type="button" data-toggle="modal" data-target="#add_overtime"><i class="fa fa-plus"></i> Add Overtime</button>
							</div>
							<!-- /Add Overtime Button -->

							<!-- Payroll Overtime Table -->
							<div class="payroll-table card">
								<div class="table-responsive">
									<table class="table table-hover table-radius">
										<thead>
											<tr>
												<th>Employee ID</th>
												<th>Overtime Date</th>
												<th>Hours</th>
												<th>Type</th>
												<th>Description</th>
								                <th style="text-align: center;" colspan="2">Actions</th>
											</tr>
											
										</thead>
						<%
                        int start2 = currentPage;
                        int limit2 = newRecordsPerPage;
                        //pagenation code start
            		    int pageno2 = 1;
            		    int noOfPages2 =0;
            		   
            		     String pageNoStr2 = request.getParameter("page");
            		     
            		     if (pageNoStr2 != null) {
            		    	 pageno2 = Integer.parseInt(pageNoStr);
            		     }

            		     start2 = (pageno2 - 1) * limit2;
            		     //pagenation code ended
                        String holidayNameFilter2 = request.getParameter("Employee_Id");
                        String idFilter2 = request.getParameter("Type");
                        List<AddOverTime> holidays2;

                        String whereClause2 = "";

                        if (holidayNameFilter2 != null && !holidayNameFilter2.isEmpty()) {
                        	whereClause2 = "Employee_Id = '" + holidayNameFilter2 + "'";
                        }

                        if (idFilter2 != null && !idFilter2.isEmpty()) {
                            if (!whereClause2.isEmpty()) {
                            	whereClause2 += " or ";
                            }
                            whereClause2 += "Type = '" + idFilter2 + "'";
                        }
                        //page
                        int recordcount2= OvertimeDAO.totalCount();

                        noOfPages2 = (int) Math.ceil((double) recordcount2 / limit2);
                      //pagee
                        if (!whereClause2.isEmpty()) {
                        	holidays2 = OvertimeDAO.getFiltereddeductions(whereClause2, start2, limit2);
                        } else {
                        	holidays2 =  OvertimeDAO.getFiltereddeductions("", start2, limit2);
                        }
                        for (AddOverTime holiday : holidays2) {
                    %>
                    <tr>
                        <td><%= holiday.getEmployee_Id()%></td>
                        <td><%= holiday.getOverTime_Date()%></td>
                        <td><%= holiday.getHours()%></td>
                         <td><%= holiday.getType()%></td>
                          <td><%= holiday.getDescription()%></td>
                           
                        <td>
                            <a class="edit" href="edit_overtime.jsp?Employee_Id=<%= holiday.getEmployee_Id()%>">Edit</a>
                            </td>
                            <td>
                            <a class="delete" href="DeleteOverTimeSrv?id=<%= holiday.getEmployee_Id()%>">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %> 
                </table>
<div class="row justify-content-center align-items-center custom-pagination d-flex justify-content-center" id="flag1"> 
   <!-- Pagination links -->

    <% if (pageno2 > 1) { %>
        <a href="payroll-items.jsp?tab_overtime&page=<%=pageno2 - 1%>"><span class="pagination-label">Previous</span></a>
    <% } %>

    <% for (int i = 1; i <= noOfPages2; i++) { %>
        <% if (i == pageno2) { %>
           <span class="pagination-number active"><%=i%></span>
        <% } else { %>
            <a href="payroll-items.jsp?tab_overtime&page=<%=i%>"><span class="pagination-number"><%=i%></span></a>
        <% } %>
    <% } %>

    <% if (pageno2 < noOfPages2) { %>
      <a href="payroll-items.jsp?tab_overtime&page=<%=pageno2 + 1%>"><span class="pagination-label">Next</span></a>
    <% } %>

</div>
							<!-- /Payroll Overtime Table -->
							
						</div>
						</div>
						</div>
						<!-- /Overtime Tab -->
						
						<!-- Deductions Tab -->
						<div class="tab-pane" id="tab_deductions">
						
							<!-- Add Deductions Button -->
							<div class="text-right mb-4 clearfix">
							<!-- <button class="btn btn-primary add-btn" type="button" data-toggle="modal" data-target="#delete_deduction"><i class="fa fa-plus"></i> Delete Deduction</button>
							<button class="btn btn-primary add-btn" type="button" data-toggle="modal" data-target="#edit_deduction"><i class="fa fa-plus"></i> Edit Deduction</button> -->
								<button class="Addbutton" type="button" data-toggle="modal" data-target="#add_deduction"><i class="fa fa-plus"></i> Add Deduction</button>
							</div>
							<!-- /Add Deductions Button -->

							<!-- Payroll Deduction Table -->
							<div class="payroll-table card">
								<div class="table-responsive">
									<table class="table table-hover table-radius">
										<thead>
											<tr>
												<th>Unitcalculation</th>
												<th>UnitAmount</th>
												<th>payrolldeductionid</th>
												<th>DeductionName</th>
												<th>Payroll_id</th>
												<th style="text-align: center;" colspan="2">Actions</th>
											</tr>
										</thead>
								<%
								    int start3 = currentPage;
								    int limit3 = newRecordsPerPage;
								    // Pagination code start
								    int pageno3 = 1;
								    int noOfPages3 = 0;
								
								    String pageNoStr3 = request.getParameter("page");
								
								    if (pageNoStr3 != null) {
								        pageno3 = Integer.parseInt(pageNoStr3);
								    }
								
								    start3 = (pageno3 - 1) * limit3;
								    // Pagination code ended
								    String holidayNameFilter3 = request.getParameter("payrolldeductionid");
								    String idFilter3 = request.getParameter("DeductionName");
								    List<AddDeductions> holidays3;
								
								    String whereClause3 = "";
								
								    if (holidayNameFilter3 != null && !holidayNameFilter3.isEmpty()) {
								        whereClause3 = "payrolldeductionid = '" + holidayNameFilter3 + "'";
								    }
								
								    if (idFilter3 != null && !idFilter3.isEmpty()) {
								        if (!whereClause3.isEmpty()) {
								            whereClause3 += " or ";
								        }
								        whereClause3 += "DeductionName = '" + idFilter3 + "'";
								    }
								    // Page
								    int recordcount3 = DeductionDAO.totalCount();
								
								    noOfPages3 = (int) Math.ceil((double) recordcount3 / limit3);
								    // Page
								    if (!whereClause3.isEmpty()) {
								        holidays3 = DeductionDAO.getFiltereddeductions(whereClause3, start3, limit3);
								    } else {
								        holidays3 = DeductionDAO.getFiltereddeductions("", start3, limit3);
								    }
								    for (AddDeductions holiday : holidays3) {
								%>
								<tr>
								    <td><%= holiday.getUnitcalculation()%></td>
								    <td><%= holiday.getUnitAmount()%></td>
								    <td><%= holiday.getPayrolldeductionid()%></td>
								    <td><%= holiday.getDeductionName()%></td>
								    <td><%= holiday.getPayroll_id()%></td>
								
								    <td>
								        <a class="edit" href="edit_deduction.jsp?id=<%= holiday.getPayrolldeductionid() %>">Edit</a>
								    </td>
								    <td>
								        <a class="delete" href="DeleteDeductionServlet?payrolldeductionid=<%= holiday.getPayroll_id()%>">Delete</a>
								    </td>
								</tr>
								<%
								    }
								%> 
								</table>
								
								<div class="row justify-content-center align-items-center custom-pagination d-flex justify-content-center" id="flag1">
								   
								   <!-- Pagination links -->
								
								<% if (pageno3 > 1) { %>
								    <a href="payroll-items.jsp?page=<%= pageno3 - 1 %>"><span class="pagination-label">Previous</span></a>
								<% } %>
								
								<% for (int i = 1; i <= noOfPages3; i++) { %>
								    <% if (i == pageno3) { %>
								       <span class="pagination-number active"><%=i%></span>
								    <% } else { %>
								        <a href="payroll-items.jsp?page=<%= i %>"><span class="pagination-number"><%=i%></span></a>
								    <% } %>
								<% } %>
								
								<% if (pageno3 < noOfPages3) { %>
								    <a href="payroll-items.jsp?page=<%= pageno3 + 1 %>"><span class="pagination-label">Next</span></a>
								<% } %>


</div>
							<!-- /Payroll Overtime Table -->
							
						</div>
						</div>
						</div>
							<!-- /Payroll Deduction Table -->
							
						
						<!-- /Deductions Tab -->
						<!-- Payroll Tab -->
						<div class="tab-pane" id="tab_payroll">
						
							<!-- Add Addition Button -->
							<div class="text-right mb-4 clearfix">
							<!-- <button class="btn btn-primary add-btn" type="button" data-toggle="modal" data-target="#delete_payroll"><i class="fa fa-plus"></i> Delete Payroll</button>
							<button class="btn btn-primary add-btn" type="button" data-toggle="modal" data-target="#edit_payroll"><i class="fa fa-plus"></i>Edit Payroll</button> -->
						    <button class="Addbutton" type="button" data-toggle="modal" data-target="#add_payroll"><i class="fa fa-plus"></i> Add Payroll</button>
							</div>
							<!-- /Add Addition Button -->
							<!-- Payroll Additions Table -->
							<div class="payroll-table card">
								<div class="table-responsive">
									<table class="table table-hover table-radius">
										<thead>
											<tr>
												<th>payroll ID</th>
										    	<th>year</th>
												<th>Month</th>
												<th>Is_opened</th>
												<th>Ranby</th>
												<th>last_modified_time</th>
												<th style="text-align: center;" colspan="2">Actions</th>
											</tr>
										</thead>
										<%
								    int start4 = currentPage;
								    int limit4 = newRecordsPerPage;
								    // Pagination code start
								    int pageno4 = 1;
								    int noOfPages4 = 0;
								
								    String pageNoStr4 = request.getParameter("page");
								
								    if (pageNoStr4 != null) {
								        pageno4 = Integer.parseInt(pageNoStr4);
								    }
								
								    start4 = (pageno4 - 1) * limit4;
								    // Pagination code ended
								    String holidayNameFilter4 = request.getParameter("payroll_id");
								    String idFilter4 = request.getParameter("Name");
								    List<Payroll> holidays4;
								
								    String whereClause4 = "";
								
								    if (holidayNameFilter4 != null && !holidayNameFilter4.isEmpty()) {
								        whereClause4 = "payroll_id = '" + holidayNameFilter4 + "'";
								    }
								
								    if (idFilter4 != null && !idFilter4.isEmpty()) {
								        if (!whereClause4.isEmpty()) {
								            whereClause4 += " or ";
								        }
								        whereClause4 += "Name = '" + idFilter4 + "'";
								    }
								    // Page
								    int recordcount4 = PayrollDAO.totalCount();
								
								    noOfPages4 = (int) Math.ceil((double) recordcount4 / limit4);
								    // Page
								    if (!whereClause4.isEmpty()) {
								        holidays4 = PayrollDAO.getFiltereddeductions(whereClause4, start4, limit4);
								    } else {
								        holidays4 = PayrollDAO.getFiltereddeductions("", start4, limit4);
								    }
								    for (Payroll holiday : holidays4) {
								%>
								    <tr>
								        <td><%= holiday.getPayroll_id()%></td>
								      <%--   <td><%= holiday.getName()%></td> --%>
								         <td><%= holiday.getYear()%></td>
								        <td><%= holiday.getMonth()%></td>
								        <td><%= holiday.getIs_opened()%></td>
								         <td><%= holiday.getRanby()%></td>
								        <td><%= holiday.getLast_modified_time()%></td>
								
								        <td>
								            <a class="edit" href="edit_deduction.jsp?id=<%= holiday.getPayroll_id()%>">Edit</a>
								        </td>
								        <td>
								            <a class="delete" href="DeletePayrollSrv?id=<%= holiday.getPayroll_id()%>">Delete</a>
								        </td>
								    </tr>
								<%
								    }
								%> 
								</table>
								
								<div class="row justify-content-center align-items-center custom-pagination d-flex justify-content-center" id="flag1">
								   
								   <!-- Pagination links -->
								
								<% if (pageno4 > 1) { %>
								    <a href="payroll-items.jsp?page=<%= pageno4 - 1 %>"><span class="pagination-label">Previous</span></a>
								<% } %>
								
								<% for (int i = 1; i <= noOfPages4; i++) { %>
								    <% if (i == pageno4) { %>
								       <span class="pagination-number active"><%=i%></span>
								    <% } else { %>
								        <a href="payroll-items.jsp?page=<%= i %>"><span class="pagination-number"><%=i%></span></a>
								    <% } %>
								<% } %>
								
								<% if (pageno4 < noOfPages4) { %>
								    <a href="payroll-items.jsp?page=<%= pageno4 + 1 %>"><span class="pagination-label">Next</span></a>
								<% } %>
								
								
								</div>
							<!-- /Payroll Overtime Table -->
							
						</div>
						</div>
						</div>
							<!-- /Payroll Additions Table -->
							
						</div>
					</div>
					<!-- Tab Content -->
					
                </div>
				<!-- /Page Content -->
				
				<!-- Add Addition Modal -->
				<jsp:include page="add_additions.jsp" />
				<!-- /Add Addition Modal -->
				
				<%-- <!-- Edit Addition Modal -->
				<jsp:include page="edit_additions.jsp" />
				<!-- /Edit Addition Modal -->
				
				<!-- Delete Addition Modal -->
				<jsp:include page="delete_additions.jsp" />
				<!-- /Delete Addition Modal --> --%>
				
				<!-- Add Overtime Modal -->
				<jsp:include page="add_overtime.jsp" />
				<!-- /Add Overtime Modal -->
				
				<%-- <!-- Edit Overtime Modal -->
				<jsp:include page="edit_overtime.jsp" />
				<!-- /Edit Overtime Modal -->
				
				<!-- Delete Overtime Modal -->
				<jsp:include page="delete_overtime.jsp" />
				<!-- /Delete Overtime Modal --> --%>
				
				<!-- Add Deduction Modal -->
				<jsp:include page="add_deductions.jsp" />
				<!-- /Add Deduction Modal -->
				
				<%-- <!-- Edit Deduction Modal -->
				<jsp:include page="edit_deduction.jsp" />
				<!-- /Edit Addition Modal -->
				
				<!-- Delete Deduction Modal -->
				<jsp:include page="delete_deduction.jsp" />
				<!-- /Delete Deduction Modal --> --%>
				<!-- Add payroll Modal -->
				<jsp:include page="add_payroll.jsp" />
				<!-- /Add payroll Modal -->
				
				<%-- <!-- Edit payroll Modal -->
				<jsp:include page="edit_payroll.jsp" />
				<!-- /Edit payroll Modal -->
				
				<!-- Delete payroll Modal -->
				<jsp:include page="delete_payroll.jsp" />
				<!-- /Delete payroll Modal -->
				 --%>
				
            </div>
			<!-- /Page Wrapper -->

   
		<!-- /Main Wrapper -->

		<!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>

		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="js/select2.min.js"></script>
		
		<!-- Datetimepicker JS -->
		<script src="js/moment.min.js"></script>
		<script src="js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Datatable JS -->
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js"></script>		

		<!-- Custom JS -->
		<script src="js/app.js"></script>
		
    </body>
</html>