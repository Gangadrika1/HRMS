<%@page import="com.weblabs.service.impl.AddClientsDAO"%>
<%@ page import="com.weblabs.service.impl.ExpensesDao" %>
<%@ page import="com.weblabs.beans.AddClient" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
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
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr - Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Clients - HRMS admin template</title>
    
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
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
     <!-- Main CSS -->
    <link rel="stylesheet" href="css/tstyles.css">
</head>
<body>

 <!-- filtering records -->
<%
	HttpSession sessionRec = request.getSession(true);
	
	// Initialize recordsPerPage and currentPage as Java variables
	String recordsPerPageStr = (String) sessionRec.getAttribute("recordsPerPage");
	String currentPageStr = (String) sessionRec.getAttribute("currentPage");
	out.print("currentpage="+currentPageStr);
	out.print("currentpage="+currentPageStr);
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
                       <div class="col">
								<h3 class="page-title">Client</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Client</li>
								</ul>
							</div>
							
                        <!-- Other content goes here -->
                        <div class="col-auto float-right ml-auto">
						   <a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_client"><i class="fa fa-plus"></i> Add Client</a>
						</div>
                    </div>
                </div>
                <!-- /Page Header -->
                
                <!-- Search Filter -->
		<form action="./ClientsSearchSRV" method="post"> 
  		
		<div class="form-container">
	    <div class="form-row">
	        <div class="col-sm-6 col-md-3">  
				      <div class="form-group form-focus">
					   <input name="UserName" id="username" type="text" class="form-control floating">
					   <label class="focus-label">Username</label>
				     </div>
				</div>
				
	        <div class="col-sm-6 col-md-3">  
				      <div class="form-group form-focus">
					   <input  name="Clientid" id="id" type="text" class="form-control floating">
					   <label class="focus-label">Client ID</label>
				     </div>
				</div>

	        <div class="col-sm-6 col-md-3" >
               <input class="form-control floating"  style=" color:white; border-radius:5px; height:55px; width:260px; background-color:#55ce63;" type="submit" value="SEARCH">
            </div>
            
	  

                	 <input type="hidden"  name="start" value="<%= currentPage %>">
       	 			<input type="hidden"  name="limit" value="<%= newRecordsPerPage %>">
	
       	       <div class="col-sm-6 col-md-3" id = "flag">
			       <label>Records per page:</label>
			       <select id="recordsPerPage" onchange="changeRecordsPerPage()">
					   	<option value="5" hidden>5</option>
					   	<option value="5">5</option>
					    <option value="10">10</option>
					    <option value="20">20</option>
					</select>
				
			       </div>
			       	</div>
			       	  </div>
	</form>
	<table>
    <tr>
    
        <th>Username</th>
        <th>Email</th>
        <th>Clients Id</th>
        <th>Phone</th>
        <th>Company</th>
        <th>Address</th>
        <th style="text-align: center;" colspan="2">Actions</th>
    </tr>
    <%
            
    		int start=currentPage;
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
            String itemnameFilter  = request.getParameter("UserName");
            String idFilter = request.getParameter("Clientid");
            List<AddClient> client;
         
            String whereClause = ""; // Initialize an empty whereClause

            if (itemnameFilter  != null && !itemnameFilter .isEmpty()) {
                whereClause = "UserName like '%" + itemnameFilter  + "%'";
            }

            if (idFilter != null && !idFilter.isEmpty()) {
                if (!whereClause.isEmpty()) {
                    whereClause += " or ";
                }
                whereClause += "Clientid = '" + idFilter + "'";
            }
            
            //page
            int recordcount= AddClientsDAO.totalCount();

           noOfPages = (int) Math.ceil((double) recordcount / limit);
           //pagee
            
            if (!whereClause.isEmpty()) {
                // Apply the whereClause condition
                client = AddClientsDAO.getFilteredAddClient(whereClause, start, limit);
            } else {
                // Retrieve all data based on the limit
                client = AddClientsDAO.getFilteredAddClient("", start, limit);
            }
            for (AddClient clients  :  client) {
        %>
        <tr>
            <td><%= clients.getUsername()%></td>
            <td><%= clients.getEmail()%></td>
            <td><%= clients.getClientID() %></td>
            <td><%= clients.getPhone()%></td>
            <td><%= clients.getCompany()%></td>
            <td><%= clients.getAddress() %></td>
             <td>
        		<a href="editClients.jsp?Clientid=<%= clients.getClientID()%>">Edit</a>
    		</td>
			    <td>
			        <a href="DeleteClientSRV?Clientid=<%= clients.getClientID()%>">Delete</a>
			    </td>
			</tr>
        <%     
            }         
        %>
</table>
   <div class="row justify-content-center align-items-center" id = "flag1">
     <% if (request.getParameter("UserName") ==null && request.getParameter("Clientid")==null) { %>
    <% if (pageno > 1) { %>
        <a href="clients.jsp?page=<%=pageno - 1%>&newRecordsPerPage=<%= newRecordsPerPage %>">Previous</a>
    <% } %>
    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%=i%>
        <% } else { %>
            <a href="clients.jsp?page=<%=i%>&newRecordsPerPage=<%= newRecordsPerPage %>"><%="&nbsp;&nbsp;&nbsp;" + i + "&nbsp;&nbsp;"%></a>
        <% } %>
    <% } %>
    <% if (pageno < noOfPages) { %>
        <a href="clients.jsp?page=<%=pageno + 1%>&newRecordsPerPage=<%= newRecordsPerPage %>">Next</a>       
    <% } %>
	
	<% }else { %>
	<!-- after search it will execute -->
	 <% if (pageno > 1) { %>
	        <a href="clients.jsp?page=<%=pageno - 1%>&newRecordsPerPage=<%= newRecordsPerPage %>&UserName=<%=request.getParameter("UserName")%>&Clientid=<%=request.getParameter("Clientid")%>">Previous</a>
	    <% } %>	
	    <% for (int i = 1; i <= noOfPages; i++) { %>
	        <% if (i == pageno) { %>
	            <%=i%>
	        <% } else { %>
	            <a href="clients.jsp?page=<%=i%>&newRecordsPerPage=<%= newRecordsPerPage %>&UserName=<%=request.getParameter("UserName")%>&Clientid=<%=request.getParameter("Clientid")%>"><%=i%></a>
	        <% } %>
	    <% } %>	
	    <% if (pageno < noOfPages) { %>
	        <a href="clients.jsp?page=<%=pageno + 1%>&newRecordsPerPage=<%= newRecordsPerPage %>&UserName=<%=request.getParameter("UserName")%>&Clientid=<%=request.getParameter("Clientid")%>">next</a>
	    <% } %>
	
	<% } %>
 
    <%  }%>
</div>               
                </div>
            </div>
            <!-- /Page Content -->
        
            <!-- Add Client Modal -->
            <jsp:include page="addClients.jsp" />
            <!-- Add Client Modal content goes here -->
            <!-- /Add Client Modal -->
          
        </div>
        <!-- /Page Wrapper -->
    <!-- /Main Wrapper -->
    
    <!-- JavaScript libraries and custom scripts go here -->    
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
    <!-- Custom JS -->
   <!--  <script src="js/search.js"></script> -->    
    <script>
    $(document).ready(function () {
        $("#filterButton").click(function () {
            // Get filter criteria (username and id)
            var usernameFilter = $("#UserName").val();
            var idFilter = $("#Clientid").val();
            
            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./ClientsSearchSRV",
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
    var initialResultCount = (parseInt('<%= request.getAttribute("client") %>') == 'null') ? -1 : parseInt('<%= request.getAttribute("client") %>'); console.log(initialResultCount);
 // Calculate the total number of pages based on the actual number of records per page
    updateFooterVisibility(initialResultCount);
</script>
</body>
</html>

