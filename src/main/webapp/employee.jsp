<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>

<%
HttpSession sdsession = request.getSession(true);

// Retrieve the username attribute from the session
String username = (String) sdsession.getAttribute("username");
String roleIDString = (String) sdsession.getAttribute("RoleID");
// Check if the user is logged in or redirect to the login page
if (roleIDString == null) {
response.sendRedirect("login.jsp"); // Change "login.jsp" to your actual login page
} else {
   int roleid = Integer.parseInt(roleIDString);

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
    <title>Employees - HRMS admin template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">

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
     <link rel="stylesheet" href="css/tstyles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    
    <title>Employee List</title>
</head>
<body>
<%
HttpSession sessionRec = request.getSession(true);

//Initialize recordsPerPage and currentPage as Java variables
String recordsPerPageStr = (String) sessionRec.getAttribute("recordsPerPage");
String currentPageStr = (String) sessionRec.getAttribute("currentPage");

if (recordsPerPageStr == null || "0".equals(recordsPerPageStr)) {
 recordsPerPageStr = "10"; // Set a default value, e.g., 1
 sessionRec.setAttribute("recordsPerPage", recordsPerPageStr);
}
int recordsPerPage = Integer.parseInt(recordsPerPageStr);

if (currentPageStr == null || "0".equals(currentPageStr)) {
 currentPageStr = "1"; // Set a default value, e.g., 1
 sessionRec.setAttribute("currentPage", currentPageStr);
}
int currentPage = Integer.parseInt(currentPageStr);

//Handle the change in recordsPerPage here
int newRecordsPerPage = 10; // Default value
String newRecordsPerPageParam = request.getParameter("newRecordsPerPage");
if (newRecordsPerPageParam != null) {
 newRecordsPerPage = Integer.parseInt(newRecordsPerPageParam);
 sessionRec.setAttribute("recordsPerPage", String.valueOf(newRecordsPerPage));
 //currentPage = 1; // Reset to the first page when changing recordsPerPage
 //sessionRec.setAttribute("currentPage", "1");
}

%>
<script>
 var recordsPerPage = <%= newRecordsPerPage %>; // Use Java variable in JavaScript
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



<!-- Your HTML content, including the table and pagination controls -->
<div class="content container-fluid">
    <!-- Your page content remains the same -->
 
 <!-- Main Wrapper -->
    <div class="main-wrapper">

        <!-- Header -->
         <jsp:include page="header.jsp" />

        <!-- Sidebar -->
		<jsp:include page="sidebar.jsp" />
	   <!-- Page Wrapper -->
        <div class="page-wrapper">
          <!-- Page Content -->
            <div class="content container-fluid">
               <!-- Page Header -->
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                                Welcome <%= username %>😊😊
                              </div>
                            <div class="col">
								<h3 class="page-title">Employee</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">employee</li>
								</ul>
							</div>
                        </div>
                         <div class="col-auto float-right ml-auto">
<!--                         <a href="#" class="btn add-btn" data-toggle="modal" data-target="#deleteEmployee"><i class="fa fa-plus"></i>Delete </a> -->
<!--                                 <a href="#" class="btn add-btn" data-toggle="modal" data-target="#editEmployee"><i class="fa fa-plus"></i>Edit </a> -->
                             	<a href="#" class="btn add-btn" data-toggle="modal" data-target="#addemployee"><i class="fa fa-plus"></i> Add Employee</a><div class="view-icons">
                                <!-- <a href="employee.jsp" title="Grid View" class="grid-view btn btn-link active"><i class="fa fa-th"></i></a>
                                <a href="employees-list.jsp" title="Tabular View" class="list-view btn btn-link"><i class="fa fa-bars"></i></a>
                          -->   </div>
                        </div>
                        </div>
                        </div>
          <!-- Search form -->

     	<form action="./EmployeeSearchServlet" method="post" >
  		    <div style="margin-left:3px;" class="row filter-row">
			    <div class="col-sm-6 col-md-3">
			      <div class="form-group form-focus">
                	<label for="username">Username:</label>
			        <input type="text" name="username" id="username" >
			       </div>
			    </div>
			    
			    <div class="col-sm-6 col-md-3"> 
			      <div class="form-group form-focus select-focus">
                    <label for="id">Employee_ID:</label>
			        <input type="text" name="Employee_Id" id="id">
			     </div>
			    </div>
			    <div class="col-sm-6 col-md-3">
                        <input type="submit" value="Search">
                    </div>
                </div>
			     <input type="hidden"  name="start" value="<%= currentPage %>">
       	 			<input type="hidden"  name="limit" value="<%= newRecordsPerPage %>">
	          <div class="col-sm-6 col-md-3" id = "flag" >
			       <label>Records per page:</label>
			       <select id="recordsPerPage" onchange="changeRecordsPerPage()">
					    
					    <option value="10">10</option>
					  
					</select>
				
			       </div>
			        </form> 
			         </div> 
			          <div class="table-container" style="height: 400px; overflow-y: auto;">
     
	         <table>
        <tr>
            <!-- <th>Employee ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
            <th>Email</th>
        
            <th>Phone</th>
            <th>Department</th>
            <th>Designation</th>
            <th>Edit</th>
            <th>Delete</th>
             -->
            
             <th>Employee ID</th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Username</th>
      <th>Email</th>
      <th>Phone</th>
      <th>Joining Date</th>
      <th>Gender</th>
      <th>Location</th>
      <th>PAN</th>
      <th>PF</th>
      <th>PF No</th>
      <th>UAN</th>
      <th>VPF</th>
      <th>ESI</th>
      <th>Department </th>
      <th>Designation </th>
      <th>Edit</th>
      <th>Delete</th>
      
        </tr>
        <%
     
		int start = currentPage ;
        int limit = newRecordsPerPage;
        
        
        //pagenation code start
		    int pageno = 1;
		    int noOfPages =0;
		   
		     String pageNoStr = request.getParameter("page");
		     
		     if (pageNoStr != null) {
		         pageno = Integer.parseInt(pageNoStr);
		     }

		      start = (pageno - 1) * limit;
		     //pagenation code ended
          

            String usernameFilter = request.getParameter("username");
            String idFilter = request.getParameter("Employee_Id");
        
            	
		    List<EmployeeBean> employees;
          
		    String whereClause = ""; // Initialize an empty whereClause

            if (usernameFilter != null && !usernameFilter.isEmpty()) {
                whereClause = "username like  '%"+ usernameFilter + "%'";
            }

            if (idFilter != null && !idFilter.isEmpty()) {
                if (!whereClause.isEmpty()) {
                    whereClause += " or ";
                }
                whereClause += "Employee_Id = '" + idFilter + "'";
            }
            
          //page
            int recordcount= EmployeeDAO.totalCount();

           noOfPages = (int) Math.ceil((double) recordcount / limit);
           //pagee
          

            if (!whereClause.isEmpty()) {
                // Apply the whereClause condition
                employees = EmployeeDAO.getFilteredEmployees(whereClause, start, limit);
            } else {
                // Retrieve all data based on the limit
                employees = EmployeeDAO.getFilteredEmployees("", start, limit);
            }
            for (EmployeeBean employee : employees) {
        %>
        <tr>
           <td><%= employee.getEmployee_ID() %></td>
    <td><%= employee.getFirstName() %></td>
    <td><%= employee.getLastName() %></td>
    <td><%= employee.getUsername() %></td>
    <td><%= employee.getEmail() %></td>
    <td><%= employee.getPhone() %></td>
    <td><%= employee.getJoining_Date() %></td>
    <td><%= employee.getGender() %></td>
    <td><%= employee.getLocation() %></td>
    <td><%= employee.getPAN() %></td>
    <td><%= employee.getPF() %></td>
    <td><%= employee.getPf_No()%></td>
    <td><%= employee.getUAN() %></td>
    <td><%= employee.getVPF() %></td>
    <td><%= employee.getESI() %></td>
    <td><%= employee.getDepartment()%></td>
    <td><%= employee.getDesignation() %></td>
             <td>
        <a href="editEmployee.jsp?id=<%= employee.getEmployee_ID()%>">Edit</a>
    </td>
		    <td>
		 
		 <a href="DeleteEmployeeSrv?id=<%= employee.getEmployee_ID()%>">Delete</a>
		 
		    </td>
		</tr>
		       
		        <%
		            }
		        %>
    </table>
    </div>
    
    <div class="row justify-content-center align-items-center" id = "flag1">
    <!-- Pagination links -->

    <%-- <% if (pageno > 1) { %>
        <a href="employee.jsp?page=<%=pageno - 1%>&recordsPerPage=<%= recordsPerPage %>">Previous</a>
        
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%=i%>
        <% } else { %>
            <a href="employee.jsp?page=<%=i%>"><%=i%></a>
            
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="employee.jsp?page=<%=pageno + 1%>&recordsPerPage=<%= recordsPerPage %>">Next</a>
    <% } }%>
    --%>
    
     <% if (pageno > 1) { %>
        <a href="employee.jsp?page=<%=pageno - 1%>">Previous</a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%= i %>
        <% } else { %>
            <a href="employee.jsp?page=<%=i%>"><%="&nbsp;&nbsp;&nbsp;" + i + "&nbsp;&nbsp;"%></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="employee.jsp?page=<%=pageno + 1%>">Next</a>
    <% } }%>
   </div>
</div>
</div>
  <!-- Add Employee Modal -->
     <jsp:include page="addemployee.jsp" />
     <!-- Include your Add Employee Modal HTML here -->
    
    <!-- Include your Add Holiday Modal HTML here -->
     </div>

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

    <!-- Custom JS -->
    <script src="js/app.js"></script>
    
    <!--  <!-- Custom JS -->
    <script src="js/validateForm.js"></script> -->
  
<%-- <script>
$(document).ready(function () {
    // Attach the changeRecordsPerPage function to the change event of the recordsPerPage select
    $("#recordsPerPage").change(function () {
        changeRecordsPerPage();
    });

    $("#filterButton").click(function (event) {
        // Get filter criteria (username and id)
        event.preventDefault();
        var usernameFilter = $("#username").val();
        var idFilter = $("#Employee_Id").val();
        
        // Make an AJAX request to the server
        $.ajax({
            type: "POST", // Use POST or GET depending on your servlet configuration
            url: "./EmployeeSearchServlet",
            data: {
                username: usernameFilter,
                id: idFilter
            },
            success: function (data) {
                console.log("myFunction has been invoked.");
                // Handle the response data, e.g., update the table with the filtered data
                // You might need to format the data as required
                $("#holidaysTable").html(data);
            }
        });
    });

    // Function to change records per page
    function changeRecordsPerPage() {
        var recordsPerPageSelect = $("#recordsPerPage");
        var selectedValue = recordsPerPageSelect.val();

        var form = $("<form>")
            .attr("method", "POST")
            .attr("action", "./EmployeeSearchServlet");

        var inputRecordsPerPage = $("<input>")
            .attr("type", "hidden")
            .attr("name", "newRecordsPerPage")
            .val(selectedValue);

        var inputCurrentPage = $("<input>")
            .attr("type", "hidden")
            .attr("name", "start")
            .val("<%= currentPage %>");

        form.append(inputRecordsPerPage, inputCurrentPage);
        $("body").append(form);
        form.submit();
    }
});
</script> --%>

<script>
   
    
    function updateFooterVisibility(resultCount) {
        var dropdown = document.getElementById("flag1");
        var dropdown1=document.getElementById("flag");
        // Set the visibility based on the result count
        if(resultCount==-1)
        	{
        		dropdown.style.display = "block";
        		dropdown1.style.display = "block";
        	}
        if (resultCount < 4) {
            dropdown.style.display = "none"; // Hide the dropdown
            dropdown1.style.display = "none";
        } else {
            dropdown.style.display = "block"; // Show the dropdown
            dropdown1.style.display = "block";
        }
    }
    // Update dropdown visibility on page load
    var initialResultCount = (parseInt('<%= request.getAttribute("employee") %>') == 'null') ? -1 : parseInt('<%= request.getAttribute("employee") %>');
    console.log(initialResultCount);
    updateFooterVisibility(initialResultCount);
</script>
</body>
</html>