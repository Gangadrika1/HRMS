<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.weblabs.service.impl.DesignationDAO" %>
<%@ page import="com.weblabs.beans.AddDesignation" %>
<%@ page import="com.weblabs.service.impl.DepartmentDAO" %>
<%@ page import="com.weblabs.beans.AddDepartment" %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Employee Profile - HRMS admin template</title>
		
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
		
		<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
    
    
    <script>
function getEmployeeDetails() {
    console.log("Emp Details Entry");
    var selectedEmployeeId = document.getElementById("empid").value;
    console.log("Selected Employee ID: " + selectedEmployeeId);

    // Make an AJAX request to the server to get the employee details
    var xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var employeeDetails = JSON.parse(xhr.responseText);
              //  console.log(employeeDetails);

                // Update form fields with retrieved values
                document.getElementById("firstname").value = employeeDetails.firstname || '';
                document.getElementById("lastname").value = employeeDetails.lastname || '';
                document.getElementById("phone").value = employeeDetails.phone || '';
              //  document.getElementById("gender").value = employeeDetails.gender || '';
              
  
                
    var genderSelect = document.getElementById("gender");
    var selectedGender = employeeDetails.gender || '';

    // Loop through options to find the matching value
    for (var i = 0; i < genderSelect.options.length; i++) {
        if (genderSelect.options[i].value === selectedGender) {
            genderSelect.selectedIndex = i;
          //  console log(i);
            break;
        }
    }          
    
    var designationSelect = document.getElementsByName("designation")[0]; // Using getElementsByName as an example
    var selectedDesignation = employeeDetails.designation || '';

    if (designationSelect) {
        for (var i = 0; i < designationSelect.options.length; i++) {
            var optionValue = designationSelect.options[i].value.split('|')[0]; // Assuming department ID is before '|'
            if (optionValue === selectedDesignation) {
                designationSelect.selectedIndex = i; // Set selected index
                designationSelect.dispatchEvent(new Event('change')); // Trigger change event
                break;
            }
        }
    } else {
        console.error("Element with name 'designation' not found.");
    }

    var departmentSelect = document.getElementsByName("department")[0]; // Using getElementsByName as an example
    var selectedDepartment = employeeDetails.department || '';

    if (departmentSelect) {
        for (var i = 0; i < departmentSelect.options.length; i++) {
            var optionValue = departmentSelect.options[i].value.split('|')[0]; // Assuming department ID is before '|'
            if (optionValue === selectedDepartment) {
            	departmentSelect.selectedIndex = i; // Set selected index
                departmentSelect.dispatchEvent(new Event('change')); // Trigger change event
                break;
            }
        }
    } else {
        console.error("Element with name 'department' not found.");
    }

  

    
                // Update more fields as needed
            } else {
                console.error('Request failed with status:', xhr.status);
            }
        }
    };

    xhr.open("GET", "getEmployeeDetails.jsp?employeeId=" + selectedEmployeeId, true);
    xhr.send();
}
</script>

    <!-- Main Wrapper -->
        <div class="main-wrapper">
    <!-- Include your header HTML here -->
    <jsp:include page="header.jsp" />

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />
    <!-- Include your sidebar HTML here -->

    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <!-- Page Content -->
        <div class="content container-fluid">
            <form action="./AddProfileServlet" method="post">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="page-title">Profile</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Profile</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Other content or form elements can be placed here -->
           
						
						<!-- Profile Modal -->
							<div class="row">
								<div class="col-md-12">
									<h2>Profile Information</h2>
							</div>
							</div>
			<div class="row">
    <div class="form-group">
        <label>EmployeeId <span class="text-danger">*</span></label>
<select name="empid" id="empid" class="form-control" required onchange="getEmployeeDetails()">
   <!--      <select name="empid" class="form-control" required onchange="getEmployeeDetails()"> -->
            <!-- Optional default opion -->
            <option value="">Select an employee</option>
            <% 
            try {
                // Call the method to get all employee data
                List<EmployeeBean> employees = EmployeeDAO.getAllEmployees();
                
                // Loop through the list and generate <option> elements
                for (EmployeeBean employee : employees) {
            %>
            <option  value="<%= employee.getEmployee_ID() %>"><%= employee.getEmail() %></option>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace(); // Print the exception trace for debugging
            }
            %>
        </select>
    </div>
</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>First Name <span class="text-danger">*</span></label>
				
					    <input type="text" id="firstname" name="firstname" class="form-control">
					       
								</div>
							</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Last Name <span class="text-danger">*</span></label>
			   
			       <input type="text" id="lastname" name="lastname" class="form-control">
						</div>
					</div>
							
					
						

							<div class="col-md-6">
								<div class="form-group">
									<label>Birth Date</label>
									<div class="cal-icon">
										<input name="date" class="form-control datetimepicker" type="text">
									</div>
								</div>
							</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Gender</label>
							<!-- <select class="select form-control" id="gender" name="gender">
								<option value="male selected">Male</option>
								<option value="female">Female</option> 
							</select> -->
							<select id="gender" name="gender">
						  
								    <option value="0">Female </option>
								      <option value="1">Male</option>
								    <option value="2">Other</option>
								</select>
							
						</div>
					</div>
										
								<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Address</label>
												<input type="text" name="address" class="form-control">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>State</label>
												<input type="text" name="state" class="form-control">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Country</label>
												<input type="text" name="country" class="form-control">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Pin Code</label>
												<input type="text" name="pincode" class="form-control">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Phone Number</label>
												<input type="text" id="phone" name="phone" class="form-control">
											</div>
										</div>
										
				
										
								<div class="col-md-6">
								
								<div class="form-group">
                                    <label>Department <span class="text-danger">*</span></label>
                                    <select  id="department"  name="department" class="select">
                                    <!--    <input type="hidden" id="departmentIdInput" name="departmentId" value="">  -->
                                       <%
											List<AddDepartment> dept = DepartmentDAO.getAllDepartmenet();
											for(AddDepartment dep: dept)
											{
											%>
                                           <option  value="<%= dep.getId() %>"><%= dep.getDepartmentName() %></option>
                                        <%
                          					}
									     %>
                                    </select>
                                </div>
                            </div>
        
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Designation <span class="text-danger">*</span></label>
                                    <select id="designation"  name="designation" class="select">
                                    <!--    <input type="hidden" id="departmentIdInput" name="departmentId" value="">  -->
                                       <%
											List<AddDesignation> desig = DesignationDAO.getAllDesignation();
											for(AddDesignation dep: desig)
											{
											%>
                                           <option  value="<%= dep.getId()%>"><%= dep.getDesignationName() %></option>
                                        <%
                          					}
									     %>
                                    </select>
                                </div>
                            </div>
                            
									<!-- <div class="form-group">
										<label>Department Name <span class="text-danger">*</span></label>
										<input type="text" name="department" class="form-control">
									</div>
								</div> -->
										<!-- <div class="col-md-6">
											<div class="form-group">
												<label>Designation Name <span class="text-danger">*</span></label>
												<input type="text" name="designation" class="form-control">
										</div>
										</div> -->
						<div class="col-md-6">
							<div class="form-group">
								<label>Reports To <span class="text-danger">*</span></label>
								<select class="select" name="report">
								
								<% 
            try {
                // Call the method to get all employee data
                List<EmployeeBean> employees = EmployeeDAO.getAllEmployees();
                
                // Loop through the list and generate <option> elements
                for (EmployeeBean employee : employees) {
            %>
            <option  value="<%= employee.getEmployee_ID() %>"><%= employee.getEmail() %></option>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace(); // Print the exception trace for debugging
            }
            %>
								
									<!-- <option>-</option>
									<option>Wilmer Deluna</option>
									<option>Lesley Grauer</option>
									<option>Jeffery Lalor</option> -->
								</select>
							</div>
						</div>
		</div>
								<!-- /Profile Modal -->	
		<div class="row">
    <div class="col-md-12 col-sm-12">
        <h3>Personal Information</h3>
        <div class="table-responsive">
            <table class="table table-hover table-white" id="personal">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Passport No</th>
                        <th>Pspt Expiry Date</th>
                        <th>Tel</th>
                        <th>Nationality</th>
                        <th>Religion</th>
                        <th>Marital status</th>
                        <th>Employment of spouse</th>
                        <th>No. of children</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <input type="text" name="passportno" class="form-control">
                        </td>
                        <td>
                            <input class="form-control datetimepicker" name="passportexpirydate" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="tel" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="nation" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="religion" type="text">
                        </td>
                        <td>
                            <select class="select form-control" name="status">
                                <option>Single</option>
                                <option>Married</option>
                            </select>
                        </td>
                        <td>
                            <select class="form-control" name="empspouse" >
                                   <option>Employed </option>
								   <option>Unemployed </option>
								   <option> Self-Employed</option>
								   <option> Other</option>
								</select>
							
                        </td>
                        <td>
                            <input class="form-control" name="children" type="text">
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="text-success font-18" title="Add" onclick="addItem(this)"><i class="fa fa-plus"></i> </a>
                        </td>
                        <td>
                         <a href="javascript:void(0)" class="text-danger font-18 disabled-link" title="Remove"><i class="fa fa-trash-o"></i></a>                        </td>
                  					           
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

												<div class="row">
								    <div class="col-md-12 col-sm-12">
								        <h3>Emergancy Contact</h3>
										<div class="table-responsive">
											<table class="table table-hover table-white" id="emergancy" >
												<thead>
													<tr>
														<th>ID</th>
														<th>Name</th>
														<th>Relationship</th>
														<th>Phone </th>
														<th>Mobile</th>
													</tr>
												</thead>
												<tbody>
												<tr>
													<td>1</td>
													<td>
														<input type="text" name="namee" class="form-control">
													</td>
													<td>
														<input class="form-control" name="relationships" type="text">
													</td>
													<td>
														<input class="form-control" name="phone" type="text">
													</td>
													<td>
														<input class="form-control" name="mobile" type="text">
													</td>
												 <td>
										                <a href="javascript:void(0)" class="text-success font-18" title="Add" onclick="addrow(this)"><i class="fa fa-plus"></i> </a>
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
										
										<div class="row">
    <div class="col-md-12 col-sm-12">
        <h3>Bank Information</h3>
        <div class="table-responsive">
            <table class="table table-hover table-white" id="bank">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>BANK Name</th>
                        <th>Bank account No</th>
                        <th>IFSC Code</th>
                        <th>PAN NO</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <input type="text" name="username" class="form-control">
                        </td>
                        <td>
                            <input class="form-control" name="bankname" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="bankaccountno" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="ifsccode" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="panno" type="text">
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="text-success font-18" title="Add" onclick="addBank(this)"><i class="fa fa-plus"></i></a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="text-danger font-18 disabled-link" title="Remove"><i class="fa fa-trash-o"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

										
										<div class="row">
    <div class="col-md-12 col-sm-12">
        <h3>Family Information</h3>
        <div class="table-responsive">
            <table class="table table-hover table-white" id="family">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Person Name</th>
                        <th>Relationship</th>
                        <th>Date of Birth</th>
                        <th>Phone</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <input class="form-control" name="name" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="relationship" type="text">
                        </td>
                        <td>
                            <input class="form-control datetimepicker" name="dob" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="phonee" type="text">
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="text-success font-18" title="Add" onclick="addfam(this)"><i class="fa fa-plus"></i></a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="text-danger font-18 disabled-link" title="Remove"><i class="fa fa-trash-o"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

										<div class="row">
    <div class="col-md-12 col-sm-12">
        <h3>Education Information</h3>
        <div class="table-responsive">
            <table class="table table-hover table-white" id="education">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Institution</th>
                        <th>Subject</th>
                        <th>Starting Date</th>
                        <th>Complete Date</th>
                        <th>Degree</th>
                        <th>Grade</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <input type="text" name="institution" class="form-control">
                        </td>
                        <td>
                            <input class="form-control" name="subject" type="text">
                        </td>
                        <td>
                            <input name="startingdate" class="form-control datetimepicker" type="text">
                        </td>
                        <td>
                            <input name="completedate" class="form-control datetimepicker" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="degree" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="grade" type="text">
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="text-success font-18" title="Add" onclick="addedu(this)"><i class="fa fa-plus"></i></a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="text-danger font-18 disabled-link" title="Remove"><i class="fa fa-trash-o"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

										<div class="row">
    <div class="col-md-12 col-sm-12">
        <h3>Work Experience</h3>
        <div class="table-responsive">
            <table class="table table-hover table-white" id="work">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Company Name</th>
                        <th>Location</th>
                        <th>Job Position</th>
                        <th>Period From</th>
                        <th>Period To</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <input type="text" name="companyname" class="form-control">
                        </td>
                        <td>
                            <input class="form-control" name="location" type="text">
                        </td>
                        <td>
                            <input class="form-control" name="jobposition" type="text">
                        </td>
                        <td>
                            <input class="form-control datetimepicker" name="periodfrom" type="text">
                        </td>
                        <td>
                            <input class="form-control datetimepicker" name="periodto" type="text">
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="text-success font-18" title="Add" onclick="addwork(this)"><i class="fa fa-plus"></i></a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="text-danger font-18 disabled-link" title="Remove"><i class="fa fa-trash-o"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="submit-section">
   <!--  <button class="btn btn-primary submit-btn m-r-10">Save &amp; Send</button> -->
    <button class="btn btn-primary submit-btn m-r-10">Save</button>
</div>
</form>
</div>
<!-- /Page Wrapper -->
</div>
<!-- /Main Wrapper -->
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
		
		<!-- Tagsinput JS -->
		<script src="plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

		<!-- Custom JS -->
		<script src="js/app.js"></script>
		<!-- HTML -->
		
		<!-- personal -->
		
 <script>
var rowCount = 1;

function addItem(button) {
    var table = document.getElementById("personal").getElementsByTagName('tbody')[0];
    
    var newRow = table.insertRow(-1);
    
    var cell1 = newRow.insertCell(0);
    cell1.innerHTML = rowCount + 1;
    
    var cell2 = newRow.insertCell(1);
    var itemsInput = document.createElement("input");
    itemsInput.name = "passportno";
    itemsInput.className = "form-control";
    itemsInput.type = "text";
    cell2.appendChild(itemsInput);
    
    var cell3 = newRow.insertCell(2);
    var descriptionInput = document.createElement("input");
    descriptionInput.name = "passportexpirydate";
    descriptionInput.className = "form-control datetimepicker";
    descriptionInput.type = "text";
    cell3.appendChild(descriptionInput);
    
    var cell4 = newRow.insertCell(3);
    var unitCostInput = document.createElement("input");
    unitCostInput.name = "tel";
    unitCostInput.className = "form-control";
    unitCostInput.type = "text";
    cell4.appendChild(unitCostInput);
    
    var cell5 = newRow.insertCell(4);
    var qtyInput = document.createElement("input");
    qtyInput.name = "nation";
    qtyInput.className = "form-control";
    qtyInput.type = "text";
    cell5.appendChild(qtyInput);
    
    var cell6 = newRow.insertCell(5);
    var amountInput = document.createElement("input");
    amountInput.name = "religion";
    amountInput.className = "form-control";
    amountInput.type = "text";
    cell6.appendChild(amountInput);
    
    var cell7 = newRow.insertCell(6);
    var statusInput = document.createElement("select");
    statusInput.name = "status";
    statusInput.className = "select form-control";
    var option1 = document.createElement("option");
    option1.text = "Single";
    var option2 = document.createElement("option");
    option2.text = "Married";
    statusInput.add(option1);
    statusInput.add(option2);
    cell7.appendChild(statusInput);
    
    var cell8 = newRow.insertCell(7);
    var empspouseInput = document.createElement("input");
    empspouseInput.name = "empspouse";
    empspouseInput.className = "form-control";
    empspouseInput.type = "text";
    cell8.appendChild(empspouseInput);
    
    var cell9 = newRow.insertCell(8);
    var childrenInput = document.createElement("input");
    childrenInput.name = "children";
    childrenInput.className = "form-control";
    childrenInput.type = "text";
    cell9.appendChild(childrenInput);
    
    var cell10 = newRow.insertCell(9);
    var addLink = document.createElement("a");
    addLink.href = "javascript:void(0)";
    addLink.className = "text-success font-18";
    addLink.title = "Add";
    addLink.innerHTML = '<i class="fa fa-plus"></i>';
    addLink.onclick = addItem;
    cell10.appendChild(addLink);

    var cell11 = newRow.insertCell(10);
    var removeLink = document.createElement("a");
    removeLink.href = "javascript:void(0)";
    removeLink.className = "text-danger font-18";
    removeLink.title = "Remove";
    removeLink.innerHTML = '<i class="fa fa-trash-o"></i>';
    removeLink.onclick = function() {
        removepe(this); // Pass the reference to the clicked link as a parameter
    };
    cell11.appendChild(removeLink);

    rowCount++;

    // Adjust the table overflow if needed
    if (rowCount >= 5) {
        document.getElementById("personal").style.overflowY = "scroll";
    }
}



function updateSerialNumbers() {
    var table = document.getElementById("personal");
    var rows = table.getElementsByTagName("tr");

    for (var i = 0; i < rows.length; i++) {
        rows[i+1].cells[0].textContent = i +1; // Update serial numbers
    }
}

function removepe(button) {
   
    var row = button.parentNode.parentNode; // Traverse up the DOM hierarchy to reach the table row
    if (row && row.parentNode && row.parentNode.tagName.toLowerCase() === 'tbody') {
        var table = document.getElementById("personal");
        var rowIndex = row.rowIndex;

        table.deleteRow(rowIndex); // Remove the specific row
        rowCount--; // Decrement the row count

        updateSerialNumbers(); // Update serial numbers after deletion

        if (rowCount < 5) {
            document.getElementById("personal").style.overflowY = "auto";
        }
    }
}


	</script>
	
	<!-- emergancy -->
	
		<script>
var rowCount = 1; // Initialize the row count to 0

function addrow(button) {
    var table = document.getElementById("emergancy").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(-1); // Insert a new row at the end of the table

    var cell1 = newRow.insertCell(0);
    cell1.innerHTML = rowCount + 1; // Auto-increment item number

    var cell2 = newRow.insertCell(1);
    var nameInput = document.createElement("input");
    nameInput.name = "name";
    nameInput.className = "form-control";
    nameInput.type = "text";
    nameInput.style.minWidth = "150px";
    cell2.appendChild(nameInput);

    var cell3 = newRow.insertCell(2);
    var relationshipInput = document.createElement("input");
    relationshipInput.name = "relationship";
    relationshipInput.className = "form-control datetimepicker";
    relationshipInput.type = "text";
    relationshipInput.style.minWidth = "150px";
    cell3.appendChild(relationshipInput);

    var cell4 = newRow.insertCell(3);
    var phoneInput = document.createElement("input");
    phoneInput.name = "phone";
    phoneInput.className = "form-control";
    phoneInput.type = "text";
    
    cell4.appendChild(phoneInput);

    var cell5 = newRow.insertCell(4);
    var mobileInput = document.createElement("input");
    mobileInput.name = "mobile";
    mobileInput.className = "form-control";
    mobileInput.type = "text";
    cell5.appendChild(mobileInput);

    var cell6 = newRow.insertCell(5);
    var addLink = document.createElement("a");
    addLink.href = "javascript:void(0)";
    addLink.className = "text-success font-18";
    addLink.title = "Add";
    addLink.innerHTML = '<i class="fa fa-plus"></i>';
    addLink.onclick = addrow;
    cell6.appendChild(addLink);

    var cell7 = newRow.insertCell(6);
    var removeLink = document.createElement("a");
    removeLink.href = "javascript:void(0)";
    removeLink.className = "text-danger font-18";
    removeLink.title = "Remove";
    removeLink.innerHTML = '<i class="fa fa-trash-o"></i>';
    removeLink.onclick = function() {
								    removeem(this);
								    }
    cell7.appendChild(removeLink);
		
    rowCount++; // Increment the row count
  
    
    if (rowCount >= 5) {
        document.getElementById("emergancy").style.overflowY = "scroll";
    }
}



/* 
function updateSerialNumbers() {
    var table = document.getElementById("emergancy");
    var rows = table.getElementsByTagName("tr");
	
    for (var i = 0; i < rows.length; i++) {
        rows[i+1].cells[0].textContent = i +1; // Update serial numbers
    }
} */

function updateSerialNumbers() {
    var table = document.getElementById("emergancy");
    var rows = table.getElementsByTagName("tr");

    for (var i = 0; i < rows.length; i++) {
        rows[i].cells[0].textContent = i + 1; // Update serial numbers
    }
}


function removeem(button) {
    var row = button.parentNode.parentNode; // Get the row to be deleted
    var table = row.parentNode;

    while (table && table.tagName.toLowerCase() !== 'table') {
        table = table.parentNode; // Find the table containing the row
    }

    if (table) {
        var rowIndex = row.rowIndex; // Get the index of the row
        table.deleteRow(rowIndex); // Remove the row using its index
        updateSerialNumbers(); // Update serial numbers after deletion
        rowCount--; // Decrement the row count
        if (rowCount < 5) {
            table.style.overflowY = "auto";
        }
    }
}


</script>
<!-- bank -->

<script>
var bankRowCount = 1; // Initialize the row count to 1

function addBank(button) {
    var table = document.getElementById("bank").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(-1); // Insert a new row at the end of the table

    var cell1 = newRow.insertCell(0);
    cell1.innerHTML = bankRowCount + 1; // Auto-increment item number

    var cell2 = newRow.insertCell(1);
    var userNameInput = document.createElement("input");
    userNameInput.name = "username";
    userNameInput.className = "form-control";
    userNameInput.type = "text";
    cell2.appendChild(userNameInput);

    var cell3 = newRow.insertCell(2);
    var bankNameInput = document.createElement("input");
    bankNameInput.name = "bankname";
    bankNameInput.className = "form-control";
    bankNameInput.type = "text";
    cell3.appendChild(bankNameInput);

    var cell4 = newRow.insertCell(3);
    var bankAccountNoInput = document.createElement("input");
    bankAccountNoInput.name = "bankaccountno";
    bankAccountNoInput.className = "form-control";
    bankAccountNoInput.type = "text";
    cell4.appendChild(bankAccountNoInput);

    var cell5 = newRow.insertCell(4);
    var ifscCodeInput = document.createElement("input");
    ifscCodeInput.name = "ifsccode";
    ifscCodeInput.className = "form-control";
    ifscCodeInput.type = "text";
    cell5.appendChild(ifscCodeInput);

    var cell6 = newRow.insertCell(5);
    var panNoInput = document.createElement("input");
    panNoInput.name = "panno";
    panNoInput.className = "form-control";
    panNoInput.type = "text";
    cell6.appendChild(panNoInput);

    var cell7 = newRow.insertCell(6);
    var addLink = document.createElement("a");
    addLink.href = "javascript:void(0)";
    addLink.className = "text-success font-18";
    addLink.title = "Add";
    addLink.innerHTML = '<i class="fa fa-plus"></i>';
    addLink.onclick = addBank;
    cell7.appendChild(addLink);

    var cell8 = newRow.insertCell(7);
    var removeLink = document.createElement("a");
    removeLink.href = "javascript:void(0)";
    removeLink.className = "text-danger font-18";
    removeLink.title = "Remove";
    removeLink.innerHTML = '<i class="fa fa-trash-o"></i>';
    removeLink.onclick = function() {
						    removeBank(this);
						    }
    cell8.appendChild(removeLink);

    bankRowCount++; // Increment the row count

    if (bankRowCount >= 5) {
        document.getElementById("bank").style.overflowY = "scroll";
    }
}

/* function removeBank(button) {
    var table = document.getElementById("bank").getElementsByTagName('tbody')[0];
    table.deleteRow(-1); // Remove the last row
    bankRowCount--; // Decrement the row count

    if (bankRowCount < 5) {
        document.getElementById("bank").style.overflowY = "auto";
    }
} */


function updateSerialNumbers() {
    var table = document.getElementById("bank");
    var rows = table.getElementsByTagName("tr");

    for (var i = 0; i < rows.length; i++) {
        rows[i+1].cells[0].textContent = i +1; // Update serial numbers
    }
}

function removeBank(button) {
   
    var row = button.parentNode.parentNode; // Traverse up the DOM hierarchy to reach the table row
    if (row && row.parentNode && row.parentNode.tagName.toLowerCase() === 'tbody') {
        var table = document.getElementById("bank");
        var rowIndex = row.rowIndex;

        table.deleteRow(rowIndex); // Remove the specific row
        rowCount--; // Decrement the row count

        updateSerialNumbers(); // Update serial numbers after deletion

        if (rowCount < 5) {
            document.getElementById("bank").style.overflowY = "auto";
        }
    }
}
</script>

         <!-- family -->
<script>
var rowCount = 1; // Initialize the row count to 0

function addfam(button) {
    var table = document.getElementById("family").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(-1); // Insert a new row at the end of the table

    var cell1 = newRow.insertCell(0);
    cell1.innerHTML = rowCount + 1; // Auto-increment item number

    var cell2 = newRow.insertCell(1);
    var nameInput = document.createElement("input");
    nameInput.name = "name";
    nameInput.className = "form-control";
    nameInput.type = "text";
    cell2.appendChild(nameInput);

    var cell3 = newRow.insertCell(2);
    var relationshipInput = document.createElement("input");
    relationshipInput.name = "relationship";
    relationshipInput.className = "form-control";
    relationshipInput.type = "text";
    cell3.appendChild(relationshipInput);

    var cell4 = newRow.insertCell(3);
    var dobInput = document.createElement("input");
    dobInput.name = "dob";
    dobInput.className = "form-control";
    dobInput.type = "text";
    cell4.appendChild(dobInput);

    var cell5 = newRow.insertCell(4);
    var phoneInput = document.createElement("input");
    phoneInput.name = "phone";
    phoneInput.className = "form-control";
    phoneInput.type = "text";
    cell5.appendChild(phoneInput);

    var cell6 = newRow.insertCell(5);
    var addLink = document.createElement("a");
    addLink.href = "javascript:void(0)";
    addLink.className = "text-success font-18";
    addLink.title = "Add";
    addLink.innerHTML = '<i class="fa fa-plus"></i>';
    addLink.onclick = addfam;
    cell6.appendChild(addLink);

    var cell7 = newRow.insertCell(6);
    var removeLink = document.createElement("a");
    removeLink.href = "javascript:void(0)";
    removeLink.className = "text-danger font-18";
    removeLink.title = "Remove";
    removeLink.innerHTML = '<i class="fa fa-trash-o"></i>';
    removeLink.onclick = function() {
    						removefam(this);}
    cell7.appendChild(removeLink);

    rowCount++; // Increment the row count

    if (rowCount >= 5) {
        document.getElementById("family").style.overflowY = "scroll";
    }
}

/* function removefam(button) {
    var table = document.getElementById("family").getElementsByTagName('tbody')[0];
    table.deleteRow(-1); // Remove the last row
    rowCount--; // Decrement the row count

    if (rowCount < 5) {
        document.getElementById("family").style.overflowY = "auto";
    }
} */

function updateSerialNumbers() {
    var table = document.getElementById("family");
    var rows = table.getElementsByTagName("tr");

    for (var i = 0; i < rows.length; i++) {
        rows[i+1].cells[0].textContent = i +1; // Update serial numbers
    }
}

function removefam(button) {
   
    var row = button.parentNode.parentNode; // Traverse up the DOM hierarchy to reach the table row
    if (row && row.parentNode && row.parentNode.tagName.toLowerCase() === 'tbody') {
        var table = document.getElementById("family");
        var rowIndex = row.rowIndex;

        table.deleteRow(rowIndex); // Remove the specific row
        rowCount--; // Decrement the row count

        updateSerialNumbers(); // Update serial numbers after deletion

        if (rowCount < 5) {
            document.getElementById("family").style.overflowY = "auto";
        }
    }
}

</script>

          <!-- education -->
		
		<script>
var rowCount = 1; // Initialize the row count to 0

function addedu(button) {
    var table = document.getElementById("education").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(-1); // Insert a new row at the end of the table

    var cell1 = newRow.insertCell(0);
    cell1.innerHTML = rowCount + 1; // Auto-increment item number

    var cell2 = newRow.insertCell(1);
    var institutionInput = document.createElement("input");
    institutionInput.name = "instituion";
    institutionInput.className = "form-control";
    institutionInput.type = "text";
    cell2.appendChild(institutionInput);

    var cell3 = newRow.insertCell(2);
    var subjectInput = document.createElement("input");
    subjectInput.name = "subject";
    subjectInput.className = "form-control";
    subjectInput.type = "text";
    cell3.appendChild(subjectInput);

    var cell4 = newRow.insertCell(3);
    var startingDateInput = document.createElement("input");
    startingDateInput.name = "startingdate";
    startingDateInput.className = "form-control";
    startingDateInput.type = "text";
    cell4.appendChild(startingDateInput);

    var cell5 = newRow.insertCell(4);
    var completeDateInput = document.createElement("input");
    completeDateInput.name = "completedate";
    completeDateInput.className = "form-control";
    completeDateInput.type = "text";
    cell5.appendChild(completeDateInput);

    var cell6 = newRow.insertCell(5);
    var degreeInput = document.createElement("input");
    degreeInput.name = "degree";
    degreeInput.className = "form-control";
    degreeInput.type = "text";
    cell6.appendChild(degreeInput);

    var cell7 = newRow.insertCell(6);
    var gradeInput = document.createElement("input");
    gradeInput.name = "grade";
    gradeInput.className = "form-control";
    gradeInput.type = "text";
    cell7.appendChild(gradeInput);

    var cell8 = newRow.insertCell(7);
    var addLink = document.createElement("a");
    addLink.href = "javascript:void(0)";
    addLink.className = "text-success font-18";
    addLink.title = "Add";
    addLink.innerHTML = '<i class="fa fa-plus"></i>';
    addLink.onclick = addedu;
    cell8.appendChild(addLink);

    var cell9 = newRow.insertCell(8);
    var removeLink = document.createElement("a");
    removeLink.href = "javascript:void(0)";
    removeLink.className = "text-danger font-18";
    removeLink.title = "Remove";
    removeLink.innerHTML = '<i class="fa fa-trash-o"></i>';
    removeLink.onclick = function() {
    removeedu(this);
    }
    cell9.appendChild(removeLink);

    rowCount++; // Increment the row count

    if (rowCount >= 5) {
        document.getElementById("education").style.overflowY = "scroll";
    }
}

/* function removeedu(button) {
    var table = document.getElementById("education").getElementsByTagName('tbody')[0];
    table.deleteRow(-1); // Remove the last row
    rowCount--; // Decrement the row count

    if (rowCount < 5) {
        document.getElementById("education").style.overflowY = "auto";
    }
} */

function updateSerialNumbers() {
    var table = document.getElementById("education");
    var rows = table.getElementsByTagName("tr");

    for (var i = 0; i < rows.length; i++) {
        rows[i+1].cells[0].textContent = i +1; // Update serial numbers
    }
}

function removeedu(button) {
   
    var row = button.parentNode.parentNode; // Traverse up the DOM hierarchy to reach the table row
    if (row && row.parentNode && row.parentNode.tagName.toLowerCase() === 'tbody') {
        var table = document.getElementById("education");
        var rowIndex = row.rowIndex;

        table.deleteRow(rowIndex); // Remove the specific row
        rowCount--; // Decrement the row count

        updateSerialNumbers(); // Update serial numbers after deletion

        if (rowCount < 5) {
            document.getElementById("education").style.overflowY = "auto";
        }
    }
}


</script>

   <!-- work -->
		
		<script>
var rowCount = 1; // Initialize the row count to 0

function addwork(button) {
    var table = document.getElementById("work").getElementsByTagName('tbody')[0];
    var newRow = table.insertRow(-1); // Insert a new row at the end of the table

    var cell1 = newRow.insertCell(0);
    cell1.innerHTML = rowCount + 1; // Auto-increment item number

    var cell2 = newRow.insertCell(1);
    var companyNameInput = document.createElement("input");
    companyNameInput.name = "companyname";
    companyNameInput.className = "form-control";
    companyNameInput.type = "text";
    cell2.appendChild(companyNameInput);

    var cell3 = newRow.insertCell(2);
    var locationInput = document.createElement("input");
    locationInput.name = "location";
    locationInput.className = "form-control datetimepicker";
    locationInput.type = "text";
    cell3.appendChild(locationInput);

    var cell4 = newRow.insertCell(3);
    var jobPositionInput = document.createElement("input");
    jobPositionInput.name = "jobposition";
    jobPositionInput.className = "form-control";
    jobPositionInput.type = "text";
    cell4.appendChild(jobPositionInput);

    var cell5 = newRow.insertCell(4);
    var periodFromInput = document.createElement("input");
    periodFromInput.name = "periodfrom";
    periodFromInput.className = "form-control";
    periodFromInput.type = "text";
    cell5.appendChild(periodFromInput);

    var cell6 = newRow.insertCell(5);
    var periodToInput = document.createElement("input");
    periodToInput.name = "periodto";
    periodToInput.className = "form-control";
    periodToInput.type = "text";
    cell6.appendChild(periodToInput);

    var cell7 = newRow.insertCell(6);
    var addLink = document.createElement("a");
    addLink.href = "javascript:void(0)";
    addLink.className = "text-success font-18";
    addLink.title = "Add";
    addLink.innerHTML = '<i class="fa fa-plus"></i>';
    addLink.onclick = addwork;
    cell7.appendChild(addLink);

    var cell8 = newRow.insertCell(7);
    var removeLink = document.createElement("a");
    removeLink.href = "javascript:void(0)";
    removeLink.className = "text-danger font-18";
    removeLink.title = "Remove";
    removeLink.innerHTML = '<i class="fa fa-trash-o"></i>';
    removeLink.onclick = function() {;
							    removework(this);
							    }
    cell8.appendChild(removeLink);

    rowCount++; // Increment the row count

    if (rowCount >= 5) {
        document.getElementById("work").style.overflowY = "scroll";
    }
}

/* function removework(button) {
    var table = document.getElementById("work").getElementsByTagName('tbody')[0];
    table.deleteRow(-1); // Remove the last row
    rowCount--; // Decrement the row count

    if (rowCount < 5) {
        document.getElementById("work").style.overflowY = "auto";
    }
} */


function updateSerialNumbers() {
    var table = document.getElementById("work");
    var rows = table.getElementsByTagName("tr");

    for (var i = 0; i < rows.length; i++) {
        rows[i+1].cells[0].textContent = i +1; // Update serial numbers
    }
}

function removework(button) {
   
    var row = button.parentNode.parentNode; // Traverse up the DOM hierarchy to reach the table row
    if (row && row.parentNode && row.parentNode.tagName.toLowerCase() === 'tbody') {
        var table = document.getElementById("work");
        var rowIndex = row.rowIndex;

        table.deleteRow(rowIndex); // Remove the specific row
        rowCount--; // Decrement the row count

        updateSerialNumbers(); // Update serial numbers after deletion

        if (rowCount < 5) {
            document.getElementById("work").style.overflowY = "auto";
        }
    }
}
</script>






</body>
</html>

		
		
		

    