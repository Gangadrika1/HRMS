<%@page import="com.weblabs.service.impl.TaxesDAO"%>
<%@page import="com.weblabs.service.impl.AddTaxDAO"%>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.AddTax" %>
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
        <title>Taxes - HRMS admin template</title>
		
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
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/tstyles.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
    <!-- filtering records -->
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
								<h3 class="page-title">Taxes</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Taxes</li>
								</ul>
							</div>
							
							<div class="col-auto float-right ml-auto">
							<a href="#" class="Addbutton" data-toggle="modal" data-target="#add_tax"><i class="fa fa-plus"></i> Add Tax</a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					<!-- Search Filter -->
					
		<form action="./TaxesSearchSRV" method="post" > 
  		
                <div class="row filter-row">
                 <div class="col-sm-6 col-md-3" id = "flag">
			       <label>Records per page:</label>
			       <select id="recordsPerPage" onchange="changeRecordsPerPage()">   
					    <option value="10">10</option> 
					</select>
					
			       </div>
                
                     <div class="col-sm-6 col-md-3">  
				        <div class="custom-input-field form-group form-focus d-flex align-items-center">
				          <label>Tax Name</label>
					     <input class="input" name="TaxName" id="TaxName" type="text" class="form-control floating">
				       </div>
				    </div>
				    
                   <div class="col-sm-6 col-md-3">  
				      <div class="custom-input-field form-group form-focus d-flex align-items-center">
				      	   <label>Tax ID</label>
					   <input class="input"  name="ID" id="TaxID" type="text" class="form-control floating">
				     </div>
				</div>
				
	                    <div class="col-sm-6 col-md-3">
				    <input class="search" type="submit" value="SEARCH">
				</div>
             
                 <input type="hidden"  name="start" value="<%= currentPage %>">
       	 			<input type="hidden"  name="limit" value="<%= newRecordsPerPage %>">
	   
		</form>          
			      
			       </div>
	
					<!-- <div class="row">
						<div class="col-md-12">
							<div class="table-responsive"> -->
								<table>
									<thead>
										<tr>
											<th>ID</th>
											<th>Tax Name </th>
											<th>Tax Percentage (%) </th>
											<th>Status</th>
											<th style="text-align: center;" colspan="2">Actions</th>
										</tr>
									</thead>
									
		<%
        	int start = currentPage;
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
            String usernameFilter = request.getParameter("TaxName");
            String idFilter = request.getParameter("ID");
            List<AddTax> tax;

            String whereClause = ""; // Initialize an empty whereClause

            if (usernameFilter != null && !usernameFilter.isEmpty()) {
                whereClause = "TaxName like '%" + usernameFilter + "%'";
            }

            if (idFilter != null && !idFilter.isEmpty()) {
                if (!whereClause.isEmpty()) {
                    whereClause += " or ";
                }
                whereClause += "ID = '" + idFilter + "'";
            }
          //page
            int recordcount= TaxesDAO.totalCount();
          
           noOfPages = (int) Math.ceil((double) recordcount / limit);
           //pagee
            if (!whereClause.isEmpty()) {
                // Apply the whereClause condition
                tax = AddTaxDAO.getFilteredAddTax(whereClause, start, limit);
            } else {
                // Retrieve all data based on the limit
                tax = AddTaxDAO.getFilteredAddTax("", start, limit);
            }
            for (AddTax taxes : tax) {
        %>
        <tr>
           
            <td><%=taxes.getID()  %></td>
            <td><%= taxes.getTaxName() %></td>
            <td><%= taxes.getTaxPercentage() %></td>
            <td><%=taxes.getStatus()%></td>
            
             <td>
        <a class="edit" href="edit_tax.jsp?Id=<%= taxes.getID() %>">Edit</a>
       
  
    </td>
    <td>
       <a class="delete" href="DeleteTaxSrv?ID=<%= taxes.getID() %>">Delete</a>
    </td>
</tr>
       
        <%
            }
        %>
								</table>
    <div class="row justify-content-center align-items-center custom-pagination d-flex justify-content-center" id="flag1">
   
   <!-- Pagination links -->

    <% if (pageno > 1) { %>
        <a href="empTaxes.jsp?page=<%=pageno - 1%>"><span class="pagination-label">Previous</span></a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
             <span class="pagination-number active"><%=i%></span>
        <% } else { %>
            <a href="empTaxes.jsp?page=<%=i%>"><span class="pagination-number"><%=i%></span></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="empTaxes.jsp?page=<%=pageno + 1%>"><span class="pagination-label">Next</span></a>
    <% }} %>

</div>
							</div>
						</div>
	           </div>
			<!-- /Page Wrapper -->

      
		<!-- /Main Wrapper -->			
				<!-- /Page Content -->
				
				<!-- Add Tax Modal -->
				 <jsp:include page="add_tax.jsp" />
				<!-- /Add Tax Modal -->
				
				<%-- <!-- Edit Tax Modal -->
				 <jsp:include page="edit_tax.jsp" />
				<!-- /Edit Tax Modal -->
				
				<!-- Delete Tax Modal -->
				 <jsp:include page="delete_tax.jsp" />
				<!-- /Delete Tax Modal -->
				 --%>
 

		<!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>

		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="js/select2.min.js"></script>

		<!-- Custom JS -->
		<script src="js/app.js"></script>
<script>
    $(document).ready(function () {
        $("#filterButton").click(function () {
            // Get filter criteria (username and id)
            var usernameFilter = $("#TaxName").val();
            var idFilter = $("#TaxID").val();
            
            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./TaxesSearchSRV",
                data: {
                    username: usernameFilter,
                    id: idFilter
                }
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
    var initialResultCount = (parseInt('<%= request.getAttribute("taxes") %>') == 'null') ? -1 : parseInt('<%= request.getAttribute("taxes") %>');
    console.log(initialResultCount);
    updateFooterVisibility(initialResultCount);
</script>

    </body>
</html>

