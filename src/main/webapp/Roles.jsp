<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.AddRolesDAO" %>
<%@ page import="com.weblabs.beans.AddRolesBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

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
    <title>Leaves - HRMS admin template</title>

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
    
    <!-- Table styles CSS -->
    <link rel="stylesheet" href="css/styles.css">
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
   
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
   
    <title>Leave List</title>
    <style>
#table{
    width:1210px;
    margin-left: 30px;
    border: 2px solid gray;
    }
</style>
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
int newRecordsPerPage = 5; // Default value
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
                    <div class="col">
								<h3 class="page-title">Roles</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
									<li class="breadcrumb-item active">Roles</li>
								</ul>
							</div>
                    <div class="col-auto float-right ml-auto">
                        <a href="#" class="btn add-btn" data-toggle="modal" data-target="#addroles"><i class="fa fa-plus"></i> Add Roles</a>
                        <div class="view-icons">
                            <a href="leaves.jsp" title="Grid View" class="grid-view btn btn-link active"><i class="fa fa-th"></i></a>
                            <a href="leaves-list.jsp" title="Tabular View" class="list-view btn btn-link"><i class="fa fa-bars"></i></a>
                        </div>
                    </div>
                </div>
            </div>
<form action="./LeaveSearchSrv" method="post">
  
            <div class="row filter-row">
               <div  class="col-sm-6 col-md-3">  
				      <div style="width:170px;" class="form-group form-focus">
					   <input name="promotionfor" name="employee" id="employee" type="text" class="form-control floating">
					   <label class="focus-label">promotion for</label>
				     </div>
				</div>
				
                <div class="col-sm-6 col-md-3"> 
				     <div style="width:170px; margin-right:60px;" class="form-group form-focus select-focus">
			            <input class="form-control floating" type="date" value="" name="start_date" id="start_date" placeholder=" ">
			          <label class="focus-label">Promotion Date</label>
			        </div>
			       </div>
                
                 <div class="col-sm-6 col-md-3"> 
				     <div style="width:170px;" class="form-group form-focus select-focus">
			            <input class="form-control floating" type="date" value="" name="end_date" id="end_date" placeholder=" ">
			          <label class="focus-label">Promotion Date</label>
			        </div>
			       </div>
			       
                <div class="col-sm-6 col-md-3">
                 <input class="form-control floating"  style=" color:white; border-radius:5px; height:55px; width:260px; background-color:#FC041F;" type="submit" value="SEARCH">
               </div>
                
                 </div>
                <input type="hidden" name="start" value="<%= currentPage %>">
                <input type="hidden" name="limit" value="<%= newRecordsPerPage %>">
                <div class="col-sm-6 col-md-3">
                    <label>Records per page:</label>
                    <select id="recordsPerPage" onchange="changeRecordsPerPage()">
                        <option value="10">10</option>
                    </select>
                </div>
            </form>
               </div>


        <table id="table" class="table-striped custom-table mb-0 datatable" style="border: 5px solid gray;">
      
                <tr>
                    <th>RoleID</th>
                    <th>RoleName</th>
                    <th>Description</th>
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
                String employeeFilter = request.getParameter("employee");
                String startFilter = request.getParameter("start_date");
                String endFilter = request.getParameter("end_date");
                List<AddRolesBean> leaves;
                String whereClause = ""; // Initialize an empty whereClause

                if (employeeFilter != null && !employeeFilter.isEmpty()) {
                    whereClause = "employee like '%" + employeeFilter +"%'";
                }

                if (startFilter != null && !startFilter.isEmpty()) {
                    if (!whereClause.isEmpty()) {
                        whereClause += " or ";
                    }
                    whereClause += "starting_at = '" + startFilter + "'";
                }

                if (endFilter != null && !endFilter.isEmpty()) {
                    if (!whereClause.isEmpty()) {
                        whereClause += " or ";
                    }
                    whereClause += "ending_on = '" + endFilter + "'";
                    
                } 

              //page
                int recordcount= AddRolesDAO.totalCount();

               noOfPages = (int) Math.ceil((double) recordcount / limit);
               //pagee
                if (!whereClause.isEmpty()) {
                    // Apply the whereClause condition
                    leaves = AddRolesDAO.getFilteredEmployees(whereClause, start, limit);
                } else {
                    // Retrieve all data based on the limit
                    leaves = AddRolesDAO.getFilteredEmployees("", start, limit);
                }

                for (AddRolesBean leave : leaves) {
            %>
                <tr>
                    <td><%=leave.getRoleID() %></td>
                   <td><%=leave.getRoleName()%></td>
                   <td><%=leave.getDescription()%></td>
                           
                    <td>
                        <a href="edit_roles.jsp?RoleID=<%= leave.getRoleID() %>">Edit</a>
                    </td>
                    <td>
                        <a href="DeleteRolesSrv?RoleID=<%= leave.getRoleID() %>">Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            
                        
<style>
body{
color: gray;
}
    .custom-pagination {
        color: white;
        padding: 10px; /* Adjust padding as needed */
        border: 1px solid #fff; /* Adjust border style and color as needed */
        border-radius: 5px; /* Optional: Add rounded corners */
    }

    .custom-pagination a {
        color: white;
        text-decoration: none;
        margin: 0 5px; /* Optional: Adjust spacing between pagination links */
    }

    .custom-pagination a:hover {
        text-decoration: underline;
    }

    .pagination-label {
        background-color: #FC041F;
        padding: 5px; /* Adjust padding as needed */
        border-radius: 5px; /* Optional: Add rounded corners */
    }
    .pagination-number {
        color: black;
        background-color: white; /* Add a background color to enhance visibility if needed */
        padding: 5px; /* Adjust padding as needed */
        border-radius: 5px; /* Optional: Add rounded corners */
        margin: 0 5px; /* Optional: Adjust spacing between numbers */
    }
</style>
  <div class="row justify-content-center align-items-center custom-pagination d-flex justify-content-center" id="flag1">
   
   <!-- Pagination links -->

    <% if (pageno > 1) { %>
        <a href="Roles.jsp?page=<%=pageno - 1%>"><span class="pagination-label">Previous</span></a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%=i%>
        <% } else { %>
            <a href="Roles.jsp?page=<%=i%>"><span class="pagination-number"><%=i%></span></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="Roles.jsp?page=<%=pageno + 1%>"><span class="pagination-label">Next</span></a>
    <% } %>

</div>
            </div> 

            <!-- Add Leave Modal -->
            <jsp:include page="add_roles.jsp" />
            <%-- <jsp:include page="edit_leave.jsp" />
            <jsp:include page="delete_leave.jsp" /> --%>
            <!-- Include your Add Leave Modal HTML here -->

        </div>
   

<!-- JavaScript Libraries and Custom JS -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/app.js"></script>

<script>
    $(document).ready(function () {
        $("#filterButton").click(function () {
            // Get filter criteria (username and id)
            var departmentFilter = $("#username").val();
            var idFilter = $("#id").val();
            
            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./LeaveSearchSrv",
                data: {
                    department: departmentFilter,
                    id: idFilter
                },
                success: function (data) {
                    console.log("myFunction has been invoked.");
                    // Handle the response data, e.g., update the table with the filtered data
                    // You might need to format the data as required
                    $("#employeeTable").html(data);
                }
            });
        });
    });
</script>


</body>
</html>
