<%@page import="java.time.Year"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.weblabs.service.impl.PayrollDAO" %>
<%@ page import="com.weblabs.beans.Payroll" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
  
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/logo.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="css/line-awesome.min.css">
		
		<!-- Datatable CSS -->
		<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="css/select2.min.css">
		
		<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
             <!-- table styles CSS -->
     <link rel="stylesheet" href="css/tstyles.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="js/html5shiv.min.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
 

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            // Function to reload months based on the selected year
            function reloadMonths() {
                var selectedYear = $("#year").val();
                $.ajax({
                    type: "GET",
                    url: "FetchMonthsServlet", // Replace with the actual servlet or URL to fetch months
                    data: {year: selectedYear},
                    success: function (data) {
                        // Replace the current options with the new ones
                        $("#month").html(data);
                    }
                });
            }

            // Attach change event handler to the year dropdown
            $("#year").change(function () {
                reloadMonths();
            });

            // Initial load of months based on the selected year
            reloadMonths();
        });
    </script>


    <title>Payslip Genaration</title>
</head>
<body>

<jsp:include page="header.jsp" />

        <!-- Sidebar -->
         <jsp:include page="sidebar.jsp" />
         
          <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
					<h1>Payslip Genaration</h1>
	
<form action="./GenaratePayslipSRV" method="post">
<div class="row">
		<div class="col-md-6">
		<div class="form-group">
		
      <label for="year">Select Year:</label>
             <select id="year" name="year" class="form-control">
                 <%
                     // Assuming you have a variable 'selectedYear' from your application logic
                     String selectedYear = request.getParameter("year");
                     List<Payroll> years = PayrollDAO.getAllYears();
                     for (Payroll year : years) {
                 %>
                 <option <%= (selectedYear != null && selectedYear.equals(year.getYear())) ? "selected" : "" %>><%= year.getYear() %></option>
                 <%
                     }
                 %>
             </select>
             <br><br>
             <label for="month">Select Month:</label>
             
              <select id="month" name="month" class="form-control"></select>
                
<br><br>
<button type="submit">Generate Payslip</button>
		</div>
		</div>
	</div>
</form>
</div>
</div>
</div>

<!-- jQuery -->
     <!--    <script src="js/jquery-3.2.1.min.js"></script> -->
		
		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="js/select2.min.js"></script>
		
		<!-- Datatable JS -->
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js"></script>
		
		<!-- Datetimepicker JS -->
		<script src="js/moment.min.js"></script>
		<script src="js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Custom JS -->
		<script src="js/app.js"></script>
</body>
</html>