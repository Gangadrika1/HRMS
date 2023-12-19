<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.beans.CreateProject" %>
<%@ page import="java.util.List" %>

<script>
    function validateDates() {
        var startDateStr = document.getElementsByName("start_date")[0].value;
        var endDateStr = document.getElementsByName("end_date")[0].value;

        var startDate = new Date(startDateStr);
        var endDate = new Date(endDateStr);

        if (startDate > endDate) {
            alert("End date must be after the start date.");
            return false;
        }

        return true;
    }
</script>
<form action="./AddTasksSrv" method="post" onsubmit="return validateDates();">
<div id="add_tasks" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Tasks</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
               
                    <div class="row">
                    
                    
                    
                         <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Project Name <span class="text-danger">*</span></label>
                                <select style=" width:250px;" name="project_id" required class="abc" required>
                                   <option value="" selected>Select Project Name</option> <!-- Default option with a specific name -->
                                <%
			
											        List<CreateProject> employees = ProjectDAO.getAllProjects();
											        
											        for (CreateProject employee : employees) {
											    %>
											     
											      
											       <option value="<%= employee.getProject_id() %>"> <%= employee.getProjectname() %></option> 
											    <%
											        }
											        
											 
											%>
											

										    </select>
                            </div>
                        </div> 
                         <script>
    $(document).ready(function() {
        $('.abc').select2();
    });
</script>  
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">description</label>
                                <input name="description" required class="form-control" type="text">
                            </div>
                        </div>
                        
                        
                        
                        <div class="col-md-6">
                         <div class="form-group">
                              <label for="start_date">start_date <span class="text-danger">*</span></label>
                              <input id="start_date" name="start_date" class="form-control" type="date">
                          </div>
                           </div>
                          
                          
                            <div class="col-sm-6 ">
                        <div class="form-group">
                           <label for="end_date">end_date <span class="text-danger">*</span></label>
                           <input id="end_date" name="end_date" class="form-control" type="date">
                       </div>
                        </div>
                        
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">assigned_resource <span class="text-danger">*</span></label>
                                <input name="assigned_resource" required class="form-control" type="text">
                            </div>
                       </div>
                       
                       
                        <div class="col-sm-6 ">
                                    <div class="form-group">
                                        <label>is_completed<span class="text-danger">*</span></label>
                                        <select class="select" name="is_completed" required >
                                            <option>Approved</option>
                                            <option>Pending</option>
                                           
                                        </select>
                                    </div>
                                </div>
                                
                         </div>
                                 
                    <div class="submit-section">
                        <button type="submit" name="add_tasks" class="btn btn-primary submit-btn">Submit</button>
                    </div>
           
        </div>
    </div>
</div>
</div>
</form>