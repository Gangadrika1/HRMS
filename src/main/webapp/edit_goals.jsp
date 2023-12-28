<%@page import="com.weblabs.service.impl.GoalsTypeDAO"%>
<%@page import="com.weblabs.beans.AddGoalsType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.GoalsDao" %>
<%@ page import="com.weblabs.beans.AddGoals" %>
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

   
    <!-- <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script> -->
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("GoalID"); // Make sure the parameter name matches your form
    List<AddGoals> goals = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "GoalID = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        goals = GoalsDao.getFilteredAddGoals(whereClause, start, limit);
    }

    if (goals != null && !goals.isEmpty()) {
    	AddGoals goal = goals.get(0); // Access the first element
        if (goal != null) {
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


   
<form action="./EditGoalsSrv" method="post">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-form-label">ID <span class="text-danger">*</span></label>
                            <input name="id" value="<%= goal.getId() %>" required class="form-control" type="text" readonly>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Goal Type <span class="text-danger">*</span></label>
                           <select required name="Type" class="select">
                                             <%
											List<AddGoalsType> dept = GoalsTypeDAO.getAllGoals();
											for(AddGoalsType dep: dept)
											{
											%>
                                           <option  value="<%= dep.getId()%>"> <%= dep.getType()%></option>
                                        <%
                          					}
									     %>
                                                    </select>
                        </div>
              
                        <div class="form-group">
                            <label class="col-form-label">Subject <span class="text-danger">*</span></label>
                            <input name="Subject" value="<%= goal.getSubject() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Target Achievement <span class="text-danger">*</span></label>
                            <input name="Target" value="<%= goal.getTarget() %>" required class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Start Date <span class="text-danger">*</span></label>
                            <input name="StartDate" value="<%= goal.getStartDate() %>" required class="form-control datetimepicker" type="text">
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">End Date <span class="text-danger">*</span></label>
                            <input name="EndDate" value="<%= goal.getEndDate() %>" required class="form-control datetimepicker" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Description <span class="text-danger">*</span></label>
                            <input name="Description" value="<%= goal.getDescription() %>" required class="select" type="text">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Status <span class="text-danger">*</span></label>
                            <input name="Status" value="<%= goal.getStatus() %>" required class="form-control" type="text">
                        </div>
 
 
                         <div class="form-group">
                            <label class="col-form-label">Progress <span class="text-danger">*</span></label>
                            <input name="Progress" value="<%= goal.getProgress() %>" required class="form-control-range custom-range" id="customRange" type="text">
                        </div>
 
 
                        <div class="submit-section">
                            <button type="submit" name="update_goal-tracking" class="btn btn-primary submit-btn">Update</button>
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

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("goal-traking Position Updated Successfully!")) {
        response.sendRedirect("goal-tracking.jsp");
    } else {
%>
   <div class="col-sm-6">
		<!-- <p>goal-tracking not found with the provided ID.</p> -->
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
