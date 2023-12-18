 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.beans.TasksBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.weblabs.service.impl.taskDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.weblabs.beans.CreateProject" %>
<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
    <!-- Add your CSS and JavaScript includes here -->
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">

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
    <!-- table styles CSS -->
    <link rel="stylesheet" href="css/styles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]-->
   <!--  <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>  -->
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("task_id");
    List<TasksBean> tasksList = null;
    String whereClause = "";

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "task_id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        tasksList = taskDAO.getFilteredTask(whereClause, start, limit);
    }

    if (tasksList != null && !tasksList.isEmpty()) {
        TasksBean task = tasksList.get(0);

        if (task != null) {
%>

<!-- <form action="./EditTaskSrv" method="post"> -->
    <div class="main-wrapper">
        <jsp:include page="header.jsp" />
        <jsp:include page="sidebar.jsp" />
        
        <!-- Page Wrapper -->
        <div class="page-wrapper">
            <!-- Page Content -->
            <div class="content container-fluid">
                <!-- Page Header -->
                <div class="page-header">
                
            <form action="./EditTaskSrv" method="post"> 
                
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label"><span class="text-danger">*</span>Task ID</label>
                                <input name="task_id" required class="form-control" type="text" readonly value="<%= task.getTask_id() %>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Project Id <span class="text-danger">*</span></label>
                                <select name="project_id" required class="form-control" required>
                                    <%
                                        try {
                                            List<CreateProject> projects = ProjectDAO.getAllProjects();
                                            
                                            for (CreateProject project : projects) {
                                    %>
                                    <option value="<%= project.getProject_id() %>" <%= (project.getProject_id().equals(task.getProject_id())) ? "selected" : "" %>><%= project.getProject_id() %></option>
                                    <%
                                            }
                                            
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </select>
                            </div>
                        </div> 
                       
                        <!-- Add other form fields with values from the 'task' object -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Description</label>
                                <input name="description" required class="form-control" type="text" value="<%= task.getDescription() %>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Start Date <span class="text-danger">*</span></label>
                                <input name="start_date" required class="form-control" type="date" value="<%= task.getStart_date() %>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">End Date <span class="text-danger">*</span></label>
                                <input name="end_date" required class="form-control" type="date" value="<%= task.getEnd_date() %>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Assigned Resource</label>
                                <input name="assigned_resource" required class="form-control" type="text" value="<%= task.getAssigned_resource() %>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Is Completed</label>
                                <select name="is_completed" required class="form-control">
                                    <option value="Approved" <%= (task.getIs_completed().equals("Approved")) ? "selected" : "" %>>Approved</option>
                                    <option value="Pending" <%= (task.getIs_completed().equals("Pending")) ? "selected" : "" %>>Pending</option>
                                </select>
                            </div>
                        </div>
                        <!-- End of other form fields -->

                    </div>
                    <div class="submit-section">
                        <button type="submit" class="btn btn-primary submit-btn">Update</button>
                    </div>
                     </form>
                </div>
               
            </div>
            
        </div>
    </div>

<%
    HttpSession sessionstatus = request.getSession(true);
    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("provident found Position Updated Successfully!")) {
        response.sendRedirect("tasks.jsp");
    } else {
%>
   <div class="col-sm-6">
        <p>Task not found with the provided ID.</p>
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

			