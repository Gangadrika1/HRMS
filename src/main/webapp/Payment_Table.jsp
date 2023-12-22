<%@ page import="com.weblabs.service.impl.PaymentDAO" %>
<%@ page import="com.weblabs.service.impl.PartialPaymentDAO" %>
<%@ page import="com.weblabs.beans.PaymentBean" %>
<%@ page import="com.weblabs.beans.PartialPaymentBean" %>
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
    <title>Payments - HRMS admin template</title>

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

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/tstyles.css">
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
  
  
<!-- <style>
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        .hidden {
    display: none;
}
    </style> -->
     <style>
    /* Some basic styling for the table */
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
    .child {
      display: none; /* Hide child rows initially */
    }
    .childTable {
      margin-left: 20px; /* Indent child table */
    }
  </style>
    
  
</head>

<body>
<!-- Other scripts for jQuery, Bootstrap, etc. -->
  

    <!-- filtering records -->
    <%
    HttpSession sessionRec = request.getSession(true);

    String recordsPerPageStr = (String) sessionRec.getAttribute("recordsPerPage");
    String currentPageStr = (String) sessionRec.getAttribute("currentPage");

    if (recordsPerPageStr == null || "0".equals(recordsPerPageStr)) {
        recordsPerPageStr = "5";
        sessionRec.setAttribute("recordsPerPage", recordsPerPageStr);
    }
    int recordsPerPage = Integer.parseInt(recordsPerPageStr);

    if (currentPageStr == null || "0".equals(currentPageStr)) {
        currentPageStr = "1";
        sessionRec.setAttribute("currentPage", currentPageStr);
    }
    int currentPage = Integer.parseInt(currentPageStr);

    int newRecordsPerPage = 5;
    String newRecordsPerPageParam = request.getParameter("newRecordsPerPage");
    if (newRecordsPerPageParam != null) {
        newRecordsPerPage = Integer.parseInt(newRecordsPerPageParam);
        sessionRec.setAttribute("recordsPerPage", String.valueOf(newRecordsPerPage));
    }
    %>

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
                            <h3 class="page-title">Payments</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Payments</li>
                            </ul>
                        </div>
                        <div class="col-auto float-right ml-auto">
                            <a href="create_payment.jsp" class="btn add-btn"><i class="fa fa-plus"></i> Create Payments</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <!-- Parent Table -->
                            <table  class="table table-striped custom-table" id="parentTable">
                                <thead>
                                    <tr>
                                        
                                        <th>Payment ID</th>
                                        <th>client_Username</th>
                                        <th>invoice_id</th>
                                        <th>payment_amt</th>
                                        <th>due_date</th>
                                        
                                        <th style="text-align: center;" colspan="2">Actions</th>
                                       </tr>
                                </thead>
                                <tbody>
                                    <%
                                    int start = 0;
                                    int limit = 25;
                                    String usernameFilter = request.getParameter("username");
                                    String idFilter = request.getParameter("id");
                                    List<PaymentBean> resultSet;

                                    String whereClause = ""; // Initialize an empty whereClause

                                    if (usernameFilter != null && !usernameFilter.isEmpty()) {
                                        whereClause = "username = '" + usernameFilter + "'";
                                    }

                                    if (idFilter != null && !idFilter.isEmpty()) {
                                        if (!whereClause.isEmpty()) {
                                            whereClause += " AND ";
                                        }
                                        whereClause += "Id = '" + idFilter + "'";
                                    }

                                    if (!whereClause.isEmpty()) {
                                        // Apply the whereClause condition
                                        resultSet = PaymentDAO.getFilteredPayment(whereClause, start, limit);
                                    } else {
                                        // Retrieve all data based on the limit
                                        resultSet = PaymentDAO.getFilteredPayment("", start, limit);
                                    }
                           
                                        
                                  for (int i = 0; i < resultSet.size(); i++) {
                                	  PaymentBean invoice = resultSet.get(i);
                                    %>
                                    <tr  class="parentRow">
                                      
                                        <!-- Parent table data -->
                                        <td class="toggle"><%= invoice.getPayment_id()%></td>
                                        <td class="toggle"><%= invoice.getClient_username() %></td>
                                        <td class="toggle"><%= invoice.getInvoice_id() %></td>
                                        <td class="toggle"><%= invoice.getPayment_amt() %></td>
                                        <td class="toggle"><%= invoice.getDue_date() %></td>
                                        
                                        <td>
                                      <a href="edit_invoice.jsp?id=<%= invoice.getPayment_id() %>">Edit</a>
                                       </td>
                                        
                                    </tr>
										<!-- Child Table for Invoice Items -->
								 	<tr class="child">
										    <td></td> <!-- Empty column for consistency with the header -->
										    <td colspan="12">
										        <table class="childTable">
										            <thead>
										                <tr>
										                    <!-- Child table headers -->
										                    
										                   <th>Amount Paid</th>
														<th>payment_date</th>
														<th>Balance_Amt</th>
										                </tr>
										            </thead>
										            <tbody>
										                <% 
										                    List<PartialPaymentBean> invoiceItems = PartialPaymentDAO.getPartialPaymentByPayment(invoice.getPayment_id());
										                    for (PartialPaymentBean invoiceItem : invoiceItems) {
										                %>
										                <tr>
										                    <!-- Child table data -->
										                    
										                    <td><%= invoiceItem.getAmount_paid() %></td>
										                    <td><%= invoiceItem.getPayment_date()%></td>
										                    <td><%= invoiceItem.getBalance_amt() %></td>
										                   
										                </tr>
										                <%
										                    } 
										                %>
										            </tbody>
										        </table>
										    </td>
										</tr>

                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
  // Toggle child rows on clicking parent rows
 
  document.addEventListener('DOMContentLoaded', function () {
    // Toggle child rows on clicking parent rows
    const parentRows = document.querySelectorAll('.parentRow');

    parentRows.forEach(row => {
      row.addEventListener('click', () => {
        const childRow = row.nextElementSibling;
        childRow.classList.toggle('child');
      });
    });
  });
</script>


   
    
</body>
</html>
     
          
          
          
          
          
          
          
          
          
          
          
          
          
          
                