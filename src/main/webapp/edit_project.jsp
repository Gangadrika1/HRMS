<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.beans.CreateProject" %>
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

    String idFilter = request.getParameter("project_id"); // Make sure the parameter name matches your form
    List<CreateProject> projects = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "project_id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        projects = ProjectDAO.getFilteredProject(whereClause, start, limit);
    }

    if (projects != null && !projects.isEmpty()) {
    	CreateProject project = projects.get(0); // Access the first element
        if (projects != null) {
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
<form action="./EditProjectSrv" method="post">
 <div class="row">
 
 
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-form-label">ID <span class="text-danger">*</span></label>
                            <%-- <input name="project_id" value="<%= project.getProject_id() %>" required class="form-control" type="text" readonly> --%>
                                   <input name="project_id" value="<%= project.getProject_id() %>" required class="form-control" type="text" readonly>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Project Name <span class="text-danger">*</span></label>
                            <input name="projectname" value="<%= project.getProjectname() %>" required class="form-control" type="text">
                        </div>
              
                        <div class="form-group">
                            <label class="col-form-label">Client id <span class="text-danger">*</span></label>
                            <input name="Clientid" value="<%= project.getClientid() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Start Date <span class="text-danger">*</span></label>
                            <input name="startdate" value="<%= project.getStartdate() %>" required class="form-control" type="text">
                        </div>
                        
                         <div class="form-group">
                            <label class="col-form-label">End  Date <span class="text-danger">*</span></label>
                            <input name="enddate" value="<%= project.getEnddate() %>" required class="form-control" type="text">
                        </div>
                        
                        <div class="form-group">
                            <label class="col-form-label">Rate <span class="text-danger">*</span></label>
                            <input name="rate" value="<%= project.getRate() %>" required class="form-control" type="text">
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">Hourly/Fixed <span class="text-danger">*</span></label>
                            <input name="hourly" value="<%= project.getHourly() %>" required class="form-control" type="text">
                        </div>
              
                        <div class="form-group">
                            <label class="col-form-label">Priority <span class="text-danger">*</span></label>
                            <input name="priority" value="<%= project.getPriority() %>" required class="form-control" type="text">
                        </div>
                        
                         <div class="form-group">
                            <label class="col-form-label">Add Project Leader <span class="text-danger">*</span></label>
                          <%--   <input name="projectleader" value="<%= project.getProjectleader() %>" required class="form-control" type="text"> --%>
                        <input name="projectleader" value="<%= project.getProjectleader()%>" required class="form-control" type="text">
                        
                        </div>
              
                       <%--  <div class="form-group">
                            <label class="col-form-label">Add Team<span class="text-danger">*</span></label>
                            <input name="addteam" value="<%= project.getAddteam() %>" required class="form-control" type="text">
                        </div> --%>
 
 <div class="form-group">
    <label class="col-form-label">Add Team <span class="text-danger">*</span></label>
    <input name="addteam" value="<%=  project.getAddteam()  %>" required class="form-control" type="text">
</div>
                           <div class="form-group">
                            <label class="col-form-label">Description <span class="text-danger">*</span></label>
                            <input name="description" value="<%= project.getDescription() %>" required class="form-control" type="text">
                        </div>
              
                       <div class="form-group">
    <label class="col-form-label">Upload Files <span class="text-danger">*</span></label>
    <input name="uploadfile" value="<%= project.getUploadfile() %>" required class="form-control" type="text">
</div>

                        
                        
 
                        <div class="submit-section">
                            <button type="submit" name="submit" class="Addbutton">Update</button>
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

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("  Updated Successfully!")) {
        response.sendRedirect("projects.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>resignation not found with the provided ID.</p>
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