<%@ page import="com.weblabs.service.impl.PromotionDAO" %>
<%@ page import="com.weblabs.beans.AddPromotion" %>
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
        <title>Promotion - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        
		<link rel="stylesheet" href="css/Modifying.css">
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="css/line-awesome.min.css">
		<link rel="stylesheet" href="css/M.css">
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="css/select2.min.css">
		
		<!-- Datetimepicker CSS -->
		<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">
		
		<!-- Datatable CSS -->
		<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
      
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
	
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
								<h3 class="page-title">Promotion</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
									<li class="breadcrumb-item active">Promotion</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="Addbutton" data-toggle="modal" data-target="#add_promotion"><i class="fa fa-plus"></i> Add Promotion</a>
							</div>
						</div>
					</div>
					
					  <!-- Search form -->
            <form action="./PromotionSearchSrv" method="post">
                <div class="row filter-row">
                
                <div class="col-sm-6 col-md-3" id = "flag">
                 <label>Records per page:</label>
			       <select class="record" id="recordsPerPage" onchange="changeRecordsPerPage()">
					    <option value="10">10</option>
					</select>
			    </div>
			    
                     <div class="col-sm-6 col-md-3">  
					 <div class="custom-input-field form-group form-focus d-flex align-items-center">
					     <label style="margin-right:5px;" for="ItemName">promotion For</label>
					        <input  class="input" id="promotionfor" name="promotionfor" type="text" class="form-control floating">
					  
					    </div>
					</div>
				
				<div class="col-sm-6 col-md-3"> 
				    <div class="custom-input-field form-group form-focus d-flex align-items-center">
				    <label>Promotion Date</label>
				        <input class="input" class="form-control floating" type="date" value="" name="promotiondate" id="promotiondate" placeholder=" ">			        
				    </div>
				</div>

			       
               <div class="col-sm-6 col-md-3">
				    <input class="search" type="submit" value="SEARCH">
				</div>

              
                
                <input type="hidden" name="start" value="<%= currentPage %>">
                <input type="hidden" name="limit" value="<%= newRecordsPerPage %>">
             
                </div>
             </form>
            
        </div>
			
					  <table class="table" id="tab"  class="table-striped custom-table mb-0 datatable">
						<tr>
							<th>Id</th>
				            <th>PromotionFor </th>
							<th>PromotionFrom</th>
						    <th>PromotionTo </th>
							<th>PromotionDate</th>
													
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


            String promotionforFilter = request.getParameter("promotionfor");
            String dateFilter = request.getParameter("promotiondate");
            List<AddPromotion> trainers;

            String whereClause = ""; // Initialize an empty whereClause

            if (promotionforFilter != null && !promotionforFilter.isEmpty()) {
                whereClause = "promotionfor like '%" + promotionforFilter + "%'";
            }

            if (dateFilter != null && !dateFilter.isEmpty()) {
                if (!whereClause.isEmpty()) {
                    whereClause += " or ";
                }
                whereClause += "promotiondate = '" + dateFilter + "'";
            }
            //page
            int recordcount = PromotionDAO.totalCount();

            noOfPages = (int) Math.ceil((double) recordcount / limit);
            //pagee

            if (!whereClause.isEmpty()) {
                // Apply the whereClause condition
                trainers = PromotionDAO.getFilteredPromotion(whereClause, start, limit);
            } else {
                // Retrieve all data based on the limit
                trainers = PromotionDAO.getFilteredPromotion("", start, limit);
            }
            for (AddPromotion train : trainers) {
        %>
        <tr>
           
            <td><%= train.getId() %></td>
            <td><%= train.getPromotionFor() %></td>
            <td><%= train.getPromotionFrom() %></td>
            <td><%= train.getPromotionTo()%></td>
            <td><%= train.getPromotionDate()%></td>
          
     <td>
        <a class="edit" href="edit_promotion.jsp?id=<%= train.getId() %>">Edit</a>
    </td>

    <td>
        <a class="delete" href="DeletePromotionSrv?id=<%= train.getId() %>">Delete</a>
    
    </td>

</tr>
       
        <%
            }
        %>
		   </table>					
			<div class="row justify-content-center align-items-center custom-pagination d-flex justify-content-center" id="flag1">
			<!-- Pagination links -->
            <% if (pageno > 1) { %>
           <a href="promotion.jsp?page=<%=pageno - 1%>"><span class="pagination-label">Previous</span></a>
            <% } %>

            <% for (int i = 1; i <= noOfPages; i++) { %>
            <% if (i == pageno) { %>
             <span class="pagination-number active"><%=i%></span>
            <% } else { %>
            <a href="promotion.jsp?page=<%=i%>"><span class="pagination-number"><%=i%></span></a>
            <% } %>
            <% } %>

            <% if (pageno < noOfPages) { %>
            <a href="promotion.jsp?page=<%=pageno + 1%>"><span class="pagination-label">Next</span></a>
            <% } %>

        </div>
    </div>
				<!-- /Page Content -->
				
				<!-- Add Promotion Modal -->
					<jsp:include page="add_promotion.jsp" />
				<!-- /Add Promotion Modal -->
				
					
				
			<%-- 	<!-- Delete Promotion Modal -->
				<jsp:include page="delete_promotion.jsp" />
				<!-- /Delete Promotion Modal --> --%>
			
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
		
		<!-- Datetimepicker JS 
		<script src="js/moment.min.js"></script>
		<script src="js/bootstrap-datetimepicker.min.js"></script>-->
		
		<!-- Datatable JS -->
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js"></script>
		
		<!-- Custom JS -->
		<script src="js/app.js"></script>
		<!-- DataTables CSS -->
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
		

<script>
    $(document).ready(function () {
        $("#filterButton").click(function () {
            // Get filter criteria (username and id)
            var usernameFilter = $("#promotionfor").val();
            var idFilter = $("#promotiondate").val();

            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./PromotionSearchSrv",
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
</script>

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
    var initialResultCount = (parseInt('<%= request.getAttribute("promotion") %>') == 'null') ? -1 : parseInt('<%= request.getAttribute("promotion") %>');
    console.log(initialResultCount);
    updateFooterVisibility(initialResultCount);
</script>
    </body>
</html>