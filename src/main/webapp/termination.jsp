<%@ page import="com.weblabs.service.impl.TerminationDAO" %>
<%@ page import="com.weblabs.beans.AddTermination" %>
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
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr - Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Termination - HRMS admin template</title>

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
    <link rel="stylesheet" href="css/M.css">
    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/tstyles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
   
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    
    <title>Termination List</title>
</head>
<body>
<%
HttpSession sessionRec = request.getSession(true);

// Initialize recordsPerPage and currentPage as Java variables
String recordsPerPageStr = (String) sessionRec.getAttribute("recordsPerPage");
String currentPageStr = (String) sessionRec.getAttribute("currentPage");

if (recordsPerPageStr == null || "0".equals(recordsPerPageStr)) {
    recordsPerPageStr = "5"; // Set a default value, e.g., 1
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

<!-- Main Wrapper -->
<div class="main-wrapper">

    <!-- Header -->
    <jsp:include page="header.jsp" />
    <!-- Include your header HTML here -->

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />
    <!-- Include your sidebar HTML here -->

    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <!-- Page Content -->
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center">
                <div class="col">
               <%--  <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                        Welcome <%= username %>!
                      </div> --%>
             
                        <h3 class="page-title">Termination</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Termination</li>
                        </ul>
                    </div>
                    <div class="col-auto float-right ml-auto">
                        <a href="#" class="Addbutton" data-toggle="modal" data-target="#add_termination"><i class="fa fa-plus"></i> Add Termination</a>
                    </div>
                </div>
            </div>

            <!-- Search form -->
            <form action="./TerminationSearchSrv" method="post">
                <div class="row filter-row">
                
                <div class="col-sm-6 col-md-3" id = "flag">
                    <label>Records per page:</label>
                    <select id="recordsPerPage" onchange="changeRecordsPerPage()">
                        <option value="10">10</option>                      
                    </select>
                </div>
                
                    <div class="col-sm-6 col-md-3">
                        <div class="custom-input-field form-group form-focus d-flex align-items-center">
                            <label>TerminatedEmployee:</label>
                            <input class="input" type="text" name="terminatedemployee" id="terminatedemployee">
                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-md-3">
                       <div class="custom-input-field form-group form-focus d-flex align-items-center">
                            <label>TerminationDate:</label>
                            <input class="input" type="text" name="terminationdate" id="terminationdate">
                        </div>
                    </div>
                    
                   <div class="col-sm-6 col-md-3">
				    <input class="search" type="submit" value="SEARCH">
				   </div>
                </div>
                <input type="hidden" name="start" value="<%= currentPage %>">
                <input type="hidden" name="limit" value="<%= newRecordsPerPage %>">
                
            </form>
       

         <table class="table" id="tab"  class="table-striped custom-table mb-0 datatable">
            <tr>
                <th>Id</th>
                <th>TerminatedEmployee</th>
                <th>TerminationType</th>
                <th>TerminationDate</th>
                <th>Reason</th>
                <th>NoticeDate</th>
                <th style="text-align: center;" colspan="2">Actions</th>
            </tr>
            <%
                //int start = 0;
                //int limit = 25;
                int start = currentPage;
                int limit = newRecordsPerPage;

                //pagenation code start
                int pageno = 1;
                int noOfPages = 0;

                String pageNoStr = request.getParameter("page");

                if (pageNoStr != null) {
                    pageno = Integer.parseInt(pageNoStr);
                }

                start = (pageno - 1) * limit;
                //pagenation code ended

                String terminatedempnameFilter = request.getParameter("terminatedemployee");
                String dateFilter = request.getParameter("terminationdate");
                List<AddTermination> trainers;

                String whereClause = ""; // Initialize an empty whereClause

                if (terminatedempnameFilter != null && !terminatedempnameFilter.isEmpty()) {
                    whereClause = "terminatedemployee like '%" + terminatedempnameFilter + "%'";
                }

                if (dateFilter != null && !dateFilter.isEmpty()) {
                    if (!whereClause.isEmpty()) {
                        whereClause += " or ";
                    }
                    whereClause += "terminationdate = '" + dateFilter + "'";
                }
                //page
                int recordcount = TerminationDAO.totalCount();

                noOfPages = (int) Math.ceil((double) recordcount / limit);
                //pagee

                if (!whereClause.isEmpty()) {
                    // Apply the whereClause condition
                    trainers = TerminationDAO.getFilteredTermination(whereClause, start, limit);
                } else {
                    // Retrieve all data based on the limit
                    trainers = TerminationDAO.getFilteredTermination("", start, limit);
                }
                for (AddTermination train : trainers) {
            %>
            <tr>
                <td><%= train.getId() %></td>
                <td><%= train.getTerminatedEmployee() %></td>
                <td><%= train.getTerminationType() %></td>
                <td><%= train.getTerminationDate()%></td>
                <td><%= train.getReason()%></td>
                <td><%=train.getNoticeDate()%></td>
                <td>
                    <a class="edit" href="edit_termination.jsp?id=<%= train.getId() %>">Edit</a>
                </td>
                <td>
                    <a class="delete" href="DeleteTerminationSrv?id=<%= train.getId() %>">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <div class="row justify-content-center align-items-center custom-pagination d-flex justify-content-center" id="flag1">

            <!-- Pagination links -->
            <% if (pageno > 1) { %>
            <a href="termination.jsp?page=<%=pageno - 1%>"><span class="pagination-label">Previous</span></a>
            <% } %>

            <% for (int i = 1; i <= noOfPages; i++) { %>
            <% if (i == pageno) { %>
            <span class="pagination-number active"><%=i%></span>
            <% } else { %>
            <a href="termination.jsp?page=<%=i%>"><span class="pagination-number"><%=i%></span></a>
            <% } %>
            <% } %>

            <% if (pageno < noOfPages) { %>
            <a href="termination.jsp?page=<%=pageno + 1%>"><span class="pagination-label">Next</span></a>
            <% }} %>

        </div>
    </div>

    <!-- /Page Content -->

    <!-- Add Promotion Modal -->
    <jsp:include page="add_termination.jsp" />
    <!-- /Add Promotion Modal -->
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

<!-- Datatable JS -->
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap4.min.js"></script>

<!-- Custom JS -->
<script src="js/app.js"></script>

<!-- <script>
    $(document).ready(function () {
        $("#filterButton").click(function () {
            // Get filter criteria (username and id)
            var usernameFilter = $("#terminatedemployee").val();
            var idFilter = $("#terminationdate").val();

            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./TerminationSearchSrv",
                data: {
                    username: usernameFilter,
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
</script> -->

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
    var initialResultCount = (parseInt('<%= request.getAttribute("termination") %>') == 'null') ? -1 : parseInt('<%= request.getAttribute("termination") %>');
    console.log(initialResultCount);
    updateFooterVisibility(initialResultCount);
</script>
</body>
</html>
