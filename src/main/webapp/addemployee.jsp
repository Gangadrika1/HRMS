<%@page import="com.weblabs.service.impl.DesignationDAO"%>
<%@page import="com.weblabs.service.impl.DepartmentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.weblabs.service.impl.AddRolesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>	
<%@ page import="com.weblabs.beans.AddRolesBean" %>
<%@ page import="com.weblabs.beans.AddDepartment" %>
<%@ page import="com.weblabs.beans.AddDesignation" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    

   <script type="module" src="js/validateForm.js"></script>


</head>
<body>
 <form action="./AddEmployeeSrv" method="post"  onsubmit="return validateForm()">
    <div id="addemployee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Employee</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                    <!-- <input name="firstname" required class="form-control" type="text"> -->
                                    <input name="firstname" id="firstname" required class="form-control" type="text" oninput="validateName(this.value, 'firstnameError')">
                                   <span id="firstnameError" style="display: none; color: red;"></span>
                              
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Last Name</label>
                                    <input name="lastname" id="lastname" required class="form-control" type="text" oninput="validateName(this.value, 'lastnameError')">
                                   <span id="lastnameError" style="display: none; color: red;"></span>
                                  </div>
                                  </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Joining_Date</label>
                                 <!--     <input type="date" id="start" name="Joining_Date"  value="YYYY-MM-DD" min="YYYY-MM-DD" max="YYYY-MM-DD" onchange="formatDate()">   -->
                                 
                                 <input name="Joining_Date" id="Joining_Date" required class="form-control" type="date" oninput="checkJoiningDate(this.value, 'Joining_DateError')">
                              <span id="Joining_DateError" style="display: none; color: red;"></span>
         
                                </div>
                            </div>
                             <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Gender</label>
                                    <input name="Gender" required class="form-control" type="text">
                                </div>
                            </div>
                             <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Location</label>
                                    <input name="Location" required class="form-control" type="text">
                                </div>
                            </div>
                             <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">PAN</label>
                                    <input name="PAN" required class="form-control" type="text">
                                </div>
                            </div>
                             <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">PF</label>
                                    <input name="PF" required class="form-control" type="text">
                                </div>
                            </div>
                             <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Pf_No</label>
                                    <input name="Pf_No" required class="form-control" type="text">
                                </div>
                            </div>
                             <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">UAN</label>
                                    <input name="UAN" required class="form-control" type="text">
                                </div>
                            </div>
                             <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">VPF</label>
                                    <input name="VPF" required class="form-control" type="text">
                                </div>
                            </div>
                             <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">ESI</label>
                                    <input name="ESI" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Username <span class="text-danger">*</span></label>
                                    <input name="username" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                    <!-- <input name="email" required class="form-control" type="email"> -->
                                    
                                    <input name="email" id="email" required class="form-control" type="text" oninput="validateEmail(this.value, 'emailError')">
                                   <span id="emailError" style="display: none; color: red;"></span>
                                </div>
                            </div>
                           <div class="form-group">
                                 <label class="col-form-label">Password</label>
                                  <input class="form-control" required name="password" id="password" type="password">
                            </div>
                      <!-- <!--    </div> -->
                     <div class="col-sm-6">
                       <div class="form-group">
                         <label class="col-form-label">Confirm Password</label>
                        <input class="form-control" required name="confirm_pass" id="confirm_pass" type="password">
                         </div>
                      </div>
                        <span id="passwordError" style="color: red;"></span>
<script>
    // Add an event listener to check password match when the confirm password field changes
    document.getElementById("confirm_pass").addEventListener("input", function () {
        validatePasswordMatch();
    });

    // Function to validate password and confirm password match
    function validatePasswordMatch() {
        var password = document.getElementById("password").value;
        var confirmPass = document.getElementById("confirm_pass").value;
        var errorSpan = document.getElementById("passwordError");

        if (password !== confirmPass) {
            errorSpan.textContent = "Passwords do not match";
        } else {
            errorSpan.textContent = "";
        }
    }
</script>



                         <div class="col-sm-6">  
                                <div class="form-group">
                                    <label class="col-form-label">Employee ID <span class="text-danger">*</span></label>
                                    <input name="employee_id" readonly type="text" value="<%= "EMP-" + java.util.UUID.randomUUID().toString().substring(0, 6) %>" class="form-control">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Phone</label>
                                    
                                    <input name="phone" id="phone" required class="form-control" type="text" oninput="validateContactNumber(this.value, 'phoneError')">
                                   <span id="phoneError" style="display: none; color: red;"></span>
                                 
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Department <span class="text-danger">*</span></label>
                                    <select required name="department" class="select">
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
                                    <select required name="designation" class="select">
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
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-form-label">Employee Picture</label>
                                    <input class="form-control" required name="picture" type="file">
                                </div>
                            </div>
                        </div>
                        <div class="submit-section">
                            <button type="submit" name="add_employee" class="btn btn-primary submit-btn">Submit</button>
                        </div>
             
                </div>
            </div>
        </div>
   </div>
    </form>
    
    
    
    <!-- <script>
    function validateForm() {
        var isValid = true;

        // Perform validation for each field
        if (!validateName(document.getElementById('lastname').value, 'lastnameError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
         if (!validateName(document.getElementById('firstname').value, 'firstnameError')) {
            isValid = false;
        }
        
         if (!validateContactNumber(document.getElementById('phone').value, 'phoneError')) {
             isValid = false;
         }

         if (!validateEmail(document.getElementById('email').value, 'emailError')) {
             isValid = false;
         }
         

         if (!checkJoiningDate(document.getElementById('JoiningDate').value, 'JoiningDateError')) {
        	
             isValid = false;
         }

        return isValid;
    }
</script> -->


<script>
    function validateForm(event) {
        event.preventDefault(); // Prevent form submission by default

        var isValid = true;

        // Perform validation for each field
        if (!validateName(document.getElementById('lastname').value, 'lastnameError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
        if (!validateName(document.getElementById('firstname').value, 'firstnameError')) {
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

        // Redirect to employee.jsp
             <%response.sendRedirect("employee.jsp"); %>
   
  
</body>
</html>