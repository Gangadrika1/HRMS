<%@page import="com.weblabs.service.impl.AddClientsDAO"%>
<%@ page import="com.weblabs.beans.AddClient" %>
<%@page import="com.weblabs.service.impl.ProjectDAO"%>
<%@ page import="com.weblabs.beans.CreateProject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.biddingDAO" %>
<%@ page import="com.weblabs.beans.biddingBean" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
    <!-- Add your CSS and JavaScript includes here -->
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

   <!-- Fontawesome CSS -->
     <link rel="stylesheet" href="css/font-awesome.min.css">

 <!--    Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

 <!--    Select2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">

 <!--    Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

 <!--    Main CSS -->
    <link rel="stylesheet" href="css/style.css">
 <!--    table styles CSS -->
    <link rel="stylesheet" href="css/tstyles.css">

   
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("id"); // Make sure the parameter name matches your form
    List<biddingBean> designations = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "Id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        designations = biddingDAO.getFilteredAddBidding(whereClause, start, limit);
    }

    if (designations != null && !designations.isEmpty()) {
    	biddingBean designation = designations.get(0); // Access the first element
        if (designations != null) {
%>

   
   <div class="main-wrapper">

    <!-- Header -->
    <!-- Include your header HTML here -->
    <jsp:include page="header.jsp" />

    <!-- Sidebar -->
    <!-- Include your sidebar HTML here -->
    <jsp:include page="sidebar.jsp" />

    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <!-- Page Content -->
        <div class="content container-fluid">

            <!-- Page Header -->
            
            <div class="page-header">
<form action="./EditBiddingSrv" method="post">
<div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
    <label class="col-form-label">Bidding ID <span class="text-danger">*</span></label>
    <input name="id" value="<%= designation.getId() %>" required class="form-control" type="text" readonly>
</div>

<%-- <div class="form-group">
    <label class="col-form-label">Client ID <span class="text-danger">*</span></label>
    <input name="Clientid" value="<%= designation.getClientid() %>" required class="form-control" type="text">
</div> --%>


<div class="form-group">
                          <label style="margin-top: 40px;" class="col-form-label">Client Name <span class="text-danger">*</span></label>
                                <select class="abc2" style=" width:270px;" name="Clientid" required class="form-control" required>
                          
            <% 
                String selectedClientId1 = designation.getProject_id();
                // Call the method to get all employee data
               List<AddClient> allProjects = AddClientsDAO.getAllClient();
                
                // Loop through the list and generate <option> elements
                for (AddClient employee : allProjects) {
            %>
             <option  value="<%=employee.getUsername()%>" <%= (selectedClientId1 != null && selectedClientId1.equals(employee.getClientID())) ? "selected" : "" %>><%= employee.getUsername() %></option>
            <%
                }
           
            %>
        </select>
                        </div>
                           <script>
    $(document).ready(function() {
        $('.abc2').select2();
    });
</script>  
<%-- <div class="form-group">
    <label class="col-form-label">Is Fixed <span class="text-danger">*</span></label>
    <input name="is_fixed" value="<%= designation.getIs_fixed()%>" required class="form-control" type="text">
</div>
 --%>
 
 <div class="form-group">
    <label class="col-form-label">Is Fixed <span class="text-danger">*</span></label>
    <select name="is_fixed" required class="form-control">
        <option value="yes" <%= designation.getIs_fixed().equals("yes") ? "selected" : "" %>>Yes</option>
        <option value="no" <%= designation.getIs_fixed().equals("no") ? "selected" : "" %>>No</option>
    </select>
</div>
 
<div class="form-group">
    <label class="col-form-label">Hourly <span class="text-danger">*</span></label>
    <input name="hourly" value="<%= designation.getHourly() %>" required class="form-control" type="text">
</div>

<div class="form-group">
    <label class="col-form-label">Pricing <span class="text-danger">*</span></label>
    <input name="pricing" value="<%= designation.getPricing()%>" required class="form-control" type="text">
</div>

 <div class="form-group">
                                <label style="margin-top: 40px;" class="col-form-label">Project Name <span class="text-danger">*</span></label>
                                <select class="abc2" style=" width:270px;" name="project_id" required class="form-control" required>
                                    <%
                                            String selectedClientId = designation.getProject_id();
                                            List<CreateProject> projects = ProjectDAO.getAllProjects();
                                            
                                            for (CreateProject project : projects) {
                                    %>
                                   <%--  <option value="<%= project.getProjectname() %>" <%= (project.getProject_id().equals(task.getProject_id())) ? "selected" : "" %>><%= project.getProjectname() %></option> --%>
                                    <option  value="<%= project.getProjectname()%>" <%= (selectedClientId != null && selectedClientId.equals(designation.getProject_id())) ? "selected" : "" %>><%= project.getProjectname() %></option>
                                    
                                    <%
                                            }
                                      
                                    %>
                                </select>
                           
                        </div> 
                       <script>
    $(document).ready(function() {
        $('.abc2').select2();
    });
</script>  
  
<div class="form-group">
    <label class="col-form-label">Is Fixed <span class="text-danger">*</span></label>
    <select name="is_approved" required class="form-control">
        <option value="yes" <%= designation.getIs_approved().equals("yes") ? "selected=\"selected\"" : "" %>>Yes</option>
        <option value="no" <%= designation.getIs_approved().equals("no") ? "selected=\"selected\"" : "" %>>No</option>
    </select>
</div>
  
                       
                        <div class="submit-section">
                            <button type="submit" name="edit_bidding" class="btn btn-primary submit-btn">Update</button>
                        </div>
                       </div>
            
					</div>
						
				</form>
				</div>
					</div>
						</div>
							</div>
							<%
    HttpSession sessionstatus = request.getSession(true);

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("Employee Position Updated Successfully!")) {
        response.sendRedirect("bidding.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>designation not found with the provided ID.</p>
</div>
<%
    }
%>
<%
        }
%>
<%
        }
%>
<!-- Include your JavaScript libraries here -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>