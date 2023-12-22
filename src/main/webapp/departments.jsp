<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.DepartmentDAO" %>
<%@ page import="com.weblabs.beans.AddDepartment" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr- Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Departments - HRMS admin template</title>

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
    
    <style>
#table{
    width:1210px;
    margin-left: 30px;
    border:2px;
    }
</style>
   
   
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
   
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    
    <title>Department List</title>
</head>
<body>
<%
HttpSession sessionRec = request.getSession(true);

// Initialize recordsPerPage and currentPage as Java variables
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

// Handle the change in recordsPerPage here
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

<!-- Main Wrapper -->
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
                <div class="row align-items-center">
                <div style= margin-left:30px; class="col">
                    <h3 class="page-title">Departments</h3>
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
							<li class="breadcrumb-item active">Departments</li>
						</ul>
                   </div>
                   
                    <div class="col-auto float-right ml-auto">
                        <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_department"><i class="fa fa-plus"></i> Add Department</a>
                           </div>
			              </div>
			            </div>

           
            <form action="./DepartmentSearchSrv" method="post">
                <div class="row filter-row">
                    <div class="col-sm-6 col-md-3">  
				<div style= margin-left:30px; class="form-group form-focus">
					<input  name="DepartmentName" type="text" class="form-control floating" id="department">
					<label class="focus-label">Department</label>
				</div>
				</div>
				
				<div class="col-sm-6 col-md-3"> 
				<div class="form-group form-focus select-focus">
			            <input class="form-control floating" type="date" value="" name="DepartmentId" id="date" >
			          <label class="focus-label">StarDate</label>
			        </div>
			    </div>
                   <div class="col-sm-6 col-md-3" >
                 <input class="form-control floating"  style=" color:white; border-radius:5px; height:55px; width:260px; background-color:#55ce63;" type="submit" value="SEARCH">
               </div>
              
                <input type="hidden" name="start" value="<%= currentPage %>">
                <input type="hidden" name="limit" value="<%= newRecordsPerPage %>">
                <div class="col-sm-6 col-md-3" id = "flag">
                    <label>Records per page:</label>
                    <select id="recordsPerPage" onchange="changeRecordsPerPage()">
                        
                        <option value="10">10</option>
                       
                    </select>
                </div>
            </form>
        </div> <!-- Closes the filter-row div -->

        <!-- Department List Table -->
        <table  id ="table" class="table table-striped custom-table mb-0 datatable" style="border: 2px solid black;">
        
            <tr>
                <th>ID</th>
                <th>Department</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <%
                //int start = 0;
                //int limit = 25;
                
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
                
                String departmentFilter = request.getParameter("DepartmentName");
                String idFilter = request.getParameter("DepartmentId");
                List<AddDepartment> departments;

                String whereClause = ""; // Initialize an empty whereClause

                if (departmentFilter != null && !departmentFilter.isEmpty()) {
                    whereClause = "DepartmentName like  '%" + departmentFilter + "%'";
                }

                if (idFilter != null && !idFilter.isEmpty()) {
                    if (!whereClause.isEmpty()) {
                        whereClause += " or ";
                    }
                    whereClause += "DepartmentId = '" + idFilter + "'";
                }
              //page
                int recordcount= DepartmentDAO.totalCount();

               noOfPages = (int) Math.ceil((double) recordcount / limit);
               //pagee
                if (!whereClause.isEmpty()) {
                    // Apply the whereClause condition
                    departments = DepartmentDAO.getFilteredDepartments(whereClause, start, limit);
                } else {
                    // Retrieve all data based on the limit
                    departments = DepartmentDAO.getFilteredDepartments("", start, limit);
                }
                for (AddDepartment department : departments) {
            %>
            <tr>
                <td><%= department.getId() %></td>
                <td><%= department.getDepartmentName() %></td>
                <td>
                    <a href="edit_department.jsp?DepartmentId=<%= department.getId() %>">Edit</a>
                    &nbsp;  &nbsp;  &nbsp;  
                </td>
                <td>
                    <a href="DeleteDepartmentSrv?DepartmentId=<%= department.getId() %>">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    <div class="row justify-content-center align-items-center" id = "flag1">
   
   <!-- Pagination links -->

    <% if (pageno > 1) { %>
        <a href="departments.jsp?page=<%=pageno - 1%>">Previous</a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%=i%>
        <% } else { %>
            <a href="departments.jsp?page=<%=i%>"><%=i%></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="departments.jsp?page=<%=pageno + 1%>">Next</a>
    <% } %>

</div>
    </div> <!-- Closes the content container-fluid div -->

    <!-- Add Department Modal -->
    <jsp:include page="add_department.jsp" />
    <%-- <jsp:include page="edit_department.jsp" />
    <jsp:include page="delete_department.jsp" /> --%>
    <!-- Include your Add Department Modal HTML here -->

</div> <!-- Closes the page-wrapper div -->

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
    var initialResultCount = (parseInt('<%= request.getAttribute("department") %>') == 'null') ? -1 : parseInt('<%= request.getAttribute("department") %>');
    console.log(initialResultCount);
    updateFooterVisibility(initialResultCount);
</script>

</body>
</html>
