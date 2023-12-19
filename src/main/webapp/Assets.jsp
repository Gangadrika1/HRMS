<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.AssetDAO" %>
<%@ page import="com.weblabs.beans.AssetsBean" %>
<%@ page import="java.util.List" %>
 <%@page import="com.weblabs.service.impl.SupplierDAO"%>
<%@ page import="com.weblabs.beans.SupplierBean" %>
<%
    // Getting the username from the session
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Your Description">
    <meta name="keywords" content="Your Keywords">
    <meta name="author" content="Your Author">
    <meta name="robots" content="noindex, nofollow">
    <title>Assets - Your Admin Template</title>

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

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    
    <!-- table styles CSS -->
    <link rel="stylesheet" href="css/tstyles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    
    <title>Asset List</title>
     <style>
        .page-title-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .page-title {
            text-align: center;
        }
        
    </style>
</head>
<body>
<%
HttpSession sessionRec = request.getSession(true);

// Initialize recordsPerPage and currentPage as Java variables
String recordsPerPageStr = (String) sessionRec.getAttribute("recordsPerPage");
String currentPageStr = (String) sessionRec.getAttribute("currentPage");

if (recordsPerPageStr == null || "0".equals(recordsPerPageStr)) {
    recordsPerPageStr = "5"; // Set a default value, e.g., 5
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
    // currentPage = 1; // Reset to the first page when changing recordsPerPage
    // sessionRec.setAttribute("currentPage", "1");
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

<!-- Your HTML content, including the table and pagination controls -->
<div class="content container-fluid">
    <!-- Main Wrapper -->
    <div class="main-wrapper">

        <!-- Header -->
        <jsp:include page="header.jsp" />

        <!-- Sidebar -->
        <jsp:include page="sidebar.jsp" />

        <!-- Page Wrapper -->
        <div class="page-wrapper">
            <!-- Page Content -->
           
                <!-- Page Header -->
                <div class="page-header">
                    <div class="row align-items-center">
                        <div class="col">
                            <h3 class="page-title">Assets</h3>
                         <%--   <div id="welcomeMessage" style="text-align: center; margin-top: 20px; font-size: 24px;">
                                Welcome <%= username %>
                            </div> --%> 
                             <br>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Assets</li>
                            </ul>
                       </div>
                        
                        <div class="col-auto float-right ml-auto">
                            <a href="#" class="btn add-btn" data-toggle="modal" data-target="#AddAssets"><i class="fa fa-plus"></i> Add Asset</a>
                         <!--    <div class="view-icons"> -->
       <!--                          <a href="asset.jsp" title="Grid View" class="grid-view btn btn-link active"><i class="fa fa-th"></i></a>
                                <a href="assets-list.jsp" title="Tabular View" class="list-view btn btn-link"><i class="fa fa-bars"></i></a> -->
                            </div>
                        </div>
                  </div> 
               
                <!-- Search form -->
                 <form action="./AssetSearchSrv" method="post">
                 
                 		<div class="form-container">
                    <div class="form-row filter-row">
                        <div class="col-sm-6 col-md-3">
                            <div class="form-group form-focus">
                                <label for="assetName">Asset Name:</label>
                                <input type="text" name="assetName" id="assetName">
                            </div>
                        </div>
  
                        <div class="col-sm-6 col-md-3">
                            <div class="form-group form-focus select-focus">
                                <label for="assetId">ID:</label>
                                <input style="margin-top: 29px;" type="text" name="Id" id="assetId">
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-3 ">
                            <input style="margin-top: 29px;" type="submit" value="Search">
                        </div>
                   </div>
                    </div>
                  <br>
                    <input type="hidden" name="start" value="<%= currentPage %>">
                    <input type="hidden" name="limit" value="<%= newRecordsPerPage %>">
                    <div class="col-sm-6 col-md-3" id = "flag">
                        <label>Records per page:</label>
                        <select id="recordsPerPage" onchange="changeRecordsPerPage()">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="50">50</option>
                        </select>
                    </div>
                </form>
               <div class="table-container" style="height: 400px; overflow-x: auto;">
       <table>
                <tr>
                
                    <th>ID</th>
                    <th>Asset Name</th>
                    <th>Purchase Date</th>
                    <th>supplierName</th>
                    <th>Manufacturer</th>
                    <th>Model</th>
                    <th>Status</th>
                    <th>Asset Condition</th>
                    <th>Warranty</th>
                    <th>Price</th>
                    <th>Asset User</th>
                    <th>Description</th>
                    <th>DateTime</th>
                     <th>EDIT</th>
                      <th>DELETE</th>
                    
                  
                </tr>
                <%
                    int start = currentPage;
                    int limit = newRecordsPerPage;

                    // Pagination code start
                    int pageno = 1;
                    int noOfPages = 0;

                    String pageNoStr = request.getParameter("page");

                    if (pageNoStr != null) {
                        pageno = Integer.parseInt(pageNoStr);
                    }

                    start = (pageno - 1) * limit;
                    // Pagination code ended

                    String assetNameFilter = request.getParameter("assetName");
                    String assetIdFilter = request.getParameter("Id");

                    List<AssetsBean> assets;

                    String whereClause = ""; // Initialize an empty whereClause

                    if (assetNameFilter != null && !assetNameFilter.isEmpty()) {
                        whereClause = "assetName like '%" + assetNameFilter + "%'";
                    }

                    if (assetIdFilter != null && !assetIdFilter.isEmpty()) {
                        if (!whereClause.isEmpty()) {
                            whereClause += " or ";
                        }
                        whereClause += "Id = '" + assetIdFilter + "'";
                    }

                    // Pagination
                    int recordcount = AssetDAO.totalCount();
                    noOfPages = (int) Math.ceil((double) recordcount / limit);

                    if (!whereClause.isEmpty()) {
                        // Apply the whereClause condition
                        assets = AssetDAO.getFilteredAssets(whereClause, start, limit);
                    } else {
                        // Retrieve all data based on the limit
                        assets = AssetDAO.getFilteredAssets("", start, limit);
                    }

                    for (AssetsBean asset : assets) {
                    	
                    	 SupplierBean supplier = SupplierDAO.getSupplierById(asset.getSupplierID());
                    	
                %>
                <tr>
                    <td><%= asset.getId() %></td>
                    <td><%= asset.getAssetName() %></td>
                    <td><%= asset.getPurchaseDate() %></td>
                    <%-- <td><%= asset.getSupplierID() %></td> --%>
                    <td><%= supplier != null ? supplier.getSupplierName() : "N/A" %></td>
                    <td><%= asset.getManufacturer() %></td>
                    <td><%= asset.getModel() %></td>
                    <td><%= asset.getStatus() %></td>
                    <td><%= asset.getAssetCondition() %></td>
                    <td><%= asset.getWarranty() %></td>
                    <td><%= asset.getPrice() %></td>
                    <td><%= asset.getAssetUser() %></td>
                    <td><%= asset.getDescription() %></td>
                    <td><%= asset.getDateTime() %></td>
                    <td>

 
 <a href="EditAssets.jsp?id=<%= asset.getId() %>">Edit</a>
    </td>
		    <td>
	 	 <a href="DeleteAssetSrv?id=<%= asset.getId() %>">Delete</a>
		 
		    </td>
		</tr>
		       
		        <%
		            }
		        %>
    </table>
    </div>
    </div>
						</div>
					</div>
    
    <div class="row justify-content-center align-items-center" id = "flag1">
    <!-- Pagination links -->

    <% if (pageno > 1) { %>
        <a href="Assets.jsp?page=<%=pageno - 1%>">Previous</a>
    <% } %>

    <% for (int i = 1; i <= noOfPages; i++) { %>
        <% if (i == pageno) { %>
            <%=i%>
        <% } else { %>
            <a href="Assets.jsp?page=<%=i%>"><%=i%></a>
        <% } %>
    <% } %>

    <% if (pageno < noOfPages) { %>
        <a href="Assets.jsp?page=<%=pageno + 1%>">Next</a>
    <% } %>
   
   </div>
</div>
</div>
   
     <jsp:include page="AddAssets.jsp" />
     <!-- Include your Add Employee Modal HTML here -->
    
    <!-- Include your Add Holiday Modal HTML here -->
     
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

    <!-- Datetimepicker JS -->
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>

    <!-- Custom JS -->
    <script src="js/app.js"></script>
    
   
  
<script>
    $(document).ready(function () {
        $("#filterButton").click(function () {
            // Get filter criteria (username and id)
            var usernameFilter = $("#username").val();
            var idFilter = $("#id").val();
            
            // Make an AJAX request to the server
            $.ajax({
                type: "POST", // Use POST or GET depending on your servlet configuration
                url: "./AssetSearchServlet",
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
    var initialResultCount = (parseInt('<%= request.getAttribute("Assets") %>') == 'null') ? -1 : parseInt('<%= request.getAttribute("Assets") %>');
    console.log(initialResultCount);
    updateFooterVisibility(initialResultCount);
</script>
</body>
</html>
   
   
   
   
   