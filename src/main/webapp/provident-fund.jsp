<%@ page import="com.weblabs.service.impl.AddPFDAO" %>
<%@ page import="com.weblabs.beans.AddPF" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.System" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

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
        <title>Provident Fund - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="css/line-awesome.min.css">
		
		<!-- Datatable CSS -->
		<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
		
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
								<h3 class="page-title">provident-fund</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">provident-fund</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="#" class="btn add-btn" data-toggle="modal" data-target="#add_pf"><i class="fa fa-plus"></i> Add Provident Fund</a>
									</div>
						</div>
					</div>
					<!-- /Page Header -->
					<!-- Search Filter -->
		<form action="./PF_SRV" method="post" > 
  		
		<div class="row filter-row">
        
        <div class="col-sm-6 col-md-3">  
	      <div class="form-group form-focus">
		   <input  name="ProvidentFundType" id="EmployeeName" type="text" class="form-control floating">
		   <label class="focus-label">ProvidentFund Type</label>
	   </div>
	   </div>
	   
        <div class="col-sm-6 col-md-3">  
		    <div class="form-group form-focus">
		   <input name="ID" id="PfID" type="text" class="form-control floating">
		   <label class="focus-label">ProvidentFund ID</label>
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
					   
					   <option value="5" hidden=>5</option>
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="50">50</option>
					    
					</select>
					
			       </div>
			       </div>
	</form>
					
								<table>
									
										<tr>
										    <th>ID</th>
											<th>Employee_Id</th>
											<th>Provident Fund Type</th>
											<th>Employee Share Amount</th>
											<th>Organization Share Amount</th>
											<th>EmployeeSharePer</th>
											<th>Organization SharePer</th>
											<th>Descripotion</th>
											<th>Edit</th>
											<th>Delete</th>											
										</tr>
									
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
            String usernameFilter = request.getParameter("ProvidentFundType");
            String idFilter = request.getParameter("ID");
            List<AddPF> pff;

            String whereClause = ""; // Initialize an empty whereClause

            if (usernameFilter != null && !usernameFilter.isEmpty()) {
                whereClause = "ProvidentFundType like '%" + usernameFilter + "%'";
            }

            if (idFilter != null && !idFilter.isEmpty()) {
                if (!whereClause.isEmpty()) {
                    whereClause += " or ";
                }
                whereClause += "ID = '" + idFilter + "'";
            }
          //page
            int recordcount= AddPFDAO.totalCount();
          
           noOfPages = (int) Math.ceil((double) recordcount / limit);
           //pagee

            if (!whereClause.isEmpty()) {
                // Apply the whereClause condition
                pff = AddPFDAO.getFilteredAddPF(whereClause, start, limit);
            } else {
                // Retrieve all data based on the limit
                pff =AddPFDAO.getFilteredAddPF("", start, limit);
            }
            for (AddPF pft  :  pff) {
        %>
        <tr>
           
            <td><%=pft.getId()%></td>
            <td><%= pft.getEmployee_Id()%></td>
            <td><%= pft.getProvidentFundType()%></td>
            <td><%=pft.getEmployeeShareAmount()%></td>
            <td><%=pft.getOrganizationShareAmount()%></td>
            <td><%=pft.getEmployeeSharePer() %></td>
            <td><%=pft.getOrganizationSharePer()%></td>
            <td><%=pft.getDescription() %></td>
             <td>
        <a href="edit_pf.jsp?id=<%= pft.getId() %>">Edit</a>
    </td>
    <td>
        <a href="DeletePFSrv?id=<%= pft.getId() %>">Delete</a>
    </td>
</tr>
       
        <%
            }
            %>
	</table>
	
	<div class="row justify-content-center align-items-center" id = "flag1">
	 <!-- Pagination links -->
   <% if (request.getParameter("ProvidentFundType") ==null && request.getParameter("ID") ==null) { %>
    <% if (pageno > 1) { %>
        <a href="provident-fund.jsp?page=<%=pageno - 1%>&newRecordsPerPage=<%= newRecordsPerPage %>">Previous</a>
    <% } %>
    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%=i%>
        <% } else { %>
            <a href="provident-fund.jsp?page=<%=i%>&newRecordsPerPage=<%= newRecordsPerPage %>"><%="&nbsp;&nbsp;&nbsp;" + i + "&nbsp;&nbsp;"%></a>
        <% } %>
    <% } %>
    <% if (pageno < noOfPages) { %>
        <a href="provident-fund.jsp?page=<%=pageno + 1%>&newRecordsPerPage=<%= newRecordsPerPage %>">Next</a>       
    <% } %>
	
	<% }else { %>
	<!-- after search it will execute -->
	 <% if (pageno > 1) { %>
	        <a href="provident-fund.jsp?page=<%=pageno - 1%>&newRecordsPerPage=<%= newRecordsPerPage %>&ProvidentFundType=<%=request.getParameter("ProvidentFundType")%>&ID=<%=request.getParameter("ID")%>">Previous</a>
	    <% } %>
	
	    <% for (int i = 1; i <= noOfPages; i++) { %>
	        <% if (i == pageno) { %>
	            <%=i%>
	        <% } else { %>
	            <a href="provident-fund.jsp?page=<%=i%>&newRecordsPerPage=<%= newRecordsPerPage %>&ProvidentFundType=<%=request.getParameter("ProvidentFundType")%>&ID=<%=request.getParameter("ID")%>"><%=i%></a>
	        <% } %>
	    <% } %>
	
	    <% if (pageno < noOfPages) { %>
	        <a href="provident-fund.jsp?page=<%=pageno + 1%>&newRecordsPerPage=<%= newRecordsPerPage %>&ProvidentFundType=<%=request.getParameter("ProvidentFundType")%>&ID=<%=request.getParameter("ID")%>">next</a>
	    <% } %>	
	<% } %>
    <% } %>
</div>
							</div>
						</div>
					</div>            
				<!-- /Page Content -->
				
				<!-- Add PF Modal -->
				<jsp:include page="add_pf.jsp" />
				<!-- /Add PF Modal -->
				
				<%-- <!-- Edit PF Modal -->
				<jsp:include page="edit_pf.jsp" />
				<!-- /Edit PF Modal -->
				
				<!-- Delete PF Modal -->
				<jsp:include page="delete_pf.jsp" />
				<!-- /Delete PF Modal --> --%>
		
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
		
		<!-- Datatable JS -->
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js"></script>

		<!-- Custom JS -->
		<script src="js/app.js"></script>
<script>
$(document).ready(function () {
    // Attach the changeRecordsPerPage function to the change event of the recordsPerPage select
    $("#recordsPerPage").change(function () {
        changeRecordsPerPage();
    });

    $("#filterButton").click(function (event) {
        // Get filter criteria (username and id)
        event.preventDefault();
        var usernameFilter = $("#ProvidentFundType").val();
        var idFilter = $("#pfID").val();
        
        // Make an AJAX request to the server
        $.ajax({
            type: "POST", // Use POST or GET depending on your servlet configuration
            url: "./PF_SRV",
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
    </script>

    <%-- // Function to change records per page
    function changeRecordsPerPage() {
        var recordsPerPageSelect = $("#recordsPerPage");
        var selectedValue = recordsPerPageSelect.val();

        var form = $("<form>")
            .attr("method", "POST")
            .attr("action", "./PF_SRV");

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
    var initialResultCount = (parseInt('<%= request.getAttribute("pf") %>') == 'null') ? -1 : parseInt('<%= request.getAttribute("pf") %>');
    console.log(initialResultCount);
    updateFooterVisibility(initialResultCount);
</script>
    </body>
</html>