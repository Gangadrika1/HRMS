<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="com.weblabs.service.impl.PayrollDAO" %>
<%@ page import="com.weblabs.beans.Payroll" %>
<%@ page import="java.util.List" %>
<form action="./AddPayrollServlet" method="post">
<div id="add_payroll" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add payroll Employee Assignee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
                   <div class="modal-body">
                    <!-- <div class="form-group">
                        <label for="payroll"> ID<span class="text-danger">*</span></label>
                        <input class="form-check-input" type="radio" name="id" id="addition_no_emp" value="option1" checked="">
                        
                    </div> -->
                    <div class="form-group">
                        <label for="payroll">EmployeeId<span class="text-danger">*</span></label>
                         <div class="form-group">
					    <label class="d-block">Assignee</label>
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="radio" name="addition_assignee" id="payroll_no_emp" value="option1" checked="">
					        <label class="form-check-label" for="payroll_no_emp">No assignee</label>
					    </div>
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="radio" name="addition_assignee" id="payroll_all_emp" value="option2">
					        <label class="form-check-label" for="payroll_all_emp">All employees</label>
					    </div>
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="radio" name="addition_assignee" id="payroll_single_emp" value="option3">
					        <label class="form-check-label" for="payroll_single_emp">Select Employee</label>
					    </div>
					
					    <div class="form-group">
					        <div class="custom-dropdown">
					            <div class="custom-dropdown-content grid-view" id="employeeSelectContent">
					                <div class="grid-container">
					                    <%
					                    // Call the method to get all employee data
					                    List<EmployeeBean> employees = EmployeeDAO.getAllEmployees();
					                    System.out.println("Number of employees: " + employees.size());
					
					                    // Loop through the list and generate checkboxes in a grid
					                    for (EmployeeBean employee : employees) {
					                    %>
					                    <div class="grid-item">
					                        <input type="checkbox" name="empid" value="<%= employee.getEmployee_ID() %>">
					                        <label><%= employee.getEmployee_ID()%></label>
					                    </div>
					                    <%
					                    }
					                    %>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
                    </div>
                   <!--  <div class="form-group">
                        <label for="payroll">Name<span class="text-danger">*</span></label>
                         <input name="name" required  class="form-control" type="text"> 
                    </div> -->
                    
                    <div class="form-group">
                        <label for="payroll">Year<span class="text-danger">*</span></label>
                         <input name="year" required  class="form-control" type="text"> 
                    </div>
                    <div class="form-group">
                        <label for="payroll">Month<span class="text-danger">*</span></label>
                         <input name="month" required  class="form-control" type="text"> 
                    </div>
                    <div class="form-group">
                        <label for="payroll">Is_opened<span class="text-danger">*</span></label>
                         <input placeholder="if it is open give ZERO" name="isopen" required  class="form-control" type="text"> 
                    </div>
                    <div class="form-group">
                        <label for="payroll">Ranby<span class="text-danger">*</span></label>
                         <input name="ranby" required  class="form-control" type="text"> 
                    </div>
                    <div class="form-group">
                        <label for="payroll">last_modified_time<span class="text-danger">*</span></label>
                         <input name="lasttime" required  class="form-control" type="date"> 
                    </div>
                    
                    
                    <div class="submit-section">
                        <button type="submit" name="add_payroll" class="btn btn-primary submit-btn">Submit</button>
                    </div>
            </div>
        </div>
    </div>
</div>
</form>
<script>
document.addEventListener("DOMContentLoaded", function () {
    // JavaScript to handle checking all employee checkboxes when "All employees" is selected
    const allEmployeesRadio = document.getElementById("payroll_all_emp");
    const allEmployeesCheckboxes = document.querySelectorAll("input[name='empid']");

    allEmployeesRadio.addEventListener("change", function () {
        allEmployeesCheckboxes.forEach(checkbox => {
            checkbox.checked = allEmployeesRadio.checked;
        });
    });

    // JavaScript to handle unchecking all employee checkboxes when "No assignee" is selected
    const noAssigneeRadio = document.getElementById("payroll_no_emp");
    noAssigneeRadio.addEventListener("change", function () {
        allEmployeesCheckboxes.forEach(checkbox => {
            checkbox.checked = false;
        });
    });

    // JavaScript to clear selections when "Select Employee" is chosen and allow selections when "Select Employee" is chosen
    const singleEmployeeRadio = document.getElementById("payroll_single_emp");
    const selectEmployeeCheckboxes = document.querySelectorAll("input[name='empid']");

    singleEmployeeRadio.addEventListener("change", function () {
        const isChecked = singleEmployeeRadio.checked;
        selectEmployeeCheckboxes.forEach(checkbox => {
            checkbox.disabled = !isChecked;
            checkbox.checked = false; // Uncheck all checkboxes when "Select Employee" is chosen
        });
    });
});
</script>