<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.HolidayDAO" %>
<%@ page import="com.weblabs.beans.HolidayBean" %>
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
    <meta name="description" content="Smarthr - Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Holidays - HRMS admin template</title>

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
    <!-- table styles CSS -->
    <link rel="stylesheet" href="css/tstyles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
 
    <title>Holiday List</title>
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
					<%-- <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                        Welcome <%= username %>!
                      </div> --%>
						<h3 class="page-title">Holidays</h3>
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
							<li class="breadcrumb-item active">Holidays</li>
						</ul>
					</div>
                        <div class="col-auto float-right ml-auto">
                            <a href="#"  class="Addbutton" data-toggle="modal" data-target="#addholiday"><i class="fa fa-plus"></i> Add Holiday</a>
                            <!-- <div class="view-icons">
                                <a href="holidays.jsp" title="Grid View" class="grid-view btn btn-link active"><i class="fa fa-th"></i></a>
                                <a href="holidays-list.jsp" title="Tabular View" class="list-view btn btn-link"><i class="fa fa-bars"></i></a>
                            </div> -->
                        </div>
                    </div>
                   
                </div>

                <!-- Search form -->
                <form action="./HolidaySearchSrv" method="post" > 		
                 <div class="row filter-row">
                 
                   <div class="col-sm-6 col-md-3"  id="flag">
			       <label>Records per page:</label>
			       <select id="recordsPerPage" onchange="changeRecordsPerPage()">					    
					    <option value="10">10</option>					    
					</select>					
			       </div>	
			       
                    <div class="col-sm-6 col-md-3">
                        <div class="custom-input-field form-group form-focus d-flex align-items-center">
                            <label>Holiday Name:</label>
                            <input class="input" type="text" name="holiday_name" id="holiday_name">
                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-md-3">
                        <div class="custom-input-field form-group form-focus d-flex align-items-center">
                            <label> ID:</label>
                            <input class="input" type="text" name="id" id="id">
                        </div>
                    </div>
                    
                    <div class="col-sm-6 col-md-3">
				    <input class="search" type="submit" value="SEARCH">
				</div>
                </div>
                 <input type="hidden"  name="start" value="<%= currentPage %>">
       	 			<input type="hidden"  name="limit" value="<%= newRecordsPerPage %>">
       	 			
	          
			        </form> 
			         </div> 
                <table id="table" style="margin-left: 30px;width:1200px;"  class="table-striped custom-table mb-0 datatable">
                    <tr>
                        <th>ID</th>
                        <th>Holiday Name</th>
                        <th>Holiday Date</th>
                        <th style="text-align: center;" colspan="2">Actions</th>
                        
                        
                    </tr> 
              <%
                         // int start = 0;
                       //   int limit = 25;
                       
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
		                
                        String holidayNameFilter = request.getParameter("holiday_name");
                        String idFilter = request.getParameter("id");
                        
                        
                        
                        List<HolidayBean> holidays;

                        String whereClause = "";

                        if (holidayNameFilter != null && !holidayNameFilter.isEmpty()) {
                            whereClause = "Holiday_Name like  '%" + holidayNameFilter + "%'";
                        }

                        if (idFilter != null && !idFilter.isEmpty()) {
                            if (!whereClause.isEmpty()) {
                                whereClause += " or ";
                            }
                            whereClause += "Id = '" + idFilter + "'";
                        }

                      //page
                        int recordcount= HolidayDAO.totalCount();

                       noOfPages = (int) Math.ceil((double) recordcount / limit);
                       //pagee
                        if (!whereClause.isEmpty()) {
                            holidays = HolidayDAO.getFilteredHolidays(whereClause, start, limit);
                        } else {
                            holidays = HolidayDAO.getFilteredHolidays("", start, limit);
                        }
                        for (HolidayBean holiday : holidays) {
                    %>
                    <tr>
                        <td><%= holiday.getId() %></td>
                        <td><%= holiday.getHoliday_Name() %></td>
                        <td><%= holiday.getHoliday_Date() %></td>
                        <td>
                            <a class="edit" href="update-holiday.jsp?id=<%= holiday.getId() %>">Edit</a>
                         </td>
                         <td>
                            <a class="delete" href="DeleteHolidaySrv?id=<%= holiday.getId() %>">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %> 
                </table> 
                
<div class="row justify-content-center align-items-center custom-pagination d-flex justify-content-center" id="flag1">
   
   <!-- Pagination links -->

    <% if (pageno > 1) { %>
        <a href="holidays.jsp?page=<%=pageno - 1%>"><span class="pagination-label">Previous</span></a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
          <span class="pagination-number active"><%=i%></span>
        <% } else { %>
            <a href="holidays.jsp?page=<%=i%>"><span class="pagination-number"><%=i%></span></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="holidays.jsp?page=<%=pageno + 1%>"><span class="pagination-label">Next</span></a>
    <% }} %>

</div>
            </div>
       
  

      

    <!-- Add Holiday Modal -->
    <jsp:include page="addholiday.jsp" />

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
  
<%-- <script>
$(document).ready(function () {
    // Attach the changeRecordsPerPage function to the change event of the recordsPerPage select
    $("#recordsPerPage").change(function () {
        changeRecordsPerPage();
    });

    $("#filterButton").click(function (event) {
        // Get filter criteria (username and id)
        event.preventDefault();
        var usernameFilter = $("#holiday_name").val();
        var idFilter = $("#id").val();
        
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
                $("#employeeTable").html(data);
            }
        });
    });

    // Function to change records per page
    function changeRecordsPerPage() {
        var recordsPerPageSelect = $("#recordsPerPage");
        var selectedValue = recordsPerPageSelect.val();

        var form = $("<form>")
            .attr("method", "POST")
            .attr("action", "./HolidaySearchSrv");

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
    var initialResultCount = (parseInt('<%= request.getAttribute("holiday") %>') == 'null') ? -1 : parseInt('<%= request.getAttribute("holiday") %>');
    console.log(initialResultCount);
    updateFooterVisibility(initialResultCount);
</script>
   
</body>
</html>


