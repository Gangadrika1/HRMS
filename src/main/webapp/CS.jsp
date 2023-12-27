<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.csDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.weblabs.service.impl.CompanySettingServiceImpl" %>
<%@ page import="com.weblabs.beans.CompanySettingsBean" %>

<%
    // Getting the username from the session
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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
     <link rel="stylesheet" href="css/tstyles.css">
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
            
			<!--   <div class="header-topleft text-left" style="margin-left: 1cm;">
        <img src="assets/logo.png" width="150" height="100" alt="">
    </div>
			 -->
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
					
					
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Company Settings</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Company Settings</li>
								</ul>
							</div>
						</div>
					</div>
		
	<%
    csDAO aa = new csDAO();
    List<CompanySettingsBean> companySettingsList = aa.getAllCS();

    // Initialize the company object outside the if block
    CompanySettingsBean company = null;

    if (companySettingsList != null && !companySettingsList.isEmpty()) {
        company = companySettingsList.get(0); // Assuming only one record is fetched
    }
%>	
<form id="myForm" action="" method="post">
				 <input type="hidden" id="action" name="action" value="">	
         <!--  <form action="./AddCSSrv" method="post">
 
     <form action="./EditCSSrv" method="post"> -->

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Company Name <span class="text-danger">*</span></label>
								
									<%-- 		        <input type="text" id="companyName" name="companyName" value="<%= company.getCompanyName() %>"> value="<%= companyName %>">  --%>
									<input class="form-control" type="hidden" name="CompanyID" value="<%= (company != null) ? company.getCompanyID() : "" %>">   
											<input class="form-control" type="text" name="CompanyName" value="<%= (company != null) ? company.getCompanyName() : "" %>" oninput="checkInput()">   
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Contact Person</label>
											<input class="form-control "  type="text" name="ContactPerson" value="<%= (company != null) ? company.getContactPerson() : "" %>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
								        <div class="form-group">
								            <label>Address</label>
								            <input class="form-control" style="width: 598px;" type="text" name="Address" value="<%= (company != null) ? company.getAddress() : "" %>">
								        </div>
								    </div>
								    <div class="col-sm-6">
								        <div class="form-group">
								            <label>LOGO File</label>
								            <input style="margin-right: 30px; width: 285px;" class="form-control" type="file" name="logo" value="<%= (company != null) ? company.getLogo() : "" %>">
								        </div>
								    </div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>Country</label>
											
											<input class="form-control "  type="text" name="Country" value="<%= (company != null) ? company.getCountry() : "" %>">
										</div>
									</div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>City</label>
											<input class="form-control"  type="text" name="City" value="<%= (company != null) ? company.getCity() : "" %>">
										</div>
									</div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>State</label>

											<input class="form-control "  type="text" name="State" value="<%= (company != null) ? company.getState() : "" %>">
										</div>
									</div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>Postal Code</label>
											<input class="form-control"  type="text" name="PostalCode" value="<%= (company != null) ? company.getPostalCode() : "" %>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Email</label>
											<input class="form-control"  type="email" name="Email" value="<%= (company != null) ? company.getEmail() : "" %>">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Phone Number</label>
											<input class="form-control"  type="text" name="PhoneNumber" value="<%= (company != null) ? company.getPhoneNumber() : "" %>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Mobile Number</label>
											<input class="form-control"  type="text" name="MobileNumber" value="<%= (company != null) ? company.getMobileNumber() : "" %>">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Fax</label>
											<input class="form-control"  type="text" name="Fax" value="<%= (company != null) ? company.getFax() : "" %>">
										</div>
									</div>
								</div>
								<div class="row">
								    <div class="col-sm-4">
								        <div class="form-group">
								            <label>Website Url</label>
								            <input class="form-control"  type="text" name="WebsiteUrl" value="<%= (company != null) ? company.getWebsiteUrl() : "" %>">
								        </div>
								    </div>
								    <div class="col-sm-4">
								        <div class="form-group">
								            <label>Teligram Url</label>
								            <input class="form-control"  type="text" name="TelegramUrl" value="<%= (company!=null) ? company.getTelegramUrl() : ""%>">
								        </div>
								    </div>
								    <div class="col-sm-4">
								        <div class="form-group">
								            <label>Instagram Url</label>
								            <input class="form-control"  type="text" name="InstagramUrl" value="<%= (company!=null) ? company.getInstagramUrl() : ""%>" >
								        </div>
								    </div>
								</div>

						
<!--     <button class="btn btn-primary submit-btn" type="submit" name="action" value="save" onclick="setAction('save')" id="saveBtn" >Save</button> -->
<!-- ... Your form ... -->
<div class="text-center">
    <button class="Addbutton" class="btn btn-primary submit-btn" type="submit" name="action" value="save" onclick="setAction('save')" id="saveBtn" disabled>Save</button>
    <button class="Addbutton" class="btn btn-primary submit-btn" type="submit" name="action" value="edit" onclick="setAction('edit')">Edit</button>
</div>
<!-- ... Rest of your HTML ... -->

							</form>
 
</div></div></div>

  <script>
    function setAction(action) {
        var form = document.getElementById('myForm');
        document.getElementById('action').value = action;
        form.action = (action === 'save') ? './AddCSSrv' : './EditCSSrv';
        form.submit();
    }
</script>
      
  
<!--   
 ... Your HTML code ...
 <script>
    // Variable to track whether data is loaded or not
   // Variable to track whether data is loaded or not



    // Function to enable/disable the Save button based on form data
    function updateSaveButtonState() {
        // Get values from relevant form fields
        var companyName = document.getElementsByName("CompanyName")[0].value;
        var contactPerson = document.getElementsByName("ContactPerson")[0].value;

        // Get the Save button
        var saveButton = document.getElementById("saveBtn");

        // Enable the Save button if at least one field has a value and it's not in edit mode
        saveButton.disabled = !(companyName || contactPerson);
    }

    // Attach the updateSaveButtonState function to form input events
    var formInputs = document.querySelectorAll('#myForm input');
    formInputs.forEach(function (input) {
        input.addEventListener('input', updateSaveButtonState);
    });

    // Call the function initially to set the initial state
    updateSaveButtonState();
</script>  -->

  
  
  
  <!-- Update the "Save" button id to match the actual id -->


<script>
    function checkInput() {
        // Get the Company Name input by name
        var CompanyName = document.getElementsByName('CompanyName')[0].value;

        // Get the button by id
        var saveBtn = document.getElementById('saveBtn');

        // Check if the Company Name field has data
        if (CompanyName.trim() !== '') {
            // Enable the button
            saveBtn.disabled = false;
        } else {
            // Disable the button
            saveBtn.disabled = true;
        }
    }
</script>
  
  
  
  
         
         <!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>

		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Datatable JS -->
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js"></script>

		<!-- Custom JS -->
		<script src="js/app.js"></script>

         
</body>
</html>