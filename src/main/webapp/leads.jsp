<%@page import="com.weblabs.service.impl.AppProjectDAO"%>
<%@ page import="com.weblabs.beans.CreateProject" %>
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
        <title>Leads - HRMS admin template</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="css/line-awesome.min.css">
		
		<!-- Datatable CSS -->
		<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="css/style.css">
		 <link rel="stylesheet" href="css/tstyles.css">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="js/html5shiv.min.js"></script>
			<script src="js/respond.min.js"></script>
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
	int newRecordsPerPage = 5; // Default value
	String newRecordsPerPageParam = request.getParameter("recordsPerPage");
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
			<!-- /Header -->
			
			<!-- Sidebar -->
            <jsp:include page="sidebar.jsp" />
			<!-- /Sidebar -->
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
				
					<!-- Page Header -->
					<div class="page-header">
						<div class="row">
							<div class="col-sm-12">
								<h3 class="page-title">Leads</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Leads</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table>
									<thead>
										<tr>
											<th>ID</th>
											<th>Lead Name</th>
											<th>Email</th>
											<th>Phone</th>
											<th>Project</th>
											<th>Assigned Staff</th>
											<th>Status</th>
											<th>Created</th>
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
		      start = (pageno - 1)* limit;
		     //pagenation code ended
		     
            String itemnameFilter  = request.getParameter("projectname");
            String idFilter = request.getParameter("projectID");
            List<CreateProject> createpro;
         
            String whereClause = ""; // Initialize an empty whereClause

            if (itemnameFilter  != null && !itemnameFilter .isEmpty()) {
                whereClause = "projectname = '" + itemnameFilter  + "'";
            }

            if (idFilter != null && !idFilter.isEmpty()) {
                if (!whereClause.isEmpty()) {
                    whereClause += " or ";
                }
                whereClause += "projectID = '" + idFilter + "'";
            }
            
            //page
            int recordcount= AppProjectDAO.totalCount();

           noOfPages = (int) Math.ceil((double) recordcount / limit);
           //pagee
            
            if (!whereClause.isEmpty()) {
                // Apply the whereClause condition
                createpro = AppProjectDAO.getFilteredAddTrainers(whereClause, start, limit);
            } else {
                // Retrieve all data based on the limit
                createpro =  AppProjectDAO.getFilteredAddTrainers("", start, limit);
            }
            for (CreateProject expense  :  createpro) {
        %>
                                       	<tr>
											<td href="project-view.jsp?projectID=<%=expense.getProject_id()%>"><%=expense.getProject_id()%></td>
											<td>
												<h2 class="table-avatar">
													<a href="#" class="avatar"><img alt="" src="assets/profiles/avatar-11.jpg"></a>
													<a href="#"><%=expense.getProjectleader()%></a>
												</h2>
											</td>
											<td>wilmerdeluna@example.com</td>
											<td>9876543210</td>
											<td>
											<a href="project-view.jsp?projectname=<%=expense.getProjectname()%>"><%=expense.getProjectname()%></a>
											</td>
											<td>
												<ul class="team-members">
													<li>
														<a href="#" title="John Doe" data-toggle="tooltip"><img alt="" src="assets/profiles/avatar-02.jpg"></a>
													</li>
													<li>
														<a href="#" title="Richard Miles" data-toggle="tooltip"><img alt="" src="assets/profiles/avatar-09.jpg"></a>
													</li>
													<li class="dropdown avatar-dropdown">
														<a href="#" class="all-users dropdown-toggle" data-toggle="dropdown" aria-expanded="false">+15</a>
														<div class="dropdown-menu dropdown-menu-right">
															<div class="avatar-group">
																<a class="avatar avatar-xs" href="#">
																	<img alt="" src="assets/profiles/avatar-02.jpg">
																</a>
																<a class="avatar avatar-xs" href="#">
																	<img alt="" src="assets/profiles/avatar-09.jpg">
																</a>
																<a class="avatar avatar-xs" href="#">
																	<img alt="" src="assets/profiles/avatar-10.jpg">
																</a>
																<a class="avatar avatar-xs" href="#">
																	<img alt="" src="assets/profiles/avatar-05.jpg">
																</a>
																<a class="avatar avatar-xs" href="#">
																	<img alt="" src="assets/profiles/avatar-11.jpg">
																</a>
																<a class="avatar avatar-xs" href="#">
																	<img alt="" src="assets/profiles/avatar-12.jpg">
																</a>
																<a class="avatar avatar-xs" href="#">
																	<img alt="" src="assets/profiles/avatar-13.jpg">
																</a>
																<a class="avatar avatar-xs" href="#">
																	<img alt="" src="assets/profiles/avatar-01.jpg">
																</a>
																<a class="avatar avatar-xs" href="#">
																	<img alt="" src="assets/profiles/avatar-16.jpg">
																</a>
															</div>
															<div class="avatar-pagination">
																<ul class="pagination">
																	<li class="page-item">
																		<a class="page-link" href="#" aria-label="Previous">
																			<span aria-hidden="true">«</span>
																			<span class="sr-only">Previous</span>
																		</a>
																	</li>
																	<li class="page-item"><a class="page-link" href="#">1</a></li>
																	<li class="page-item"><a class="page-link" href="#">2</a></li>
																	<li class="page-item">
																		<a class="page-link" href="#" aria-label="Next">
																			<span aria-hidden="true">»</span>
																		<span class="sr-only">Next</span>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
													</li> 
												</ul>
											</td>
											<td><span class="badge bg-inverse-success">Working</span></td>
											<%-- <td><%=expense.getCreated() %></td> --%>
											
							                <td>
        		                              <a href="edit_expenses.jsp?id=<%= expense.getProject_id()%>">Edit</a>
    		                                </td>
			                                <td>
			                                  <a href="DeleteExpensesSrv?id=<%= expense.getProject_id()%>">Delete</a>
			                                </td>
		<%
     
            }
          
        %>
							</tbody>
								</table>
								 <div class="row justify-content-center align-items-center">
   
   <!-- Pagination links -->

    <% if (pageno > 1) { %>
        <a href="leads.jsp?page=<%=pageno - 1%>">Previous</a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%=i%>
        <% } else { %>
            <a href="leads.jsp?page=<%=i%>"><%=i%></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="leads.jsp?page=<%=pageno + 1%>">Next</a>
    <% } %>

</div>
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
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
		
		<!-- Datatable JS -->
		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/dataTables.bootstrap4.min.js"></script>

		<!-- Custom JS -->
		<script src="js/app.js"></script>
		
    </body>
</html>