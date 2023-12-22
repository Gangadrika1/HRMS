<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.HolidayDAO" %>
<%@ page import="com.weblabs.beans.HolidayBean" %>
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
   
     
    <style>
#table{
    width:1210px;
    margin-left: 30px;
    border:2px;
    }
</style>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
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
								<h3 class="page-title">All Holidays </h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Holidays</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_holiday"><i class="fa fa-plus"></i> Add Holiday</a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<form action="./HolidaySearchSrv" method="post" > 
				   <div class="row filter-row">
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus">
                            <input name="holiday_name" type="text" class="form-control floating" id="holiday_name">
					       <label class="focus-label">Holiday Name</label>
			               </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus select-focus">
                           <input class="form-control floating" type="date" value="" name="id" id="id" >
			          <label class="focus-label">ID</label>
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
		</div> 			
	 		
	       <table class="table table-striped custom-table mb-0 datatable" style="border: 2px solid black;">
   
				   <!--   <tr>
				    <th>ID</th>
				    <th style="width: 180px;">Holiday Name</th>
				    <th style="width: 200px;">Holiday Date</th>
				   <th style="text-align: center; width: 200px;" colspan="2">Actions</th>

				   </tr> -->
				   
				   <tr>
				    <th>ID</th>
				    <th>Holiday Name</th>
				    <th>Holiday Date</th>
				   <th style="text-align: center; width: 200px;" colspan="2">Actions</th>

				   </tr> 

 
 
                     <%
                          int start = 0;
                          int limit = 25;
                       
                      
                     //pagenation code start
           		    int pageno = 1;
           		    int noOfPages =0;
           		   
           		     String pageNoStr = request.getParameter("page");
           		     
           		     if (pageNoStr != null) {
           		         pageno = Integer.parseInt(pageNoStr);
           		     }

           		     
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
                            <a style="color: Blue;" href="update-holiday.jsp?id=<%= holiday.getId() %>">Edit</a>
                             &nbsp;  &nbsp;  &nbsp;    
                           </td>
                            <!-- &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;   -->
                            <td>
                            <a style="color: Blue;" href="DeleteHolidaySrv?id=<%= holiday.getId() %>">Delete</a>
                        </td>
                    </tr>
									
									 <%
									 }
                    %> 
                </table> 
							<!-- </div>
						</div>
					</div>
                </div> -->
				<!-- /Page Content -->
				
				 <!-- Add Holiday Modal -->
                  <jsp:include page="addholiday.jsp" />
				
            </div>
			<!-- /Page Wrapper -->
			
        </div>
		<!-- /Main Wrapper -->
		
		
		
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
		
    </body>
</html>