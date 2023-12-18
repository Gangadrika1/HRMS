<%@ page import="com.weblabs.service.impl.InvoiceDAO" %>
<%@ page import="com.weblabs.beans.AddInvoice" %>
<%@ page import="com.weblabs.beans.AddInvoiceItems" %>
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
    <title>Invoices - HRMS admin template</title>

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
                            <h3 class="page-title">Invoices</h3>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Invoices</li>
                            </ul>
                        </div>
                        <div class="col-auto float-right ml-auto">
                            <a href="create-invoice.jsp" class="btn add-btn"><i class="fa fa-plus"></i> Create Invoice</a>
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
                                        
                                        <th>Invoice ID</th>
                                        <th>Client idddd</th>
                                        <th>Project</th>
                                        <th>Email</th>
                                        <th>Tax</th>
                                        <th>Client Address</th>
                                        <th>Billing Address</th>
                                        <th>Invoice Date</th>
                                        <th>Due Date</th>
                                        <th>OtherInformation</th>
                                        <th>Discount</th>
                                        <th>Tax Amount</th>
                                        <th>Grand Total</th>
                                        <th style="text-align: center;" colspan="2">Actions</th>
                                       </tr>
                                </thead>
                                <tbody>
                                    <%
                                    int start = 0;
                                    int limit = 25;
                                    String usernameFilter = request.getParameter("username");
                                    String idFilter = request.getParameter("id");
                                    List<AddInvoice> resultSet;

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
                                        resultSet = InvoiceDAO.getFilteredInvoices(whereClause, start, limit);
                                    } else {
                                        // Retrieve all data based on the limit
                                        resultSet = InvoiceDAO.getFilteredInvoices("", start, limit);
                                    }
                           
                                        
                                  for (int i = 0; i < resultSet.size(); i++) {
                                        AddInvoice invoice = resultSet.get(i);
                                    %>
                                    <tr  class="parentRow">
                                      
                                        <!-- Parent table data -->
                                        <td class="toggle"><%= invoice.getId()%></td>
                                        <td class="toggle"><%= invoice.getClient() %></td>
                                        <td class="toggle"><%= invoice.getProject() %></td>
                                        <td class="toggle"><%= invoice.getEmail() %></td>
                                        <td class="toggle"><%= invoice.getTax() %></td>
                                        <td class="toggle"><%= invoice.getClientAddress() %></td>
                                        <td class="toggle"><%= invoice.getBillingAddress() %></td>
                                        <td class="toggle"><%= invoice.getInvoicedate() %></td>
                                        <td class="toggle"><%= invoice.getDueDate() %></td>
                                        <td class="toggle"><%= invoice.getOtherInformation() %></td>
                                        <td class="toggle"><%= invoice.getDiscount() %></td>
                                        <td class="toggle"><%= invoice.getTaxamount() %></td>
                                        <td class="toggle"><%= invoice.getGrandtotal() %></td>
                                        <td>
                                      <a href="edit_invoice.jsp?id=<%= invoice.getId() %>">Edit</a>
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
										                    
										                    <th>Item</th>
										                    <th>Description</th>
										                    <th>UnitCost</th>
										                    <th>Quantity</th>
										                    <th>Amount</th>
										                </tr>
										            </thead>
										            <tbody>
										                <% 
										                    List<AddInvoiceItems> invoiceItems = InvoiceDAO.getInvoiceItemsByInvoiceId(invoice.getId());
										                    for (AddInvoiceItems invoiceItem : invoiceItems) {
										                %>
										                <tr>
										                    <!-- Child table data -->
										                    
										                    <td><%= invoiceItem.getItem() %></td>
										                    <td><%= invoiceItem.getDescription() %></td>
										                    <td><%= invoiceItem.getUnitCost() %></td>
										                    <td><%= invoiceItem.getQty() %></td>
										                    <td><%= invoiceItem.getAmount() %></td>
										                    
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
