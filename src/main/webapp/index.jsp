<%@ page import="com.weblabs.service.impl.biddingDAO" %>
<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.service.impl.AddClientsDAO" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.service.impl.ExpensesDao" %>
<%@ page import="com.weblabs.service.impl.taskDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.BigDecimal" %>
<%
    // Getting the username from the session
    String username = (String)session.getAttribute("username");
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
    <title>Dashboard - HRMS admin template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

    <!-- Chart CSS -->
    <link rel="stylesheet" href="plugins/morris/morris.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!-- Main Wrapper -->
    <div class="main-wrapper">

        <!-- Header -->
         <jsp:include page="header.jsp" />
        <!-- /Header -->

        <!-- Sidebar -->
          <jsp:include page="sidebar.jsp" />
        <!-- /Sidebar -->

        <!-- Page Wrapper -->
        <div class="page-wrapper">

            <!-- Page Content -->
            <div class="content container-fluid">

                <!-- Page Header -->
                <div class="page-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Display welcome message -->
                                <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                                           Welcome <%= username%>!
                                  </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ul>
                        </div>
                    </div>
                </div>
       
                    
<div class="row">
    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
        <div class="card dash-widget">
            <div class="card-body">
                <a href="projects.jsp" style="text-decoration: none; color: inherit;">
                    <span class="dash-widget-icon"><i class="fa fa-cubes"></i></span>
                    <div class="dash-widget-info">
                        <% int ProjectCount = ProjectDAO.totalCount(); %>
                        <h3><%=ProjectCount %></h3>
                        <span>Projects </span>
                    </div>
                </a>
            </div>
        </div>
    </div>

                    
                    
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                             <a href="clients.jsp" style="text-decoration: none; color: inherit;">
                                <span class="dash-widget-icon"><i class="fa fa-users"></i></span>
                                <div class="dash-widget-info">
                                  <%int ClientCount = AddClientsDAO.totalCount(); %>
                                    <h3><%=ClientCount %></h3>
                                    <span>Clients</span>
                                </div>
                                  </a>
                            </div>
                        </div>
                    </div>
                    
                    
                  <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                                <a href="tasks.jsp" style="text-decoration: none; color: inherit;">
                                <span class="dash-widget-icon"><i class="fa fa-diamond"></i></span>
                                <div class="dash-widget-info">
                                    <%int TasksCount = taskDAO.totalCount(); %>
                                    <h3><%=TasksCount %></h3>
                                    <span>Tasks</span>
                                </div>
                                  </a>
                            </div>
                        </div>
                    </div>  
                    
                    
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="card dash-widget">
                            <div class="card-body">
                                <a href="employee.jsp" style="text-decoration: none; color: inherit;">
                                <span class="dash-widget-icon"><i class="fa fa-user"></i></span>
                                <div class="dash-widget-info">
                                   <%int EmployeesCount = EmployeeDAO.totalCount(); %>
                                    <h3><%=EmployeesCount %></h3>
                                    <span>Employees</span>
                                </div>
                                
                                  </a>
                            </div>
                        </div>
                    </div>
</div>







<div class="row">
<!-- <div class="col-md-12">
<div class="card-group m-b-30"> -->

                     
<%
    int newEmployeesCount = EmployeeDAO.getNewEmployeesCountThisMonth();

    java.util.Calendar cal = java.util.Calendar.getInstance();
    int month = cal.get(java.util.Calendar.MONTH);
    String monthName = new java.text.DateFormatSymbols().getMonths()[month];
%>
<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
<div class="card dash-widget">
    <div class="card-body">
        <div class="d-flex justify-content-between mb-3">
            <div>
                <span class="d-block">New Employees</span>
            </div>
            <div>
             <span class="text-success"><%= (newEmployeesCount*100/EmployeesCount) %>%</span>
              <%--   <span class="text-success"><%= newEmployeesCount %> in <%= monthName %></span> --%>
            </div>
        </div>
        <h3 class="mb-3"><%= newEmployeesCount %></h3>
        <div class="progress mb-2" style="height: 5px;">
            <div class="progress-bar bg-primary" role="progressbar" style="width: <%= (newEmployeesCount * 100 / EmployeesCount) %>%;" aria-valuenow="<%= (newEmployeesCount * 100 / EmployeesCount) %>" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <p class="mb-0">Overall Employees <%= EmployeesCount %></p>
    </div>
</div>
      </div>

<%
BigDecimal totalPreviousMonthApprovedPricing = biddingDAO.getTotalPricingForPreviousMonthApprovedProjects();
BigDecimal TotalPricingForProject = biddingDAO.getTotalPricingForProject();
int previousMonthApprovedPricingCount = totalPreviousMonthApprovedPricing != null ? totalPreviousMonthApprovedPricing.intValue() : 0;
int biddingCount1 = 0;
 
 if (TotalPricingForProject != null) {
	   // int value = TotalPricingForProject.intValue();
	    // Continue with the rest of your code
	  biddingCount1 = TotalPricingForProject.intValue();
	}
 double percentageChange33;
 try {
	    percentageChange33 = (((double) biddingCount1 - previousMonthApprovedPricingCount) / biddingCount1) * 100;
	    
	    // Check if the result is NaN
	    if (Double.isNaN(percentageChange33)) {
	        percentageChange33 = 0; // Set it to 0 in case of NaN
	    }
	} catch (ArithmeticException e) {
	    // Handle division by zero or other arithmetic exceptions
	    percentageChange33 = 0;
	}
DecimalFormat df1 = new DecimalFormat("#.##");
percentageChange33 = Double.parseDouble(df1.format(percentageChange33));
 %>
 <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
<div class="card dash-widget">
    <div class="card-body">
        <div class="d-flex justify-content-between mb-3">
            <div>
                <span class="d-block">Earnings</span>
            </div>
            <div>
                <span class="text-danger"><%=percentageChange33%>%</span>
            </div>
        </div>
        <h3 class="mb-3">Rs.<%= biddingCount1%></h3>
        <div class="progress mb-2" style="height: 5px;">
            <div class="progress-bar bg-primary" role="progressbar" style="width: <%=percentageChange33%>%;" aria-valuenow="<%=percentageChange33%>" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <p class="mb-0">Previous Month <span class="text-muted">Rs.<%= previousMonthApprovedPricingCount %></span></p>
    </div>
</div>

</div>


<%
ExpensesDao expensesDao = new ExpensesDao(); // Create an instance of ExpensesDao
    //double totalExpensePresentMonth = expensesDao.getTotalExpenseForPresentMonth();
    double totalExpensePreviousMonth = expensesDao.getTotalExpenseForPreviousMonth();
  //totalExpenses :
    double totalAmount = ExpensesDao.getTotalAmount();
    //double TotalExpenseForDateRange = expensesDao.getTotalExpenseForDateRange();
    // Calculate percentage change
    double percentageChange = 0.0;
    if (totalExpensePreviousMonth != 0.0) {
        percentageChange = ((totalAmount - totalExpensePreviousMonth)* 100 / totalAmount);
        DecimalFormat df = new DecimalFormat("#.##");
        percentageChange = Double.parseDouble(df.format(percentageChange));
    } 
%>

<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
<div class="card dash-widget">
    <div class="card-body">
        <div class="d-flex justify-content-between mb-3">
            <div>
                <span class="d-block">Expenses</span>
            </div>
            <div>
                <!--   <span class="text-danger">-2.8%</span>  -->
                <span class="text-danger"><%= percentageChange %>%</span>
            </div>
        </div>
        <h3 class="mb-3">Rs.<%= totalAmount %></h3>
        <div class="progress mb-2" style="height: 5px;">
            <!-- Use the dynamic value for width -->
            <div class="progress-bar bg-primary" role="progressbar" style="width: <%= percentageChange %>%;" aria-valuenow="<%= percentageChange %>" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <p class="mb-0">Previous Month <span class="text-muted">Rs.<%= totalExpensePreviousMonth %></span></p>
    </div>
</div>
</div>

                            
                            
               
<%
/* BigDecimal totalPreviousMonthApprovedPricing = biddingDAO.getTotalPricingForPreviousMonthApprovedProjects();
BigDecimal TotalPricingForProject = biddingDAO.getTotalPricingForProject();
int previousMonthApprovedPricingCount = totalPreviousMonthApprovedPricing != null ? totalPreviousMonthApprovedPricing.intValue() : 0;
 int biddingCount1 = TotalPricingForProject.intValue(); */
 
 double percentageChange22;
 try {
     double rawPercentageChange22 = (((biddingCount1 - totalAmount) - (previousMonthApprovedPricingCount - totalExpensePreviousMonth)) / (biddingCount1 - totalAmount)) * 100;

     // Format the result to two decimal places
     DecimalFormat df2 = new DecimalFormat("#.##");
     String formattedPercentageChange22 = df2.format(rawPercentageChange22);

     // Parse the formatted string back to a double
     percentageChange22 = Double.parseDouble(formattedPercentageChange22);
 } catch (ArithmeticException | NumberFormatException e) {
     // Handle division by zero or other arithmetic exceptions
     percentageChange22 = 0;
 }

%>
<div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
<div class="card dash-widget">
    <div class="card-body">
        <div class="d-flex justify-content-between mb-3">
            <div>
                <span class="d-block">Profit</span>
            </div>
            <div>
                <span class="text-danger"> <%=percentageChange22%>%</span>
            </div>
        </div>
        <h3 class="mb-3">Rs.<%= biddingCount1 - totalAmount %></h3>
        <div class="progress mb-2" style="height: 5px;">
           <div class="progress-bar bg-primary" role="progressbar" style="width: <%=percentageChange22%>%;" aria-valuenow="<%=percentageChange22%>" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <p class="mb-0">Previous Month <span class="text-muted">Rs.<%= previousMonthApprovedPricingCount- totalExpensePreviousMonth %></span></p>
    </div>
</div>
 </div>                           
    
    
                            
<!--                            
</div>
</div> -->
</div>



                <div class="row  justify-content-centeralign-items-center">
                    <div class="col-md-12 d-flex">
                        <div class="card card-table flex-fill">
                            <div class="card-header  text-center">
                           
                                <a href="projects.jsp"  class="btn btn-primary ">View projects</a>
                                
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /Page Content -->

        </div>
        <!-- /Page Wrapper -->

    </div>
    <!-- /Main Wrapper -->

    <!-- javascript links starts here -->
    <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="js/jquery.slimscroll.min.js"></script>

    <!-- Chart JS -->
    <script src="plugins/morris/morris.min.js"></script>
   <!--  <script src="plugins/raphael/raphael.min.js"></script> -->
    <script src="js/chart.js"></script>

    <!-- Custom JS -->
    <script src="js/app.js"></script>
    <!-- javascript links ends here  -->
</body>
</html>