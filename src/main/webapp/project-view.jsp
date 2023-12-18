<%@ page import="com.weblabs.service.impl.AppProjectDAO" %>
<%@ page import="com.weblabs.service.impl.taskDAO" %>
<%@ page import="com.weblabs.beans.CreateProject" %>
<%@ page import="com.weblabs.beans.TasksBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Project View - HRMS admin template</title>
		
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
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    </head>
    <body>
    <%
    int start = 0;
    int limit = 25;

    int projectId=0;
    String idFilter = request.getParameter("projectname"); // Make sure the parameter name matches your form
   List<CreateProject> expenses = null; // Initialize the list as empty
    
    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "projectname = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        expenses = AppProjectDAO.getFilteredAddTrainers(whereClause, start, limit);
    }

    
    if (expenses != null && !expenses.isEmpty()) {
    	CreateProject expense = expenses.get(0); // Access the first element
        if (expense != null) {
        	
        	String projectid= expense.getProject_id();
        	 projectId= Integer.parseInt(projectid);
        	  // Call the method to get task counts for the project
   	     Map<String, Integer> taskCounts = taskDAO.getTaskCountsForProject(projectId);
   	     // Access the values directly
   	     int totalTaskCount = taskCounts.get("totalTaskCount");
   	    int completedCount = taskCounts.get("completedCount");
   	    System.out.println(completedCount);
   	    int pendingCount = taskCounts.get("pendingCount");
   	    
   	 
%>
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
							
								<h3 class="page-title" value="<%=expense.getProjectname()%>"><%=expense.getProjectname()%></h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Project</li>
								</ul>
							</div>
							<div class="col-auto float-right ml-auto">
								<a href="includes/projects/edit.jsp?id=<%= expense.getProject_id()%>"> Edit Project</a>
								<a href="task-board.jsp" class="btn btn-white float-right m-r-10" data-toggle="tooltip" title="Task Board"><i class="fa fa-bars"></i></a>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					
					<div class="row">
						<div class="col-lg-8 col-xl-9">
							<div class="card">
								<div class="card-body">
									<div class="project-title">
									
										<h5 class="card-title" value="<%=expense.getProjectname()%>"><%=expense.getProjectname()%></h5>
										<small class="block text-ellipsis m-b-15"><span class="text-xs"><%= pendingCount %></span> <span class="text-muted">pending tasks, </span><span class="text-xs"><%= completedCount %></span> <span class="text-muted">tasks completed</span></small>
									</div>
									<p><%=expense.getDescription()%></p>
								</div>
							</div>
							<div class="card">
								<div class="card-body">
				                    <h5 class="card-title m-b-20">Uploaded image files</h5>
									<div class="row">
										<div class="col-md-3 col-sm-4 col-lg-4 col-xl-3">
											<div class="uploaded-box">
												<div class="uploaded-img">
													<img src="assets/placeholder.jpg" class="img-fluid" alt="">
												</div>
												<div class="uploaded-img-name">
													 demo.png
												</div>
											</div>
										</div>
										<div class="col-md-3 col-sm-4 col-lg-4 col-xl-3">
											<div class="uploaded-box">
												<div class="uploaded-img">
													<img src="assets/placeholder.jpg" class="img-fluid" alt="">
												</div>
												<div class="uploaded-img-name">
													 demo.png
												</div>
											</div>
										</div>
										<div class="col-md-3 col-sm-4 col-lg-4 col-xl-3">
											<div class="uploaded-box">
												<div class="uploaded-img">
													<img src="assets/placeholder.jpg" class="img-fluid" alt="">
												</div>
												<div class="uploaded-img-name">
													 demo.png
												</div>
											</div>
										</div>
										<div class="col-md-3 col-sm-4 col-lg-4 col-xl-3">
											<div class="uploaded-box">
												<div class="uploaded-img">
													<img src="assets/placeholder.jpg" class="img-fluid" alt="">
												</div>
												<div class="uploaded-img-name">
													 demo.png
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
		
							<div class="card">
								<div class="card-body">
									<h5 class="card-title m-b-20">Uploaded files</h5>
									<ul class="files-list">
										<li>
											<div class="files-cont">
												<div class="file-type">
													<span class="files-icon"><i class="fa fa-file-pdf-o"></i></span>
												</div>
												<div class="files-info">
													<span class="file-name text-ellipsis"><a href="#">AHA Selfcare Mobile Application Test-Cases.xls</a></span>
													<span class="file-author"><a href="#">John Doe</a></span> <span class="file-date">May 31st at 6:53 PM</span>
													<div class="file-size">Size: 14.8Mb</div>
												</div>
												<ul class="files-action">
													<li class="dropdown dropdown-action">
														<a href="" class="dropdown-toggle btn btn-link" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_horiz</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)">Download</a>
															<a class="dropdown-item" href="#" data-toggle="modal" data-target="#share_files">Share</a>
															<a class="dropdown-item" href="javascript:void(0)">Delete</a>
														</div>
													</li>
												</ul>
											</div>
										</li>
										<li>
											<div class="files-cont">
												<div class="file-type">
													<span class="files-icon"><i class="fa fa-file-pdf-o"></i></span>
												</div>
												<div class="files-info">
													<span class="file-name text-ellipsis"><a href="#">AHA Selfcare Mobile Application Test-Cases.xls</a></span>
													<span class="file-author"><a href="#">Richard Miles</a></span> <span class="file-date">May 31st at 6:53 PM</span>
													<div class="file-size">Size: 14.8Mb</div>
												</div>
												<ul class="files-action">
													<li class="dropdown dropdown-action">
														<a href="" class="dropdown-toggle btn btn-link" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_horiz</i></a>
														<div class="dropdown-menu dropdown-menu-right">
															<a class="dropdown-item" href="javascript:void(0)">Download</a>
															<a class="dropdown-item" href="#" data-toggle="modal" data-target="#share_files">Share</a>
															<a class="dropdown-item" href="javascript:void(0)">Delete</a>
														</div>
													</li>
												</ul>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<%
						        	  // Call the method to get task counts for the project
						   	     List<TasksBean> taskCounts2 = taskDAO.getTasksForProject(projectId);
						   	  List<TasksBean> taskCounts3 = taskDAO.getPendingTasks(projectId);
						   	List<TasksBean> taskCounts4 = taskDAO.getCompletedTasks(projectId);
                                %>
							<div class="project-task">
								<ul class="nav nav-tabs nav-tabs-top nav-justified mb-0">
									<li class="nav-item"><a class="nav-link active" href="#all_tasks" data-toggle="tab" aria-expanded="true">All Tasks</a></li>
									<li class="nav-item"><a class="nav-link" href="#pending_tasks" data-toggle="tab" aria-expanded="false">Pending Tasks</a></li>
									<li class="nav-item"><a class="nav-link" href="#completed_tasks" data-toggle="tab" aria-expanded="false">Completed Tasks</a></li>
								                
								                  </ul>
		                             <div class="tab-content">
		                             	<div class="tab-pane show active" id="all_tasks">
									<div class="task-wrapper">
										<div class="task-list-container">
										<div class="task-list-body">
											<ul id="task-list">
										 <% for (TasksBean taskk : taskCounts2) { %>
								                        <li class="task">
								                            <div class="task-container">
								                                <!-- You can customize this part based on your task structure -->
								                                <span class="task-label" contenteditable="true"><%= taskk.getDescription() %></span>
								                                <!-- Add other task details if needed -->
								                            </div>
								                        </li>
					                      <% } %>
													</ul>
												</div>
												<div class="task-list-footer">
													<div class="new-task-wrapper">
														<textarea id="new-task" placeholder="Enter new task here. . ."></textarea>
														<span class="error-message hidden">You need to enter a task first</span>
														<span class="add-new-task-btn btn" id="add-task">Add Task</span>
														<span class="btn" id="close-task-panel">Close</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="tab-pane" id="pending_tasks">
									  <div class="task-wrapper">
										<div class="task-list-container">
										<div class="task-list-body">
											<ul id="task-list">
										 <% for (TasksBean taskk : taskCounts3) { %>
								                        <li class="task">
								                            <div class="task-container">
								                                <!-- You can customize this part based on your task structure -->
								                                <span class="task-label" contenteditable="true"><%= taskk.getDescription() %></span>
								                                <!-- Add other task details if needed -->
								                            </div>
								                        </li>
					                      <% } %>
													</ul>
												</div>
												<div class="task-list-footer">
													<div class="new-task-wrapper">
														<textarea id="new-task" placeholder="Enter new task here. . ."></textarea>
														<span class="error-message hidden">You need to enter a task first</span>
														<span class="add-new-task-btn btn" id="add-task">Add Task</span>
														<span class="btn" id="close-task-panel">Close</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="tab-pane" id="completed_tasks">
									<div class="task-wrapper">
										<div class="task-list-container">
										<div class="task-list-body">
											<ul id="task-list">
										 <% for (TasksBean taskk : taskCounts4) { %>
								                        <li class="task">
								                            <div class="task-container">
								                                <!-- You can customize this part based on your task structure -->
								                                <span class="task-label" contenteditable="true"><%= taskk.getDescription() %></span>
								                                <!-- Add other task details if needed -->
								                            </div>
								                        </li>
					                      <% } %>
													</ul>
												</div>
												<div class="task-list-footer">
													<div class="new-task-wrapper">
														<textarea id="new-task" placeholder="Enter new task here. . ."></textarea>
														<span class="error-message hidden">You need to enter a task first</span>
														<span class="add-new-task-btn btn" id="add-task">Add Task</span>
														<span class="btn" id="close-task-panel">Close</span>
													</div>
												</div>
											</div>
										</div>
									
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-xl-3">
							<div class="card">
								<div class="card-body">
									<h6 class="card-title m-b-15">Project details</h6>
									<table class="table table-striped table-border">
										<tbody>
											<tr>
												<td>Cost:</td>
												<td class="text-right"><%= expense.getRate()%></td>
											</tr>
											
											<%-- <tr>
												<td>Created:</td>
												<td class="text-right"><%= expense.getCreated()%></td>
											</tr> --%>
											<tr>
												<td>Deadline:</td>
												<td class="text-right"><%= expense.getEnddate()%></td>
											</tr>
											<tr>
												<td>Priority:</td>
												<td class="text-right"><%= expense.getPriority()%></td>
											</tr>
											<tr>
												<td>Created by:</td>
												<td class="text-right"><a href="profile.jsp"><%= expense.getProjectleader()%></a></td>
											</tr>
											<tr>
												<td>Status:</td>
												<td class="text-right">Working</td>
											</tr>
										</tbody>
									</table>
									<p class="m-b-5">Progress <span class="text-success float-right">40%</span></p>
									<div class="progress progress-xs mb-0">
										<div class="progress-bar bg-success" role="progressbar" data-toggle="tooltip" title="40%" style="width: 40%"></div>
									</div>
								</div>
							</div>
							<div class="card project-user">
								<div class="card-body">
									<h6 class="card-title m-b-20">Assigned Leader <button type="button" class="float-right btn btn-primary btn-sm" data-toggle="modal" data-target="#assign_leader"><i class="fa fa-plus"></i> Add</button></h6>
									<ul class="list-box">
										<li>
											<a href="profile.jsp">
												<div class="list-item">
													<div class="list-left">
														<span class="avatar"><img alt="" src="assets/profiles/avatar-11.jpg"></span>
													</div>
													<div class="list-body">
														<span class="message-author"><%= expense.getProjectleader()%></span>
														<div class="clearfix"></div>
														<span class="message-content">Team Leader</span>
													</div>
												</div>
											</a>
										</li>
										
									</ul>
								</div>
							</div>
							<div class="card project-user">
								<div class="card-body">
									<h6 class="card-title m-b-20">
										Assigned users 
										<button type="button" class="float-right btn btn-primary btn-sm" data-toggle="modal" data-target="#assign_user"><i class="fa fa-plus"></i> Add</button>
									</h6>
									<ul class="list-box">
										<li>
											<a href="profile.jsp">
												<div class="list-item">
													<div class="list-left">
														<span class="avatar"><img alt="" src="assets/profiles/avatar-02.jpg"></span>
													</div>
													<div class="list-body">
														<span class="message-author"><%= expense.getAddteam()%></span>
														<div class="clearfix"></div>
														<span class="message-content">Web Designer</span>
													</div>
												</div>
											</a>
										</li>
										<li>
											<a href="profile.jsp">
												<div class="list-item">
													<div class="list-left">
														<span class="avatar"><img alt="" src="assets/profiles/avatar-09.jpg"></span>
													</div>
													<div class="list-body">
														<span class="message-author">Richard Miles</span>
														<div class="clearfix"></div>
														<span class="message-content">Web Developer</span>
													</div>
												</div>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
				<!-- Assign Leader Modal -->
				<div id="assign_leader" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Assign Leader to this project</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="input-group m-b-30">
									<input placeholder="Search to add a leader" class="form-control search-input" type="text">
									<span class="input-group-append">
										<button class="btn btn-primary">Search</button>
									</span>
								</div>
								<div>
									<ul class="chat-user-list">
										<li>
											<a href="#">
												<div class="media">
													<span class="avatar"><img alt="" src="assets/profiles/avatar-09.jpg"></span>
													<div class="media-body align-self-center text-nowrap">
														<div class="user-name">Richard Miles</div>
														<span class="designation">Web Developer</span>
													</div>
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="media">
													<span class="avatar"><img alt="" src="assets/profiles/avatar-10.jpg"></span>
													<div class="media-body align-self-center text-nowrap">
														<div class="user-name">John Smith</div>
														<span class="designation">Android Developer</span>
													</div>
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="media">
													<span class="avatar">
														<img alt="" src="assets/profiles/avatar-16.jpg">
													</span>
													<div class="media-body align-self-center text-nowrap">
														<div class="user-name">Jeffery Lalor</div>
														<span class="designation">Team Leader</span>
													</div>
												</div>
											</a>
										</li>
									</ul>
								</div>
								<div class="submit-section">
									<button class="btn btn-primary submit-btn">Submit</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Assign Leader Modal -->
				
				<!-- Assign User Modal -->
				<div id="assign_user" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Assign the user to this project</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="input-group m-b-30">
									<input placeholder="Search a user to assign" class="form-control search-input" type="text">
									<span class="input-group-append">
										<button class="btn btn-primary">Search</button>
									</span>
								</div>
								<div>
									<ul class="chat-user-list">
										<li>
											<a href="#">
												<div class="media">
													<span class="avatar"><img alt="" src="assets/profiles/avatar-09.jpg"></span>
													<div class="media-body align-self-center text-nowrap">
														<div class="user-name">Richard Miles</div>
														<span class="designation">Web Developer</span>
													</div>
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="media">
													<span class="avatar"><img alt="" src="assets/profiles/avatar-10.jpg"></span>
													<div class="media-body align-self-center text-nowrap">
														<div class="user-name">John Smith</div>
														<span class="designation">Android Developer</span>
													</div>
												</div>
											</a>
										</li>
										<li>
											<a href="#">
												<div class="media">
													<span class="avatar">
														<img alt="" src="assets/profiles/avatar-16.jpg">
													</span>
													<div class="media-body align-self-center text-nowrap">
														<div class="user-name">Jeffery Lalor</div>
														<span class="designation">Team Leader</span>
													</div>
												</div>
											</a>
										</li>
									</ul>
								</div>
								<div class="submit-section">
									<button class="btn btn-primary submit-btn">Submit</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /Assign User Modal -->
				
				<!-- Edit Project Modal -->
				<div id="edit_project" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Edit Project</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Project Name</label>
												<input class="form-control" value="Project Management" type="text">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>Client</label>
												<select class="select">
													<option>Global Technologies</option>
													<option>Delta Infotech</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Start Date</label>
												<div class="cal-icon">
													<input class="form-control datetimepicker" type="text">
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>End Date</label>
												<div class="cal-icon">
													<input class="form-control datetimepicker" type="text">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label>Rate</label>
												<input placeholder="$50" class="form-control" value="$5000" type="text">
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label>&nbsp;</label>
												<select class="select">
													<option>Hourly</option>
													<option selected="">Fixed</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>Priority</label>
												<select class="select">
													<option selected="">High</option>
													<option>Medium</option>
													<option>Low</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Add Project Leader</label>
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>Team Leader</label>
												<div class="project-members">
													<a class="avatar" href="#" data-toggle="tooltip" title="Jeffery Lalor">
														<img alt="" src="assets/profiles/avatar-16.jpg">
													</a>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Add Team</label>
												<input class="form-control" type="text">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>Team Members</label>
												<div class="project-members">
													<a class="avatar" href="#" data-toggle="tooltip" title="John Doe">
														<img alt="" src="assets/profiles/avatar-02.jpg">
													</a>
													<a class="avatar" href="#" data-toggle="tooltip" title="Richard Miles">
														<img alt="" src="assets/profiles/avatar-09.jpg">
													</a>
													<a class="avatar" href="#" data-toggle="tooltip" title="John Smith">
														<img alt="" src="assets/profiles/avatar-10.jpg">
													</a>
													<a class="avatar" href="#" data-toggle="tooltip" title="Mike Litorus">
														<img alt="" src="assets/profiles/avatar-05.jpg">
													</a>
													<span class="all-team">+2</span>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label>Description</label>
										<textarea rows="4" class="form-control" placeholder="Enter your message here"></textarea>
									</div>
									<div class="form-group">
										<label>Upload Files</label>
										<input class="form-control" type="file">
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Save</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<%
    HttpSession sessionstatus = request.getSession(true);
    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("Expenses Position Updated Successfully!")) {
        response.sendRedirect("expenses.jsp");
    } else {
%>
   <div class="col-sm-6">
		<p>Expenses not found with the provided ID.</p>
</div>
<%
    }
%>
<%
        }
		  
%>
<%
        }
    
%>
				<!-- /Edit Project Modal -->
				
            </div>
			<!-- /Page Wrapper -->

        </div>
		<!-- /Main Wrapper -->

		<!-- jQuery -->
        <script src="js/jquery-3.2.1.min.js"></script>

		<!-- Bootstrap Core JS -->
        <script src="js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

		<!-- Slimscroll JS -->
		<script src="js/jquery.slimscroll.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="js/select2.min.js"></script>
		
		<!-- Datetimepicker JS -->
		<script src="js/moment.min.js"></script>
		<script src="js/bootstrap-datetimepicker.min.js"></script>
		
		<!-- Task JS -->
		<script src="js/task.js"></script>

		<!-- Custom JS -->
		<script src="js/app.js"></script>

    </body>
</html>