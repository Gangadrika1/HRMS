<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.weblabs.service.impl.AppProjectDAO"%>
<%@page import="com.weblabs.service.impl.ProjectDAO"%>
<%@page import="com.weblabs.service.impl.AddClientsDAO"%>
<%@page import="com.weblabs.service.impl.InvoiceDAO"%>
<%@ page import="com.weblabs.beans.AddClient" %>	
<%@ page import="com.weblabs.beans.CreateProject" %>
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
        <title>Create Invoice - HRMS admin template</title>
		
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
		
		
     <script>
    function validateDates() {
        var startDateStr = document.getElementsByName("invoicedate")[0].value;
        var endDateStr = document.getElementsByName("duedate")[0].value;

        var startDate = new Date(startDateStr);
        var endDate = new Date(endDateStr);

        if (startDate > endDate) {
            alert("End date must be after the start date.");
            return false;
        }

        return true;
    }
</script>

		
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
    
   <!--   <script src="js/validateForm.js"></script> -->
     
    
 
 
 
 
 
 
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
$(document).ready(function () {
    var selectedclientID; // Declare selectedclientID outside the function

    function reloadMonths() {
        selectedclientID = $("#client").val();
        $.ajax({
            type: "GET",
            url: "FetchProjectnameServlet",
            data: {client: selectedclientID},
            success: function (data) {
                $("#projectname").html(data);
                $("#projectname").trigger("change");
            }
        });
    }

    $("#client").change(function () {
        reloadMonths();

        // Fetch email using AJAX with selectedclientID
        $.ajax({
            type: "GET",
            url: "FetchEmailServlet",
            data: {client: selectedclientID},
            success: function (aaaa) {
                $("#email").val(aaaa);
            }
        });
    });

    reloadMonths(); // Initial call to load data on page load
});

 </script>

    </head>
    <body>
    
   
    <form action="./AddInvoiceSrv" method="post" onsubmit="return validateDates();">
	
        <div class="main-wrapper">
		

         <jsp:include page="header.jsp" />

   
        <jsp:include page="sidebar.jsp" />

            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Create Invoice</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dash board</a></li>
									<li class="breadcrumb-item active">Create Invoice</li>
								</ul>
							</div>
						</div>
					</div>
				
					
					<div class="row">
						<div class="col-sm-12">
							
								<div class="row">
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label for="client" >Client User_name<span class="text-danger">*</span></label>
											<select required name="client" class="select" id="client">
                                             <%
                                             String selectedclientID = request.getParameter("client");
											List<AddClient> dept = AddClientsDAO.getAllClient();
											for(AddClient client: dept)
											{
											%>
                                       <%--     <option  value="<%= dep.getClientID() %>"><%= dep.getUsername()%></option> --%>
                                             <option  <%= (selectedclientID != null && selectedclientID.equals(client.getClientID())) ? "selected" : "" %>> <%= client.getClientID() %></option>
                                        <%
                          					}
									     %>
                                    </select>
										</div>
									</div>
									
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label for="projectname">project name <span class="text-danger">*</span></label>
											<select  name="projectname" class="select" id="projectname">
											 </select>
										</div>
									</div>
									<!-- <div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label for="email">Client Email</label>
											<select  name="email" class="select" id="email">
						             	 </select>				               
										</div>
									</div> -->
<div class="col-sm-6 col-md-3">
    <div class="form-group">
        <label for="email">Client Email</label>
        <input type="text" name="email" class="form-control" id="email" />
    </div>
</div>
									
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Tax</label>
											<select class="select" name="taxSelect" id="taxSelect" onchange="updateTaxRate()">
												    <option value="0">Select Tax</option>
												    <option value="10">VAT (10%)</option>
												    <option value="20">GST (20%)</option>
												    <option value="0">No Tax</option>
												</select>
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Client Address</label>
											<textarea name="clientaddress" class="form-control" rows="3"></textarea>
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Billing Address</label>
											<textarea name="billingaddress" class="form-control" rows="3"></textarea>
										</div>
									</div>
									
									
									
									
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Invoice date <span class="text-danger">*</span></label>
												<input name="invoicedate" class="form-control" type="date">											
										</div>
									</div>
									<div class="col-sm-6 col-md-3">
										<div class="form-group">
											<label>Due Date <span class="text-danger">*</span></label>
												<input name="duedate" class="form-control " type="date">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="table-responsive">
											<table class="table table-hover table-white" id="itemTable" >
												<thead>
													<tr>
														<th style="width: 20px">ID</th>
														<th class="col-sm-2">Item</th>
														<th class="col-md-6">Description</th>
														<th style="width:100px;">Unit Cost</th>
														<th style="width:80px;">Qty</th>
														<th>Amount</th>
														<th> </th>
													</tr>
												</thead>
												<tbody>
												<tr>
													<td>1</td>
													<td>
													<!-- 	<input name="items" class="form-control" type="text" style="min-width:150px"> -->
														 <input name="items" id="items" required class="form-control" type="text"  >
                                                        <span id="itemsError" style="display: none; color: red;"></span>
                              
													</td>
													<td>
														<input name="description" class="form-control" type="text" style="min-width:150px">
													</td>
													<td>
														<input name="unitcost" class="form-control" style="width:100px" type="text">
													</td>
													<td>
														<input name="qty" class="form-control" style="width:80px" type="text"  >
													</td>
													<td>
														<input name="amount" class="form-control" style="width:100px" type="text" readonly>
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
										<div class="table-responsive">
											<table class="table table-hover table-white" >
												<tbody>
													<tr>
														
														<td colspan="5"  class="text-right">Total</td>
														<td style="text-align: right; padding-right: 30px;width: 230px">
														<input name="total" id="total" class="form-control text-right" readonly type="text">
														</td>
													</tr>
													<tr>
														<td colspan="3" class="text-right">Tax Rate %</td>
														<td style="text-align: right; padding-right: 30px;width: 230px">
														
															<input id="taxrate" name="taxrate" class="form-control text-right" type="text" readonly onchange="updateTaxRate()">
															</td>
															
														   	<td colspan="5" class="text-right">Tax Amount</td>
															<td style="text-align: right; padding-right: 30px;width: 230px">
															    <input id=  "taxAmount" name="taxAmount" class="form-control text-right" readonly  type="text" >
															</td>
													</tr>

													<tr>
														<td colspan="5" class="text-right">
															Discount %
														</td>
														<td style="text-align: right; padding-right: 30px;width: 230px">
															

															<input name="discount" id="discount" class="form-control text-right" type="text" value="0" onblur="calculateAll()">
															
														</td>
													</tr>
													<tr>
														<td colspan="5" style="text-align: right; font-weight: bold">
															Grand Total
														</td>
														<td style="text-align: right; padding-right: 30px; font-weight: bold; font-size: 16px;width: 230px">
														
															<input name="grandtotal" id="grandtotal" class="form-control text-right" type="text" value="0" onblur="calculateAll()">
														</td>
													</tr>
												</tbody>
											</table>                               
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group" >
													<label>Other Information</label>
													<textarea name="OtherInformation" id="OtherInformation" class="form-control"></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="submit-section">
								<button class="btn btn-primary submit-btn m-r-10">Save &amp; Send</button>
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
		
		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="js/select2.min.js"></script>
		
		<!-- Datetimepicker JS -->	
		<script src="js/moment.min.js"></script>
		<script src="js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Custom JS -->
		<script src="js/app.js"></script>
		
		
		
		<script>
var rowCount = 1; // Initialize the row count to 0

function addItem(button) {
	  var table = document.getElementById("itemTable").getElementsByTagName('tbody')[0];
      var newRow = table.insertRow(-1); // Insert a new row at the end of the table

    var cell1 = newRow.insertCell(0);
    cell1.innerHTML = rowCount + 1; // Auto-increment item number

    var cell2 = newRow.insertCell(1);
    var itemsInput = document.createElement("input");
    itemsInput.name = "items";
    itemsInput.className = "form-control";
    itemsInput.type = "text";
    itemsInput.style.minWidth = "150px";
    cell2.appendChild(itemsInput);

    var cell3 = newRow.insertCell(2);
    var descriptionInput = document.createElement("input");
    descriptionInput.name = "description";
    descriptionInput.className = "form-control";
    descriptionInput.type = "text";
    descriptionInput.style.minWidth = "150px";
    cell3.appendChild(descriptionInput);

    var cell4 = newRow.insertCell(3);
    var unitCostInput = document.createElement("input");
    unitCostInput.name = "unitcost";
    unitCostInput.className = "form-control";
    unitCostInput.type = "text";
    unitCostInput.style.width = "100px";
    cell4.appendChild(unitCostInput);

    var cell5 = newRow.insertCell(4);
    var qtyInput = document.createElement("input");
    qtyInput.name = "qty";
    qtyInput.className = "form-control";
    qtyInput.type = "text";
    qtyInput.style.width = "80px";
    qtyInput.onblur = calculateAmount;
    cell5.appendChild(qtyInput);

    var cell6 = newRow.insertCell(5);
    var amountInput = document.createElement("input");
    amountInput.name = "amount";
    amountInput.className = "form-control";
    amountInput.type = "text";
    amountInput.style.width = "100px";
    amountInput.readOnly = true;
    cell6.appendChild(amountInput);
    
    var cell7 = newRow.insertCell(6);
    var addLink = document.createElement("a");
    addLink.href = "javascript:void(0)";
    addLink.className = "text-success font-18";
    addLink.title = "Add";
    addLink.innerHTML = '<i class="fa fa-plus"></i>';
    addLink.onclick = addItem;
    cell7.appendChild(addLink);

    var cell8 = newRow.insertCell(7);
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

/* window.addEventListener('DOMContentLoaded', function() {
    calculateStaticAmount();
}); */

//Calculate the amount for the static row initially
window.addEventListener('DOMContentLoaded', function() {
    var staticRow = document.querySelector('#itemTable tbody tr');
    if (staticRow) {
        calculateAmount(staticRow);
    }
});
 
 
	</script>
	
<!-- 	 <script>
    $(document).ready(function () {
        function reloadMonths() {
            var selectedclientID = $("#client").val();
            $.ajax({
                type: "GET",
                url: "FetchProjectnameServlet",
                //console.log(url);
                data: {client_username: selectedclientID},
                success: function (data) {
                    $("#projectname").html(data);
                    
                    // Trigger change event after updating invoice IDs to populate payment amount
                    $("#projectname").trigger("change");
                }
            });
        }

        $("#client").change(function () {
            reloadMonths();
        });
        
        

/*         $("#client").change(function () {
            var selectedclientID = $(this).val(); */
            $.ajax({
                type: "GET",
                url: "FetchEmailServlet", 
                data: {client_username: selectedclientID},
                success: function (aaaa) {
                    $("#email").val(aaaa);
                }
            });

        reloadMonths();
    });
</script>  
 -->		
          <script>
    var taxAmount = 0;
    var discount = 0;

    function updateTaxRate() {
       // console.log("updateTaxRate entered");
        var taxSelect = document.getElementById("taxSelect");
        var selectedOption = taxSelect.options[taxSelect.selectedIndex];
        var taxRate = parseFloat(selectedOption.value);

        var taxRateInput = document.querySelector('input[name="taxrate"]');
        taxRateInput.value = taxRate.toFixed(1);

        // Recalculate tax amount and grand total with the updated tax rate
        calculateAll();
    }

    function calculateAmount(row) {
     //   console.log("calculateAmount entered");
        var unitCostInput = row.querySelector('input[name="unitcost"]');
        var qtyInput = row.querySelector('input[name="qty"]');
        var amountInput = row.querySelector('input[name="amount"]');

        var unitCost = parseFloat(unitCostInput.value) || 0;
        var quantity = parseFloat(qtyInput.value) || 0;

        var amount = unitCost * quantity;
        amountInput.value = amount.toFixed(2);

        // Calculate and update the total
        calculateAll();
    }

    function calculateAll() {
      //  console.log("calculateAll entered");
        var itemRows = document.querySelectorAll('#itemTable tbody tr');
        var total = 0;

        itemRows.forEach(function (row) {
            var amountInput = row.querySelector('input[name="amount"]');
            total += parseFloat(amountInput.value) || 0;
        });

        var totalInput = document.querySelector('input[name="total"]');
        totalInput.value = total.toFixed(2);

        calculateTaxAndGrandTotal(total);
    }

    function calculateTaxAndGrandTotal(total) {
       // console.log("calculateTaxAndGrandTotal entered");
        var taxRateInput = document.querySelector('input[name="taxrate"]');
        var taxRate = parseFloat(taxRateInput.value) || 0;

        taxAmount = (total * taxRate) / 100;
     //   console.log("Tax Amount:", taxAmount);
        var taxAmountInput = document.querySelector('input[name="taxAmount"]');
        taxAmountInput.value = taxAmount.toFixed(2);

        calculateGrandTotal(total, taxAmount);
    }

    function calculateGrandTotal(total, taxAmount) {
       // console.log("calculateGrandTotal entered");
        var discountInput = document.querySelector('input[name="discount"]');
        discount = parseFloat(discountInput.value) || 0;
        
        // Ensure that the discount is less than 99%
        if (discount >= 99) {
            discountInput.value = 0; // Reset the discount to 0
            discount = 0;
        }

        var grandTotal = total + taxAmount - (total * discount / 100);

        var grandTotalInput = document.querySelector('input[name="grandtotal"]');
        grandTotalInput.value = grandTotal.toFixed(2);

        // Retrieve the values and display them
        var taxRateInput = document.querySelector('input[name="taxrate"]');
        var taxRate = parseFloat(taxRateInput.value) || 0;

        var taxAmountInput = document.querySelector('input[name="taxAmount"]');
        var taxAmount = parseFloat(taxAmountInput.value) || 0;

        var grandTotalValue = parseFloat(grandTotalInput.value) || 0;

        // Display the values on the page or use them as needed
      	
        
       
    }

    // Attach event listeners to relevant input elements
    document.querySelectorAll('input[name="unitcost"]').forEach(function (input) {
        input.addEventListener('input', function () {
            var row = input.closest('tr');
            calculateAmount(row);
        });
    });

    document.querySelectorAll('input[name="qty"]').forEach(function (input) {
        input.addEventListener('input', function () {
            var row = input.closest('tr');
            calculateAmount(row);
        });
    });

    
    document.querySelector('input[name="discount"]').addEventListener('input', calculateAll);

    window.onload = function () {
        updateTaxRate(); // Update tax rate on page load
    };
</script>

<script>
    function validateForm(event) {
        event.preventDefault(); // Prevent form submission by default

        var isValid = true;

        // Perform validation for each field
        if (!validateName(document.getElementById('email').value, 'emailError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
        if (!validateName(document.getElementById('items').value, 'itemsError')) {
            isValid = false;
        }
        
        if (!validateContactNumber(document.getElementById('phone').value, 'phoneError')) {
            isValid = false;
        }

        if (!validateEmail(document.getElementById('email').value, 'emailError')) {
            isValid = false;
        }
        
        if (!checkJoiningDate(document.getElementById('Joining_Date').value, 'Joining_DateError')) {
            isValid = false;
        }

        // If the form is not valid, display errors and prevent form submission
        if (!isValid) {
            // Display errors or perform any other necessary actions
            return false; // Prevent form submission
        }

        // If the form is valid, you can submit the form
        return true;
    }
</script>




		</form>
    </body>
</html>