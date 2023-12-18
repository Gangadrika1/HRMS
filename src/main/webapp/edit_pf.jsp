<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.AddPFDAO" %>
<%@ page import="com.weblabs.beans.AddPF" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Expenses</title>
    <!-- Add your CSS and JavaScript includes here -->
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
    <link rel="stylesheet" href="css/styles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]-->
   <!--  <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>  -->
 </head>
<body>
<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("id"); // Make sure the parameter name matches your form
    List<AddPF> PF = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        PF = AddPFDAO.getFilteredAddPF(whereClause, start, limit);
    }

    if (PF != null && !PF.isEmpty()) {
    	AddPF Fund = PF.get(0); // Access the first element
        if (Fund != null) {
%>

<div class="main-wrapper">
    <jsp:include page="header.jsp" />
    <jsp:include page="sidebar.jsp" />

    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <!-- Page Content -->
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
               <form action="./EditPFSrv" method="post">

					<div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Id <span class="text-danger">*</span></label>
                                <input name="id" value="<%= Fund.getId() %>" required class="form-control" type="text" readonly>
                            </div>
                        </div>
                    </div>
                    
                    
					<div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">employeename <span class="text-danger">*</span></label>
                                <input name="employeename" value="<%= Fund.getEmployee_Id() %>" required class="form-control" type="text" readonly>
                            </div>
                        </div>
                    </div>
				
										<div class="col-sm-6">
											<div class="form-group">
												 <label class="col-form-label">Provident Fund Type <span class="text-danger">*</span></label>
												 <input name="pf" value="<%= Fund.getProvidentFundType() %>" required class="form-control" type="text" >
												 </div>
										     </div>
										
													<div class="col-sm-6">
														<div class="form-group">
														 <label class="col-form-label">Employee Share (Amount) <span class="text-danger">*</span></label>
                                                    	<input name="employeesharea" value="<%= Fund.getEmployeeShareAmount() %>" required class="form-control" type="text" >
                         		
												 
														</div>
													</div>
													<div class="col-sm-6">
														<div class="form-group">
															 <label class="col-form-label">Organization Share (Amount) <span class="text-danger">*</span></label>
                                                        		<input name="organizationsharea" value="<%= Fund.getOrganizationShareAmount() %>" required class="form-control" type="text" >
                         								</div>
													</div>
												
										
													<div class="col-sm-6">
														<div class="form-group">
															
															 <label class="col-form-label">Employee Share (%) <span class="text-danger">*</span></label>
                                                             <input name="employeesharep" value="<%= Fund.getEmployeeSharePer()%>" required class="form-control" type="text" >
                                                             </div>
													</div>
													<div class="col-sm-6">
														<div class="form-group">
															 <label class="col-form-label">Organization Share (%) <span class="text-danger">*</span></label>
                                                             <input name="organizationsharep" value="<%= Fund.getOrganizationSharePer() %>" required class="form-control" type="text" >
                         		                          </div>
													</div>
												
										<div class="col-sm-6">
											<div class="form-group">
												 <label class="col-form-label">Description <span class="text-danger">*</span></label>
												 <input name="description" value="<%= Fund.getDescription() %>" required class="form-control" type="text" >
                         		              </div>
										</div>
									
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
									</div>
								 </form>
                           </div>
           
                       </div>
        
                     </div>
                      </div>
   


								
						
				
				<%
    HttpSession sessionstatus = request.getSession(true);
    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("Expenses Position Updated Successfully!")) {
        response.sendRedirect("provident-fund.jsp");
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
<!-- Include your JavaScript libraries here -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slimscroll.min.js"></script>
<script src="js/select2.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>