<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.AddTraining_TypeDAO" %>
<%@ page import="com.weblabs.beans.AddTraining_Type" %>
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

    String idFilter = request.getParameter("TrainingTypeID"); // Make sure the parameter name matches your form
    List<AddTraining_Type> trainingtype = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "TrainingTypeID = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        trainingtype = AddTraining_TypeDAO.getFilteredAddTrainingtype(whereClause, start, limit);
    }

    if (trainingtype != null && !trainingtype.isEmpty()) {
    	AddTraining_Type type = trainingtype.get(0); // Access the first element
        if (type != null) {
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
<form action="./UpdateTraining_TypeSrv" method="post">
<div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-form-label">ID <span class="text-danger">*</span></label>
                            <input name="id" value="<%= type.getId() %>" required class="form-control" type="text" readonly>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Type <span class="text-danger">*</span></label>
                            <input name="type" value="<%= type.getType() %>" required class="form-control" type="text">
                        </div>
              
                        <div class="form-group">
                            <label class="col-form-label">description <span class="text-danger">*</span></label>
                            <input name="description" value="<%= type.getDescription() %>" required class="form-control" type="text">
                        </div>
                        <%-- <div class="form-group">
                            <label class="col-form-label">Status <span class="text-danger">*</span></label>
                            <input name="Status" value="<%= type.getStatus() %>" required class="form-control" type="text">
                        </div> --%>
         <div class="form-group">
        <label class="col-form-label">Status <span class="text-danger">*</span></label>
        <select class="select" name="Status" required>
            <option value="Active" <%= "Active".equals(type.getStatus()) ? "selected" : "" %>>Active</option>
            <option value="Inactive" <%= "Inactive".equals(type.getStatus()) ? "selected" : "" %>>Inactive</option>
        </select>
    </div>
 
                        <div class="submit-section">
                            <button type="submit" name="update_trainingtype" class="btn btn-primary submit-btn">Update</button>
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

    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("Trainingtype Position Updated Successfully!")) {
        response.sendRedirect("training-type.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>Training-type not found with the provided ID.</p>
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
