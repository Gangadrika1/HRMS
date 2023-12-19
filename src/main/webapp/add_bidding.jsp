<%@page import="com.weblabs.service.impl.AddClientsDAO"%>
<%@ page import="com.weblabs.beans.AddClient" %>
<%@page import="com.weblabs.service.impl.ProjectDAO"%>
<%@ page import="com.weblabs.beans.CreateProject" %>

<%@ page import="java.util.List" %>
<form action="./AddBiddindSrv" method="post">
<div id="add_bidding" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Bidding</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    
                        <!-- <div class="form-group">
                            <label>Designation Name <span class="text-danger">*</span></label>
                            <input name="designation" required class="form-control" type="text">
                        </div> -->
                        <div class="form-group">
                            <label>Client Name <span class="text-danger">*</span></label>
                            <select style=" width:250px;"  required name="Clientid" class="abc"  required onchange="getAllClient">
  
                           <option value="">Select an employee</option>
            <% 
            try {
                // Call the method to get all employee data
               List<AddClient> allProjects = AddClientsDAO.getAllClient();
                
                // Loop through the list and generate <option> elements
                for (AddClient employee : allProjects) {
            %>
            <option  value="<%= employee.getClientID()%>"><%= employee.getUsername() %></option>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace(); // Print the exception trace for debugging
            }
            %>
        </select>
                        </div>
                        
             <script>
    $(document).ready(function() {
        $('.abc').select2();
    });
</script>              
                        
                        
     <script>
    function handleIsFixedChange() {
      var isFixedSelect = document.getElementsByName("is_fixed")[0];
      var hourlyInput = document.getElementsByName("hourly")[0];

      // Check if the selected value is "yes" and disable/enable the hourly input accordingly
      if (isFixedSelect.value === "yes") {
        hourlyInput.disabled = true;
      } else {
        hourlyInput.disabled = false;
      }
    }
  </script>
  
  
   <div class="form-group">
      <label>Is Fixed <span class="text-danger">*</span></label>
      <select name="is_fixed" required class="form-control" onchange="handleIsFixedChange()">
      <option value="no">No</option>
        <option value="yes">Yes</option>
        <!-- <option value="no">No</option> -->
      </select>
    </div>

    <div class="form-group">
      <label>Hourly <span class="text-danger">*</span></label>
      <input name="hourly" required class="form-control" type="text">
    </div>
    
                      <!-- 
                         <div class="form-group">
    <label>Is Fixed <span class="text-danger">*</span></label>
    <select name="is_fixed" required class="form-control">
        <option value="yes">Yes</option>
        <option value="no">No</option>
    </select>
</div>

                         <div class="form-group">
                            <label>hourly <span class="text-danger">*</span></label>
                            <input name="hourly" required class="form-control" type="text">
                        </div> -->
                         <div class="form-group">
                            <label>pricing  <span class="text-danger">*</span></label>
                            <input name="pricing" required class="form-control" type="text">
                        </div>
                        
                       <!--  <div class="form-group">
                            <label>project_id  <span class="text-danger">*</span></label>
                            <input name="project_id" required class="form-control" type="text">
                        </div> -->
                        
                        
                      <div class="form-group">
                                <label class="col-form-label">Project Name <span class="text-danger">*</span></label>
                                <select style=" width:250px;" name="project_id" required class="xyz" required>
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
                         <script>
    $(document).ready(function() {
        $('.xyz').select2();
    });
</script>  
                        
                        
                 <div class="form-group">
    <label>Is approved <span class="text-danger">*</span></label>
    <select name="is_approved" required class="form-control">
        <option value="yes">Yes</option>
        <option value="no">No</option>
    </select>
</div>
             
                        
                        <div class="submit-section">
                            <button name="add_bidding" type="submit" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                   
                </div>
            </div>
        </div>
    </div>
     </form>
     <%   response.sendRedirect("bidding.jsp"); %>