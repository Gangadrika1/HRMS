<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.ExpensesDao" %>
<%@ page import="com.weblabs.service.impl.SupplierDAO" %>
<%@ page import="com.weblabs.beans.AddExpenses" %>
<%@ page import="com.weblabs.beans.SupplierBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Expenses</title>
    <!-- Add your CSS and JavaScript includes here -->
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">

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
    <!-- table styles CSS -->
    <link rel="stylesheet" href="css/styles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]-->
   <!--  <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>  -->
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("id"); // Make sure the parameter name matches your form
    List<AddExpenses> expenses = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        expenses = ExpensesDao.getFiltereExpenses(whereClause, start, limit);
    }

    if (expenses != null && !expenses.isEmpty()) {
        AddExpenses expense = expenses.get(0); // Access the first element
        if (expense != null) {
%>
<form action="./EditExpensesSrv" method="post">
 <div class="main-wrapper">

      <jsp:include page="header.jsp" />
     <jsp:include page="sidebar.jsp" />
        
        <!-- Page Wrapper -->
        <div class="page-wrapper">

            <!-- Page Content -->
            <div class="content container-fluid">

                <!-- Page Header -->
                
                <div class="page-header">
    
                    <div class="row">
                        <div class="col-sm-6">
							<div class="modal-body">
							<div class="form-group">
				               <label>ID <span class="text-danger">*</span></label>
				                  <input name="Id" readonly value="<%= expense.getId() %>" required class="form-control" type="text">
				             </div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Item Name</label>
												<input  name="ItemName" value="<%= expense.getItemName()%>" required class="form-control" value="Dell Laptop" type="text">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Purchase Date</label>
												<div class="cal-icon">
												<input name="PurchaseDate" value="<%= expense.getPurchaseDate()%>" required class="form-control datetimepicker" type="text"></div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Purchased By </label>
												<input name="PurchasedBy" value="<%= expense.getPurchasedBy()%>" required type="text"></div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Amount</label>
												<input name="Amount" value="<%= expense.getAmount()%>" required placeholder="$50" class="form-control" value="$10000" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Paid By</label>
												<select value="<%= expense.getPaidBy()%>" required name="PaidBy" class="select">
													<option>Cash</option>
													<option>Cheque</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Status</label>
												<select value="<%= expense.getStatus()%>" required name="Status" class="select">
													<option>Pending</option>
													<option>Approved</option>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Attachments</label>
												<input value="<%= expense.getAttachments()%>" required name="Attachments" class="form-control" type="file">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Supplier Name</label>
												<select required name="Supplierid" class="form-control" class="select">
                                                        <%
											List<SupplierBean> dept = SupplierDAO.getAllSuppliers(); 
											for(SupplierBean dep: dept)
											{
											%>
                                           <option  value="<%= dep.getSupplierID() %>"><%= dep.getSupplierName() %></option>
                                        <%
                          					}
									     %>
                                    </select>
												
											</div>
										</div>
									</div>
							 </div>
                        </div>
                    </div>
                    <div class="submit-section">
					<button class="btn btn-primary submit-btn" type="submit">Submit</button>
					</div>
                    
                </div>
            </div>
        </div>
    </form>
<%
    HttpSession sessionstatus = request.getSession(true);
    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("Expenses Position Updated Successfully!")) {
        response.sendRedirect("expenses.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>Expenses not found with the provided ID.</p>
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