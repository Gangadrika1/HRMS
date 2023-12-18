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
    <title>Payroll Deduction - HRMS admin template</title>
    
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
<form action="./AddDeductionServlet" method="post">
    <div id="add_deduction" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                     <h5 class="modal-title">Add Deduction</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="form-group">
                    <label>PayrollId <span class="text-danger">*</span></label>
                    <input name="payrollid" required class="form-control" type="text">
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name <span class="text-danger">*</span></label>
                        <input name="name" required class="form-control" type="text">
                    </div>
					
					
					<div class="form-group">
                        <label>Unit Amount</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">$</span>
                            </div>
                            <input type="text" class="form-control" name="unitamount" required>
                            <div class="input-group-append">
                                <span class="input-group-text">.00</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="d-block">Assignee</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="deduction_assignee" id="deduction_no_emp" value="option1" checked>
                            <label class="form-check-label" for="deduction_no_emp">No assignee</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="deduction_assignee" id="deduction_all_emp" value="option2">
                            <label class="form-check-label" for="deduction_all_emp">All employees</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="deduction_assignee" id="deduction_single_emp" value="option3">
                            <label class="form-check-label" for="deduction_single_emp">Select Employee</label>
                        </div>
                        <div class="form-group">
                            <div class="custom-dropdown">
                                <div class="custom-dropdown-content grid-view" id="employeeSelectContent">
                                    <div class="grid-container">
                                        <%
                                        // Call the method to get all employee data
                                        List<EmployeeBean> employees = EmployeeDAO.getAllEmployees();
                                        // System.println("Number of employees: " + employees.size());
                                        // Loop through the list and generate checkboxes in a grid
                                        for (EmployeeBean employee : employees) {
                                        %>
                                        <div class="grid-item">
                                            <input type="checkbox" name="selectedEmployees" value="<%= employee.getEmployee_ID() %>">
                                            <label><%= employee.getEmail() %></label>
                                        </div>
                                        <%
                                        }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <button class="btn btn-primary submit-btn">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </form>  
  
  <script>
    // JavaScript to handle checking all employee checkboxes when "All employees" is selected
    document.getElementById("deduction_all_emp").addEventListener("change", function() {
        if (this.checked) {
            const checkboxes = document.querySelectorAll("input[name='selectedEmployees']");
            checkboxes.forEach(checkbox => {
                checkbox.checked = true;
            });
        }
    });

    // JavaScript to handle checking or unchecking all employee checkboxes when "No assignee" is selected
    document.getElementById("deduction_no_emp").addEventListener("change", function() {
        if (this.checked) {
            const checkboxes = document.querySelectorAll("input[name='selectedEmployees']");
            checkboxes.forEach(checkbox => {
                checkbox.checked = false;
            });
        }
    });

    
 // JavaScript to clear selections when "Select Employee" is chosen and allow selections when "Select Employee" is chosen
    const DeductionEmployeeRadio = document.getElementById("deduction_single_emp");
    const checkboxes = document.querySelectorAll("input[name='selectedEmployees']");

    DeductionEmployeeRadio.addEventListener("change", toggleCheckboxes);

    function toggleCheckboxes() {
        const isChecked = DeductionEmployeeRadio.checked;
        checkboxes.forEach(checkbox => {
            checkbox.disabled = !isChecked;
            checkbox.checked = false; // Uncheck all checkboxes when "Select Employee" is chosen
        });
    }
    
    
    // JavaScript to read the selected employees
    const selectedEmployeesButton = document.getElementById("readSelectedEmployeesButton");

    selectedEmployeesButton.addEventListener("click", function() {
        const selectedEmployeeIDs = [];
        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                selectedEmployeeIDs.push(checkbox.value);
            }
        });

        // Do something with the selected employee IDs
        alert("Selected Employee IDs: " + selectedEmployeeIDs.join(", "));
    });
</script>

        				</body>
				</html>
