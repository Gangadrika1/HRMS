<%@ page import="com.weblabs.service.impl.taskDAO" %>
<%@ page import="com.weblabs.service.impl.ProjectDAO" %>
<%@ page import="com.weblabs.beans.CreateProject" %>
<%@ page import="com.weblabs.beans.TasksBean" %>
				
<%@ page import="java.util.List" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

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
		
		
		<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<!-- Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>		
/* function showFullDescription(projectId, fullDescription) {
    var descriptionElement = document.getElementById("description_" + projectId);

    // Debugging statement
    console.log("Project ID: " + projectId);
    
    // Update the content using innerHTML
    descriptionElement.innerHTML = fullDescription;

    // Optionally, you can hide the "Read more" element after showing the full description
    var readMoreElement = document.querySelector(".read-more");
    if (readMoreElement) {
        readMoreElement.style.display = "none";
    }
}
 */function showFullDescription(projectId, fullDescription) {
	    var descriptionElement = document.getElementById("description_" + projectId);

	    // Debugging statements
	    console.log("Project ID: " + projectId);
	    console.log("Full Description: " + fullDescription);

	    // Update the content using innerHTML
	    if (descriptionElement) {
	        descriptionElement.innerHTML = fullDescription;

	        // Optionally, you can hide the "Read more" element after showing the full description
	        var readMoreElement = document.querySelector(".read-more");
	        if (readMoreElement) {
	            readMoreElement.style.display = "none";
	        }
	    } else {
	        console.error("Description element not found");
	    }
	}

	</script>
	
		
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
								<h3 class="page-title">Projects</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
									<li class="breadcrumb-item active">Projects</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
							<a href="#" class="btn add-btn" data-toggle="modal" data-target="#create_project"><i class="fa fa-plus"></i> Create Project</a>
							</div>
						</div>
					</div>

<%
List<CreateProject> projects = ProjectDAO.getAllProjects(); // Initialize with the actual list of projects
int totalcount = ProjectDAO.totalCount(); // Assuming totalcount is the total number of projects
int columnCount = 4;
int finalrs = totalcount % columnCount;
int finalrscolsspan = finalrs > 0 ? 12 / finalrs : 0;
int currentIndex = 0; // Start index from 0

for (int row = 1; currentIndex < totalcount; row++) {
%>

<style>
    .row > .col-md-3 {
        margin-bottom: 20px; /* Adjust the value as needed for the desired spacing between columns */
    }

    /* Add space only between rows (every fourth column) */
    .row > .col-md-3:nth-child(4n) {
        margin-bottom: 40px; /* Adjust the value as needed for the desired spacing between rows */
    }
</style>

   <div class="row">
        <% for (int col = 0; col < columnCount; col++) {
            if (currentIndex < totalcount) { // Ensure not to exceed the total count of projects
                CreateProject project = projects.get(currentIndex);

                int projectId = Integer.parseInt(project.getProject_id());

                // Call the method to get task counts for the project
                Map<String, Integer> taskCounts = taskDAO.getTaskCountsForProject(projectId);

                // Access the values directly
                int totalTaskCount = taskCounts.get("totalTaskCount");
                int completedCount = taskCounts.get("completedCount");
                int pendingCount = taskCounts.get("pendingCount");
        %>
        <div class="col-md-3" style="padding: 15px; word-wrap: break-word; background-color: white;">

 <!-- Add background color style here -->
               <!--  <div class="col-md-3" style="padding: 10px; word-wrap: break-word;"> -->
                    <div class="dropdown dropdown-action profile-action">
                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <!-- <a class="dropdown-item" href="#" data-toggle="modal" data-target="#edit_project"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_project"><i class="fa fa-trash-o m-r-5"></i> Delete</a> -->
                            <a href="edit_project.jsp?project_id=<%= project.getProject_id() %>">Edit</a><br>
 							<a href="DeleteProjectSrv?project_id=<%= project.getProject_id()%>">Delete</a> 
                        </div>
                    </div>
                    <h4 class="project-title text-center"><a href="project-view.jsp"> <%= project.getProjectname() %></a></h4><br>
                    <small class="block text-ellipsis m-b-15">
                        <span class="text-xs"><%= pendingCount %></span> <span class="text-muted"> tasks pending </span> 
                        <span class="text-xs"><%= completedCount %></span> <span class="text-muted"> tasks completed</span>
                    </small>
                    <%-- <p class="text-muted"><%= project.getDescription() %></p> --%>
                    <p class="text-muted" id="description_<%= projectId %>">
    <% 
        String description = project.getDescription();
        if (description.length() > 100) {
            out.print(description.substring(0, 100) + "...");
        } else {
            out.print(description);
        }
    %>
    <!-- Add a clickable element to show the full description -->
    <% if (description.length() > 100) { %>
    <!-- Update the "Read more" span to pass the correct parameters -->
       <%--  <span class="read-more" onclick="showFullDescription('<%= projectId %>', '<%= project.getDescription().replace("'", "\\'") %>')">Read more</span> --%>
        <span class="read-more" style="cursor: pointer; pointer-events: auto;" onclick="showFullDescription('<%= projectId %>', '<%= project.getDescription().replace("'", "\\'") %>')">Read more</span>
        
       <%--  <span class="read-more" onclick="showFullDescription('<%= projectId %>', '<%= project.getDescription() %>')">Read more</span> --%>
    <% } %>
</p>
                    DeadLine: <p class="text-muted"><%= project.getEnddate() %>  </p>                 
                    <!-- Add other project attributes as needed -->
                    <div class="project-members m-b-15">
                        <div>Project Leader :</div>
                        <ul class="team-members">
                            <li>
                                <a href="#" data-toggle="tooltip" title="Jeffery Lalor"><img alt="" src="assets/profiles/avatar-16.jpg"></a>
                            </li>
                        </ul>
                    </div>
                    <div class="project-members m-b-15">
                        <div>Team :</div>
                        <ul class="team-members">
                            <li>
                                <a href="#" data-toggle="tooltip" title="John Doe"><img alt="" src="assets/profiles/avatar-02.jpg"></a>
                            </li>
                            <!-- Add more team members as needed -->
                        </ul>
                    </div>
                    <p class="m-b-5">Progress <span class="text-success float-right">40%</span></p>
                    <div class="progress progress-xs mb-0">
                        <div class="progress-bar bg-success" role="progressbar" data-toggle="tooltip" title="40%" style="width: 40%"></div>
                    </div>
                </div>
        <% } else { %>
                <!-- Empty columns for padding in the last row -->
                <div class="col-md-3" style="padding: 10px;"></div>
        <% }
           currentIndex++; // Increment the index for the next project
           }
        %>
    </div>
    <br> <!-- Add a line break between rows -->

<%	
}
%>

<script>
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
    });
</script>
 
 <!-- 	******** -->
 

							</div>
						</div>
					
				<!-- /Page Content -->
				
				<!-- Add Tax Modal -->
				 <jsp:include page="add_project.jsp" />
				<!-- /Add Tax Modal -->
				
			
				
            

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
            var usernameFilter = $("#projectname").val();
            var idFilter = $("#project_id").val();
            
            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./ProjectsSearchSRV",
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

    </body>
</html>