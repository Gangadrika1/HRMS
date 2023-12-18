<%@ page import="com.weblabs.service.impl.AddProfileImpl" %>
<%@ page import="com.weblabs.beans.AddProfile" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="com.weblabs.beans.AddEducationInformation" %>
<%@ page import="com.weblabs.beans.AddEmergencyInformation" %>
<%@ page import="com.weblabs.beans.AddExperienceInformation" %>
<%@ page import="com.weblabs.beans.AddFamilyInformation" %>
<%@ page import="com.weblabs.beans.AddPersonalInformation" %>
<%@ page import="com.weblabs.beans.AddBankInformation" %>
<%@ page import="java.util.List" %>
     <!DOCTYPE html>
     <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Employee Profile - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
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
         <link rel="stylesheet" href="css/tstyles.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		
		
		 <style>
    /* Some basic styling for the table */
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
    .child {
      display: none; /* Hide child rows initially */
    }
    .childTable {
      margin-left: 20px; /* Indent child table */
    }
  </style>
  
  
   <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="js/jquery.slimscroll.min.js"></script>

    <!-- Select2 JS -->
    <script src="js/select2.min.js"></script>

    <!-- Datetimepicker JS -->
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>

    <!-- Tagsinput JS -->
    <script src="plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

    <!-- Custom JS -->
    <script src="js/app.js"></script>
    
     <script>
  // Toggle child rows on clicking parent rows
 
  document.addEventListener('DOMContentLoaded', function () {
    // Toggle child rows on clicking parent rows
    const parentRows = document.querySelectorAll('.parentRow');

    parentRows.forEach(row => {
      row.addEventListener('click', () => {
        const childRow = row.nextElementSibling;
        childRow.classList.toggle('child');
      });
    });
  });
</script>
    
    </head>
    <body>
    <!-- filtering records -->
    <%
    HttpSession sessionRec = request.getSession(true);

    String recordsPerPageStr = (String) sessionRec.getAttribute("recordsPerPage");
    String currentPageStr = (String) sessionRec.getAttribute("currentPage");

    if (recordsPerPageStr == null || "0".equals(recordsPerPageStr)) {
        recordsPerPageStr = "5";
        sessionRec.setAttribute("recordsPerPage", recordsPerPageStr);
    }
    int recordsPerPage = Integer.parseInt(recordsPerPageStr);

    if (currentPageStr == null || "0".equals(currentPageStr)) {
        currentPageStr = "1";
        sessionRec.setAttribute("currentPage", currentPageStr);
    }
    int currentPage = Integer.parseInt(currentPageStr);

    int newRecordsPerPage = 5;
    String newRecordsPerPageParam = request.getParameter("newRecordsPerPage");
    if (newRecordsPerPageParam != null) {
        newRecordsPerPage =- Integer.parseInt(newRecordsPerPageParam);
        sessionRec.setAttribute("recordsPerPage", String.valueOf(newRecordsPerPage));
    }
    %>
    
    <!-- Main Wrapper -->
<div class="main-wrapper">

    <!-- Include your header HTML here -->
    <jsp:include page="header.jsp" />

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />
    <!-- Include your sidebar HTML here -->

    <!-- Page Wrapper -->
    <div class="page-wrapper">
        <!-- Page Content -->
        <div class="content container-fluid">
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <h3 class="page-title">Profile</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Profile</li>
                        </ul>
                    </div>
                    <div class="col-auto float-right ml-auto">
                        <a href="information.jsp" class="btn add-btn"><i class="fa fa-plus"></i> Employee Information</a>
                    </div>
                </div>
            </div>
					
					 <!-- Search form -->
            <form action="./ProfileSearchSrv" method="post">
                <div class="row filter-row">
                   
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus select-focus">
                            <label for="date">EmployeeID:</label>
                            <input type="text" name="employeeid" id="date">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <input type="submit" value="Search">
                    </div>
                </div>
                <input type="hidden" name="start" value="<%= currentPage %>">
                <input type="hidden" name="limit" value="<%= newRecordsPerPage %>">
                <div class="col-sm-6 col-md-3">
                    <label>Records per page:</label>
                    <select id="recordsPerPage" onchange="changeRecordsPerPage()">
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
                    </select>
                </div>
            </form>
        </div> <!-- Closes the filter-row div -->

					
					
			 <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                          <table class="table table-striped custom-table" id="parentTable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Employee_id</th>
                                        <th>FirstName</th>
                                        <th>LastName</th>
                                        <th>BirthDate</th>
                                        <th>Gender</th>
                                        <th>Address</th>
                                        <th>State</th>
                                        <th>Country</th>
                                        <th>PinCode</th>
                                        <th>PhoneNumber</th>
                                        <th>Department</th>
                                        <th>Designation</th>
                                        <th>ReportsTo</th>
                                   </tr>
                                   
                                </thead>
                               <tbody>
							    <%
							        int start = 0;
							        int limit = 25;
							        String usernameFilter = request.getParameter("username");
							        String idFilter = request.getParameter("id");
							        List<AddProfile> resultSet;
							
							        String whereClause = ""; // Initialize an empty whereClause
							
							        if (usernameFilter != null && !usernameFilter.isEmpty()) {
							            whereClause = "username = '" + usernameFilter + "'";
							        }
							
							        if (idFilter != null && !idFilter.isEmpty()) {
							            if (!whereClause.isEmpty()) {
							                whereClause += " OR ";
							            }
							            whereClause += "Id = '" + idFilter + "'";
							        }
							
							        if (!whereClause.isEmpty()) {
							            // Apply the whereClause condition
							            resultSet = AddProfileImpl.getFilteredProfile(whereClause, start, limit);
							        } else {
							            // Retrieve all data based on the limit
							            resultSet = AddProfileImpl.getFilteredProfile("", start, limit);
							        }
							        for (int i = 0; i < resultSet.size(); i++) {
				                        AddProfile profile = resultSet.get(i);
							    %>
							    
							   
                                   <tr  class="parentRow">
							    <!-- <td> -->
                       	        <td><%= profile.getID() %></td>
							        <td><%= profile.getEmployee_id() %></td>
							        <td><%= profile.getFirstName() %></td>
							        <td><%= profile.getLastName() %></td>
							        <td><%= profile.getBirthDate() %></td>
							        <td><%= profile.getGender() %></td>
							        <td><%= profile.getAddress() %></td>
							        <td><%= profile.getState() %></td>
							        <td><%= profile.getCountry() %></td>
							        <td><%= profile.getPinCode() %></td>
							        <td><%= profile.getPhoneNumber() %></td>
							        <td><%= profile.getDepartment() %></td>
							        <td><%= profile.getDesignation() %></td>
							        <td><%= profile.getReportsTo() %></td>
							        
							        </tr > 
							        <tr class="child">
							        <td></td> <!-- Empty column for consistency with the header -->
                            				<td colspan="12">
                                <!-- Include tables for personal, family, bank, education, emergency, and experience information -->
                                <table class="childTable">
                                    <thead>
                                        <!-- Child table headers for personal information -->
                                        <tr>
                                            <th>ID</th>
                                            <th>Passport No</th>
                                            <th>Passport Expiry Date</th>
                                            <th>Tel</th>
                                            <th>Nationality</th>
                                            <th>Religion</th>
                                            <th>Marital Status</th>
                                            <th>Employment Of Spouse</th>
                                            <th>Number Of Children</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<AddPersonalInformation> personalInformation = AddProfileImpl.getPersonalInformationByEmployee_id(profile.getEmployee_id());
                                            for (AddPersonalInformation personalInfo : personalInformation) {
                                        %>
                                        <tr>
                                            <!-- Child table data for personal information -->
                                            <td><%= personalInfo.getID() %></td>
                                            <td><%= personalInfo.getPassportNo() %></td>
                                            <td><%= personalInfo.getPassportExpiryDate() %></td>
                                            <td><%= personalInfo.getTel() %></td>
                                            <td><%= personalInfo.getNationality() %></td>
                                            <td><%= personalInfo.getReligion() %></td>
                                            <td><%= personalInfo.getMaritalStatus() %></td>
                                            <td><%= personalInfo.getEmploymentOfSpouse() %></td>
                                            <td><%= personalInfo.getNumberOfChildren() %></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>

                               <!-- Include a table for Family Information -->
								  <table class="childTable">
                                <thead>
                                    <!-- <tr> -->
								        <!-- Child table headers for Family Information -->
								        <tr>
								            <th>ID</th>
								            <th>Employee ID</th>
								            <th>Name</th>
								            <th>Relationship</th>
								            <th>Date of Birth</th>
								            <th>Phone</th>
								        </tr>
								    </thead>
								    <tbody>
								        <%
								            List<AddFamilyInformation> familyInformation = AddProfileImpl.getFamilyInformationByEmployee_id(profile.getEmployee_id());
								            for (AddFamilyInformation familyInfo : familyInformation) {
								        %>
								        <tr>
								            <!-- Child table data for Family Information -->
								            <td><%= familyInfo.getID() %></td>
								            <td><%= familyInfo.getEmployee_id() %></td>
								            <td><%= familyInfo.getName() %></td>
								            <td><%= familyInfo.getRelationship() %></td>
								            <td><%= familyInfo.getDateOfBirth() %></td>
								            <td><%= familyInfo.getPhone() %></td>
								        </tr>
								        <%
								            }
								        %>
								    </tbody>
								</table>
								
								<!-- Include a table for Bank Information -->
								
 <table class="childTable">
    <thead>
        <tr>
            <th>ID</th>
            <th>Employee ID</th>
            <th>Full Name</th>
            <th>Bank Name</th>
            <th>Bank Account No</th>
            <th>IFSC Code</th>
            <th>PAN No</th>
        </tr>
    </thead>
    <tbody>
        <%-- Assuming this is Java Server Pages (JSP) code --%>
        <% List<AddBankInformation> bankInfoList = AddProfileImpl.getBankInformationByEmployee_id(profile.getEmployee_id());
           for (AddBankInformation bankInfo : bankInfoList) {
        %>
        <tr>
            <td><%= bankInfo.getID() %></td>
            <td><%= bankInfo.getEmployee_id() %></td>
            <td><%= bankInfo.getFullName() %></td>
            <td><%= bankInfo.getBankName() %></td>
            <td><%= bankInfo.getBankAccountNo() %></td>
            <td><%= bankInfo.getIFSCCode() %></td>
            <td><%= bankInfo.getPANNO() %></td>
        </tr>
        <% } %>
    </tbody>
</table>

								
								<!-- Include a table for Education Information -->
<table class="childTable">
    <thead>
        <!-- Child table headers for Education Information -->
        <tr>
            <th>ID</th>
            <th>Employee ID</th>
            <th>Institution</th>
            <th>Subject</th>
            <th>Starting Date</th>
            <th>Completion Date</th>
            <th>Degree</th>
            <th>Grade</th>
        </tr>
    </thead>
    <tbody>
        <%-- Assuming this is Java Server Pages (JSP) code --%>
        <% List<AddEducationInformation> educationInfoList = AddProfileImpl.getEducationInformationByEmployee_id(profile.getEmployee_id());
           for (AddEducationInformation educationInfo : educationInfoList) {
        %>
        <tr>
            <!-- Child table data for Education Information -->
            <td><%= educationInfo.getID() %></td>
            <td><%= educationInfo.getEmployee_id() %></td>
            <td><%= educationInfo.getInstitution() %></td>
            <td><%= educationInfo.getSubject() %></td>
            <td><%= educationInfo.getStartingDate() %></td>
            <td><%= educationInfo.getCompleteDate() %></td>
            <td><%= educationInfo.getDegree() %></td>
            <td><%= educationInfo.getGrade() %></td>
        </tr>
        <% } %>
    </tbody>
</table>

								
								<!-- Include a table for Emergency Information -->
<table class="childTable">
    <thead>
        <!-- Child table headers for Emergency Information -->
        <tr>
            <th>ID</th>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Relationship</th>
            <th>Phone</th>
            <th>Mobile</th>
        </tr>
    </thead>
    <tbody>
        <%-- Assuming this is Java Server Pages (JSP) code --%>
        <% List<AddEmergencyInformation> emergencyInfoList = AddProfileImpl.getEmergencyInformationByEmployee_id(profile.getEmployee_id());
           for (AddEmergencyInformation emergencyInfo : emergencyInfoList) {
        %>
        <tr>
            <!-- Child table data for Emergency Information -->
            <td><%= emergencyInfo.getID() %></td>
            <td><%= emergencyInfo.getEmployee_id() %></td>
            <td><%= emergencyInfo.getName() %></td>
            <td><%= emergencyInfo.getRelationship() %></td>
            <td><%= emergencyInfo.getPhone() %></td>
            <td><%= emergencyInfo.getMobile() %></td>
        </tr>
        <% } %>
    </tbody>
</table>

                       
                             <!-- Include a table for Experience Information -->
                            <table class="childTable">
                                <thead>
                                    <!-- Child table headers for Experience Information -->
                                    <tr>
                                        <th>ID</th>
                                        <th>Employee ID</th>
                                        <th>Company Name</th>
                                        <th>Location</th>
                                        <th>Job Position</th>
                                        <th>Period From</th>
                                        <th>Period To</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Assuming this is Java Server Pages (JSP) code --%>
                                    <% List<AddExperienceInformation> experienceInfoList = AddProfileImpl.getExperienceInformationByEmployee_id(profile.getEmployee_id());
                                    for (AddExperienceInformation experienceInfo : experienceInfoList) {
                                    %>
                                    <tr>
                                        <!-- Child table data for Experience Information -->
                                        <td><%= experienceInfo.getID() %></td>
                                        <td><%= experienceInfo.getEmployee_id() %></td>
                                        <td><%= experienceInfo.getCompanyName() %></td>
                                        <td><%= experienceInfo.getLocation() %></td>
                                        <td><%= experienceInfo.getJobPosition() %></td>
                                        <td><%= experienceInfo.getPeriodFrom() %></td>
                                        <td><%= experienceInfo.getPeriodTo() %></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <% } %>
                    <!-- Loop ends here -->
                </tbody>
            </table>
        </div>
    </div>
</div>
 </div>
</div>
 

    
		<%-- <script>
        function toggleChildRow(button) {
            const row = button.getAttribute("data-row");
            const childRow = document.querySelector(`.child-row[data-row="${row}"]`);
            if (childRow) {
                childRow.classList.toggle("hidden");
                button.textContent = button.textContent === "+" ? "-" : "+";
            }
        }

        const expandButtons = document.querySelectorAll(".expand-button");
        expandButtons.forEach((button) => {
            button.addEventListener("click", function () {
                toggleChildRow(this);
            });
        });
    </script>
		
		<script>
        var recordsPerPage = <%= recordsPerPage %>; // Use Java variable in JavaScript
        var currentPage = <%= currentPage %>;

        function changeRecordsPerPage() {
            var recordsPerPageSelect = document.getElementById("recordsPerPage");
            var selectedValue = recordsPerPageSelect.value;

            // Update the URL with the selected "recordsPerPage" value and navigate to it
            var baseUrl = window.location.href.split('?')[0];
            var newUrl = baseUrl + '?newRecordsPerPage=' + selectedValue;
            window.location.href = newUrl;
        }
     </script>
     
      --%>
     



     
    </body>
</html>

