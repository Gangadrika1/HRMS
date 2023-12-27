<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="com.weblabs.beans.Payroll" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html lang="en">
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
                            <h3 class="page-title">Payslip List</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Payslip List</li>
                            </ul>
                        </div>
                        <!-- Other content goes here -->
                    </div>
                </div>
                <!-- /Page Header -->
                
               <!-- Search Filter -->
		<form action="./PayslipSearchSRV" method="post"> 
  		
                <div class="row filter-row">
                 <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus">
                            <label for="Employee_Id">Employee ID :</label>
                            <input type="text" name="Employee_Id" id="year">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus">
                            <label for="year">Year :</label>
                            <input type="text" name="year" id="year">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus select-focus">
                            <label for="month">Month :</label>
                            <input type="text" name="month" id="month">
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <input type="submit" value="Search">
                    </div>
                </div>
                	 <input type="hidden"  name="start" value="<%= currentPage %>">
       	 			<input type="hidden"  name="limit" value="<%= newRecordsPerPage %>">
	
       	       <div class="col-sm-6 col-md-3">
			       <label>Records per page:</label>
			       <select id="recordsPerPage" onchange="changeRecordsPerPage()">
					    <option value="5">5</option>
					    <option value="10">10</option>
					    <option value="20">20</option>
					   <option value="50">50</option>
					</select>
				
			       </div>
	</form>  
<table>
    <tr>
        <th>Emaployee ID</th>
        <th>Employee Name</th>
        <th>Date Of Join</th>
        <th>Mobile Number</th>
        <th>Payroll Year</th>
        <th>Payroll Month</th>
        <th>Payslips</th>
    </tr>
    <%
   /*  System.out.println("Year Parameter: " + request.getParameter("year"));
    System.out.println("Month Parameter: " + request.getParameter("month"));
 */
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
		    String Employee_Id= request.getParameter("Employee_Id");
            String year  = request.getParameter("year");
            String month= request.getParameter("month");
            
            int calyear= 0;
            int intmonth= 0;
            List<Object> emp;
         
            String whereClause = ""; // Initialize an empty whereClause
            if (Employee_Id != null && !Employee_Id.isEmpty()) {
                whereClause = "employees.Employee_Id like '%" + Employee_Id +"%'";
            }

            
            if (year  != null && !year .isEmpty()) {
            	 calyear = Integer.parseInt(year);
                whereClause = "year = " + calyear  ;
            }
          /*   else
            {
                calyear = Calendar.getInstance().get(Calendar.YEAR);
            	 whereClause = "year = " + calyear  ;
            } */
            
            if (month != null && !month.isEmpty()) {
                if (!whereClause.isEmpty()) {
                	intmonth= Integer.parseInt(month);
                    whereClause += " or month = "+ intmonth;
                }
                //whereClause += "month = " + intmonth  ;
            }
            
            //page
            int recordcount= EmployeeDAO.totalCount();
            String empid = null;
           noOfPages = (int) Math.ceil((double) recordcount / limit);
           //pagee
            
            if (!whereClause.isEmpty()) {
                // Apply the whereClause condition
                emp = EmployeeDAO.getFilteredEmployeePayroll(whereClause, start, limit);
            } else {
                // Retrieve all data based on the limit
                emp = EmployeeDAO.getFilteredEmployeePayroll("", start, limit);
            }
            Map<String, Integer> columnIndices = (Map<String, Integer>) request.getAttribute("columnIndices");
             for (int i = 0; i < emp.size(); i++) {
                Object object = emp.get(i);
                if (object instanceof Object[]) {
                    Object[] employeeData = (Object[]) object;
                    %>
                    <tr>
                <%try{%>
		    <td><%= employeeData[0] %></td>
		    <td><%= employeeData[3] %></td>
		    <td><%= employeeData[8] %></td>
		    <td><%= employeeData[5] %></td>
		    <td><%= employeeData[10] %></td>
		    <td><%= employeeData[9] %></td>
		   
		    <td><a href="salary-view.jsp?id=<%= employeeData[0] %>&year=<%= employeeData[10] %>&month=<%= employeeData[9] %>">Payslip View</a></td>
              </tr>
                <% }catch (Exception e) {
                    // Handle exceptions
                    e.printStackTrace();
                }
                
                }
                   }
             %>
      
</table>

<div class="row justify-content-center align-items-center">
    <% if (pageno > 1) { %>
        <a href="PayslipList.jsp?page=<%=pageno - 1%>">Previous</a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%= i %>
        <% } else { %>
            <a href="PayslipList.jsp?page=<%=i%>"><%="&nbsp;&nbsp;&nbsp;" + i + "&nbsp;&nbsp;"%></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="PayslipList.jsp?page=<%=pageno + 1%>">Next</a>
    <% } %>
</div>

            </div>
            <!-- /Page Content -->
        
            <!-- Add Client Modal -->
            <!-- Add Client Modal content goes here -->
            <!-- /Add Client Modal -->
            
            <!-- Edit Client Modal --> 
            <!-- Edit Client Modal content goes here -->
            <!-- /Edit Client Modal -->
            
            <!-- Delete Client Modal -->
            <!-- Delete Client Modal content goes here -->
            <!-- /Delete Client Modal -->
            
        </div>
        <!-- /Page Wrapper -->
        
    </div>
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
    
    
    <script>
$(document).ready(function () {
    // Function to change records per page
    function changeRecordsPerPage() {
        var recordsPerPageSelect = $("#recordsPerPage");
        var selectedValue = recordsPerPageSelect.val();

        var form = $("<form>")
            .attr("method", "POST")
            .attr("action", "./PayslipSearchSRV");

        var inputRecordsPerPage = $("<input>")
            .attr("type", "hidden")
            .attr("name", "limit") // Change here from newRecordsPerPage to limit
            .val(selectedValue);

        var inputCurrentPage = $("<input>")
            .attr("type", "hidden")
            .attr("name", "start")
            .val("<%=currentPage%>");

        form.append(inputRecordsPerPage, inputCurrentPage);
        $("body").append(form);

        // Submit the form
        form.submit();
    }

    // Attach the changeRecordsPerPage function to the change event of the recordsPerPage select
    $("#recordsPerPage").change(function () {
        changeRecordsPerPage();
    });
});
</script>
</body>
</html>
