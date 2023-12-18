<%@page import="com.weblabs.service.impl.DepartmentDAO"%>
<%@ page import="com.weblabs.beans.AddDepartment" %>
<%@ page import="java.util.List" %>
<form action="./AddDesignationSrv" method="post">
<div id="add_designation" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Designation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    
                        <div class="form-group">
                            <label>Designation Name <span class="text-danger">*</span></label>
                            <!-- <input name="designation" required class="form-control" type="text"> -->
                            <input name="designation" id="designation" required class="form-control" type="text" oninput="validateName(this.value, 'designationError')">
                                   <span id="designationError" style="display: none; color: red;"></span>
                              
                        </div>
                        <div class="form-group">
                            <label>Department Name<span class="text-danger">*</span></label>
                            <select required name="department" class="select">
                           <%
											List<AddDepartment> dept = DepartmentDAO.getAllDepartmenet();
											for(AddDepartment dep: dept)
											{
											%>
                                           <option  value="<%= dep.getId()%>"> <%= dep.getDepartmentName() %></option>
                                        <%
                          					}
									     %>
                         </select>
                         
                         
                        </div>
                        <div class="submit-section">
                            <button name="add_designation" type="submit" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                   
                </div>
            </div>
        </div>
    </div>
     </form>
     
     <script  src="js/validateForm.js"></script>
<script>
    function validateForm(event) {
        event.preventDefault(); // Prevent form submission by default

        var isValid = true;

        // Perform validation for each field
        if (!validateName(document.getElementById('designation').value, 'designationError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
       

        // If the form is not valid, display errors and prevent form submission
        if (!isValid) {
            // Display errors or perform any other necessary actions
            return false; // Prevent form submission
        }

        // If the form is valid, you can submit the form
        return true;
    }
</script>
     <%   response.sendRedirect("designations.jsp"); %>