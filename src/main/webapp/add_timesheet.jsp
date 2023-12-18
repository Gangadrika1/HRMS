<%@page import="com.weblabs.service.impl.EmployeeDAO"%>
<%@page import="com.weblabs.beans.EmployeeBean"%>

<%@page import="com.weblabs.service.impl.ProjectDAO"%>
<%@page import="com.weblabs.beans.CreateProject"%>

<%@page import="com.weblabs.service.impl.taskDAO"%>
<%@page import="com.weblabs.beans.TasksBean"%>

<%@ page import="java.util.List" %>
<form action="./AddTimeSheetSrv" method="post">
<div id="add_timesheet" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Today Work details</h5>
							
							</div>
							<div class="modal-body">
								
								
									<div class="row">
										<div class="form-group col-sm-6">
											<!-- <label>Employee_Id <span class="text-danger">*</span></label> -->
											<label>EmployeeId <span class="text-danger">*</span></label>
<select name="Employee_Id" id="Employee_Id" class="form-control" required onchange="getEmployeeDetails()">
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
            <option  value="<%= employee.getEmployee_ID() %>"><%= employee.getEmployee_ID() %></option>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace(); // Print the exception trace for debugging
            }
            %>
        </select>
    </div>
</div>
											<!-- <input name="Employee_Id" required class="form-control"  type="text"> -->
										
									
									
									<div class="row">
										<div class="form-group">
										<label>DateWorked<span class="text-danger">*</span></label>
										<!-- <input class="form-control" name="DateWorked" required  type="text"> -->
										<input class="form-control" name="DateWorked" required type="date">
									</div>
										<div class="form-group col-sm-4">
											<!-- <label>project_id  <span class="text-danger">*</span></label>
											<input name="project_id" required  class="form-control" type="text" > -->
											
											
<label>project_id <span class="text-danger">*</span></label>
<select name="project_id" id="project_id" class="form-control" required onchange="getAllProjects">
  
            <option value="">Select projectId</option>
            <% 
            try {
                // Call the method to get all employee data
               List<CreateProject> allProjects = ProjectDAO.getAllProjects();
                
                // Loop through the list and generate <option> elements
                for (CreateProject employee : allProjects) {
            %>
            <option  value="<%= employee.getProject_id() %>"><%= employee.getProject_id() %></option>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace(); // Print the exception trace for debugging
            }
            %>
        </select>
											
											
											
										</div>
										<div class="form-group col-sm-4">
											<!-- <label>task_id <span class="text-danger">*</span></label>
											<input name="task_id" required class="form-control" type="text" > -->
											
											
											
<label>task_id <span class="text-danger">*</span></label>
<select name="task_id" id="task_id" class="form-control" required onchange="getAllProjects">
  
            <option value="">Select taskId</option>
            <% 
            try {
                // Call the method to get all employee data
               List<TasksBean> allProjects = taskDAO.getAllTasks();
                
                // Loop through the list and generate <option> elements
                for (TasksBean employee : allProjects) {
            %>
            <option  value="<%= employee.getTask_id() %>"><%= employee.getTask_id() %></option>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace(); // Print the exception trace for debugging
            }
            %>
        </select>
																	
											
											
										</div>
									</div>
									<!-- <div class="row">
										 <div class="form-group">
										    <label for="starting_at">HoursWorked <span class="text-danger">*</span></label>
										   <input id="starting_at" name="HoursWorked" class="form-control" type="text">
										</div> -->
										

    <div class="row">
        <div class="form-group">
            <label>HoursWorked <span class="text-danger">*</span></label>
            <input id="HoursWorked" name="HoursWorked" required class="form-control" type="number" >
       </div>
    <script>
    document.getElementById("HoursWorked").addEventListener("input", function () {
        var inputValue = parseFloat(this.value);
        if (isNaN(inputValue) || inputValue < 0) {
            this.value = "0"; // Set the input value to 0 if it's negative or invalid.
        } else if (inputValue > 8) {
            this.value = "8"; // Set the input value to 24 if it exceeds 24.
        }
    });
</script>
		                            <div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form>