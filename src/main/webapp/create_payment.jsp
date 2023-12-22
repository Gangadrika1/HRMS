
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.PaymentDAO" %>
<%@ page import="com.weblabs.beans.PaymentBean" %>
<%@ page import="java.util.List" %>

<%@page import="com.weblabs.service.impl.AddClientsDAO"%>
<%@ page import="com.weblabs.beans.AddClient" %>

<%@page import="com.weblabs.service.impl.InvoiceDAO"%>
<%@ page import="com.weblabs.beans.AddInvoice" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<html lang="en">
	    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Create Payment - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="css/line-awesome.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="css/select2.min.css">
		
		<!-- Dāatetimepicker CSS -->
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		
		<!-- Main CSS --> 
        <link rel="stylesheet" href="css/style.css">
	
	
		 <style>
        #itemTable {
            max-height: 300px; /* Adjust the maximum height as needed */
            overflow-y: auto;
        }
        .disabled-link {
			    color: gray; /* Change the text color to gray */
			    pointer-events: none; /* Remove pointer events, making it non-clickable */
			}
    </style>
    
    
    
     <script src="js/validateForm.js"></script>
     
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>  
  <script>
    $(document).ready(function () {
        function reloadMonths() {
            var selectedclientID = $("#client_username").val();
            $.ajax({
                type: "GET",
                url: "FetchclientServlet",
                data: {client_username: selectedclientID},
                success: function (data) {
                    $("#invoice_id").html(data);                   
                    // Trigger change event after updating invoice IDs to populate payment amount
                    $("#invoice_id").trigger("change");
                }
            });
        }
        $("#client_username").change(function () {
            reloadMonths();
        });
        $("#invoice_id").change(function () {
            var selectedInvoiceID = $(this).val();    
            $.ajax({
                type: "GET",
                url: "FetchPaymentAmountServlet", // Replace with the actual servlet or URL to fetch payment amount
                data: {invoice_id: selectedInvoiceID},
                success: function (paymentAmount) {
                    $("#payment_amt").val(paymentAmount);
                }
            });
            $.ajax({
                type: "GET",
                url: "FetchDueDateServlet", // Replace with the actual servlet or URL to fetch due date
                data: {invoice_id: selectedInvoiceID},
                success: function (dueDate) {
                    $("#due_date").val(dueDate);
                }
            });
        });
        reloadMonths();
    });
</script>   
    </head>
    <body>
<form action="./AddPaymentSrv" method="post">	
        <div class="main-wrapper">			
         <jsp:include page="header.jsp" />
        <jsp:include page="sidebar.jsp" />			
            <div class="page-wrapper">				
                <div class="content container-fluid">				
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Create Payment</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Create Payment</li>
								</ul>
							</div>
						</div>
					</div>					
					<div class="row">
						<div class="col-sm-12">
							
								<div class="row">
								
									<div class="col-sm-6 col-md-3">
										 <div class="form-group">
                            <label for="client_username" >client_Username <span class="text-danger">*</span></label>
                            <select required name="client_username" class="select" id="client_username">
                           <%
                                           String selectedclientID = request.getParameter("client_username");
											List<AddClient> dept = AddClientsDAO.getAllClient();
											for(AddClient client_username: dept)
											{
											%>
                                           <option  <%= (selectedclientID != null && selectedclientID.equals(client_username.getUsername())) ? "selected" : "" %>> <%= client_username.getUsername() %></option>
                                        <%}%>
                         </select>
                        </div>
						</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
                                    
                                     <label for="invoice_id">invoice_id <span class="text-danger">*</span></label>
                            <select  name="invoice_id" class="select" id="invoice_id">                    
                         </select>                                    
                                </div>
									</div>								
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
                                     <label class="col-form-label" for="payment_amt">Pending amount <span class="text-danger">*</span></label>
                                      <input style="height: 40px; width: 220px" readonly name="payment_amt" class="select" id="payment_amt" class="form-control ">    
                                </div>
									</div>
									<div class="col-sm-6 col-md-3">
									<div class="form-group">
                                     <label for="due_date">due_date <span class="text-danger">*</span></label>
                                  <input style="height: 40px; width: 220px" readonly name="due_date" class="select" id="due_date" class="form-control ">              
                                </div>	
                                </div>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="table-responsive">
											<table class="table table-hover table-white" id="itemTable" >
												<thead>
													<tr>
														<th>ID</th>
														<th>Amount Paid</th>
														<th>payment_date</th>
														<th>Balance_Amt</th>														
													</tr>
												</thead>																								
												<tbody>
												<tr>
													<td>1</td>
													<td>													 
														 <input name="amount_paid" id="amount_paid" required class="form-control" type="text"  oninput="calculateBalance()" >
                                                        <span id="amount_paid_error" style="display: none; color: red;"></span>
													</td>
													<td>
														<input name="payment_date" class="form-control" type="date" >
													</td>
													<td>
														 <input name="balance_amt" id="balance_amt" class="form-control"  type="text" readonly>
													</td>
												 <td>
										                <a href="javascript:void(0)" class="text-success font-18" title="Add" onclick="addItem(this)"><i class="fa fa-plus"></i> </a>
										            </td>
										            <td>
										                <a href="javascript:void(0)" class="text-danger font-18 disabled-link"  title="Remove" ><i class="fa fa-trash-o"></i> </a>
										            </td>
												</tr>
												</tbody>
											</table>
										</div>							
									</div>	
								</div>
								<div class="submit-section">
									<button class="btn btn-primary submit-btn">Save</button>
								</div>
						</div>
					</div>
				</div>
			</div>			
        </div>               		
		<!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>		
		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>		
		<script src="js/jquery.slimscroll.min.js"></script>				
		<script src="js/select2.min.js"></script>			
		<script src="js/moment.min.js"></script>
		<script src="js/bootstrap-datetimepicker.min.js"></script>			
		<script src="js/app.js"></script>			
	<script>
        function calculateBalance() {
            // Get the values
            var paymentAmt = parseFloat(document.getElementById('payment_amt').value) || 0;
            var amountPaid = parseFloat(document.getElementById('amount_paid').value) || 0;

            // Calculate the balance
            var balanceAmt = paymentAmt - amountPaid;

            // Display the balance
            document.getElementById('balance_amt').value = balanceAmt;
        }
    </script>	
	<script>
		var rowCount = 1; // Initialize the row count to 0
		function addItem(button) {
			  var table = document.getElementById("itemTable").getElementsByTagName('tbody')[0];
		      var newRow = table.insertRow(-1); // Insert a new row at the end of the table
		    var cell1 = newRow.insertCell(0);
		    cell1.innerHTML = rowCount + 1; // Auto-increment item number
		    var cell2 = newRow.insertCell(1);
		    var itemsInput = document.createElement("input");
		    itemsInput.name = "Amount_paid";
		    itemsInput.className = "form-control";
		    itemsInput.type = "text";
		    itemsInput.style.minWidth = "150px";
		    cell2.appendChild(itemsInput);
		
		    var cell3 = newRow.insertCell(2);
		    var descriptionInput = document.createElement("input");
		    descriptionInput.name = "payment_date";
		    descriptionInput.className = "form-control";
		    descriptionInput.type = "date";
		    descriptionInput.style.minWidth = "150px";
		    cell3.appendChild(descriptionInput);
		
		    var cell4 = newRow.insertCell(3);
		    var unitCostInput = document.createElement("input");
		    unitCostInput.name = "Balance_Amt";
		    unitCostInput.className = "form-control";
		    unitCostInput.type = "text";
		    unitCostInput.style.minwidth = "150px";
		    cell4.appendChild(unitCostInput);
			
		    var cell7 = newRow.insertCell(4);
		    var addLink = document.createElement("a");
		    addLink.href = "javascript:void(0)";
		    addLink.className = "text-success font-18";
		    addLink.title = "Add";
		    addLink.innerHTML = '<i class="fa fa-plus"></i>';
		    addLink.onclick = addItem;
		    cell7.appendChild(addLink);
		   
		    var cell8 = newRow.insertCell(5);
		    var removeLink = document.createElement("a");
		    removeLink.href = "javascript:void(0)";
		    removeLink.className = "text-danger font-18";
		    removeLink.title = "Remove";	
		    removeLink.innerHTML = '<i class="fa fa-trash-o"></i>';
		    removeLink.onclick = removeItem;
		    cell8.appendChild(removeLink);
		    
		    rowCount++; // Increment the row count
		    var qtyInput = newRow.querySelector('input[name="qty"]');
		    qtyInput.addEventListener("blur", function () {
		        calculateAmount(newRow);
		    });
		
		 
		    
		    if (rowCount >= 5) {
		        document.getElementById("itemTable").style.overflowY = "scroll";
		    }
		    
		    }
		    
		
		 function removeItem(button) {
		    if (rowCount > 0) {
		        var table = document.getElementById("itemTable");
		        table.deleteRow(rowCount); // Remove the last row
		        rowCount--; // Decrement the row count
		    } 
		    var row = button.parentNode.parentNode; // Go up two levels to reach the 'tr' element
		    var table = row.parentNode;
		    table.removeChild(row);
		    rowCount--;
		
		    if (rowCount < 5) {
		        document.getElementById("itemTable").style.overflowY = "auto";
		    }
		    var rows = table.getElementsByTagName('tr');
		    for (var i = 0; i < rows.length; i++) {
		        rows[i].getElementsByTagName('td')[0].textContent = i + 1;
		    }
		  }
		document.addEventListener("blur", function (event) {
		    if (event.target && event.target.name === "qty") {
		        calculateAmount(event.target);
		    }
		});
		
		window.addEventListener('DOMContentLoaded', function() {
		    calculateStaticAmount();
		});
		
		//Calculate the amount for the static row initially
		window.addEventListener('DOMContentLoaded', function() {
		    var staticRow = document.querySelector('#itemTable tbody tr');
		    if (staticRow) {
		        calculateAmount(staticRow);
		    }
		});
	</script>


		</form>
    </body>
</html>