<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.service.impl.AddClientsDAO" %>
<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.service.impl.AddClientsDAO" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.service.impl.ExpensesDao" %>
<%@ page import="com.weblabs.service.impl.taskDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    // Getting the username from the session
    String username = (String)session.getAttribute("username");
    // Sample data for recent tasks (you should replace this with your actual data retrieval logic)
   // List<EmployeeTask> recentTasks = EmployeeTasksDAO.getRecentTasks(username);
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr - Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Dash board - HRMS employee template</title>

   
    <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">

    <link rel="stylesheet" href="css/bootstrap.min.css">

    
    <link rel="stylesheet" href="css/font-awesome.min.css">

  
    <link rel="stylesheet" href="css/line-awesome.min.css">


    <link rel="stylesheet" href="plugins/morris/morris.css">

  
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
  
    <div class="main-wrapper">
        <jsp:include page="header.jsp" />
        <jsp:include page="sidebar.jsp" />
        <div class="page-wrapper">
            <div class="content container-fluid">
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Display welcome message -->
                            <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                                 Welcome ! 
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ul>
                        </div>
                    </div>
                </div>
              
              
<div class="row">

    <!-- Project Widget -->
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <span class="dash-widget-icon"><i class="fa fa-cubes"></i></span>
                <div class="dash-widget-info">
                 <h4>ABC</h4>
                    <span>Project </span>
                </div>
            </div>
        </div>
    </div>

    <!-- Manager Widget -->
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <span class="dash-widget-icon"><i class="fa fa-user"></i></span>
                <div class="dash-widget-info">
                    <h4>developer</h4>
                    <span>Designation </span>
                </div>
            </div>
        </div>
    </div>

    <!-- Pending Tasks Widget -->
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <span class="dash-widget-icon"><i class="fa fa-tasks"></i></span>
                <div class="dash-widget-info">
                  <h3>5</h3>
                    <span>Experience</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Leaves Widget -->
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <span class="dash-widget-icon"><i class="fa fa-diamond"></i></span>
                <div class="dash-widget-info">
                <h3>$1500</h3>
                    <span>Gross Salary </span>
                </div>
            </div>
        </div>
    </div>

</div>

 
 
 
  <div class="row">
  <div class="col-md-12">
  <div class="card-group m-b-30">
  
  
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">
                                        <div>
                                            <!-- <span class="d-block">Manager details</span> -->
                                            <h4>Manager details</h4>
                                        </div>
                                    </div>
                                    <!--  <h5 class="mb-3">Name: John </h5> --> 
                                     <span class="d-block">Name: John</span>
                                     <span class="d-block">Designation: developer</span>
                                    <!--   <h5 class="mb-3">Designation: developer </h5>  -->
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">
                                        <div>
                                          <h4>Leaves</h4>
                                        </div> 
                                        </div>
                                          <span class="d-block">Total: 30</span>
                                     <span class="d-block">Pending: 10</span>
                                      <div class="progress mb-2" style="height: 5px;">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                        </div>
                                    </div>
                             

                           <!--   <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">
                                        <div>
                                             <h4>Education Qualification</h4>
                                        </div> 
                                    </div>
                                <span class="d-block">Btech</span>
                                     <span class="d-block">abcdef</span>
                                </div>
                            </div>
                              -->
                              <div class="card">
    <div class="card-body">
        <div class="d-flex justify-content-between mb-3">
            <div>
                 <h4>Education Qualification</h4>
            </div> 
        </div>
        <span class="d-block">Btech</span>
        <span class="d-block">abcdef</span>
    </div>
    <div class="card-footer">
        <!-- Add a link to new_edu.jsp -->
        <a href="new_edu.jsp" class="btn btn-primary">View  </a>
    </div>
</div>
                              
       
                             
                             

                       <!--     <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-3">
                                        <div>
                                            <h4>Tasks </h4>
                                        </div>
                                        </div>
                                <span class="d-block">Pending:5</span>
                                     <span class="d-block">Assigned:20</span>
                                     <div class="progress mb-2" style="height: 5px;">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div> -->
<div class="card">
    <div class="card-body">
        <div class="d-flex justify-content-between mb-3">
            <div>
                <h4>Tasks </h4>
            </div>
        </div>
        <span class="d-block">Pending:5</span>
        <span class="d-block">Assigned:20</span>
        <div class="progress mb-2" style="height: 5px;">
            <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
    </div>
    <div class="card-footer">
        <!-- Add a link to new_task.jsp with parameters -->
        <a href="new_task.jsp?pending=5&assigned=20" class="btn btn-primary">View </a>
    </div>
</div>


                            
                            
</div>
</div>
</div>
        

                             
</div>
</div>
</div>
        

</body>
</html>
