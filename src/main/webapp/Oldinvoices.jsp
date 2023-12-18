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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/tstyles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
 
   <style>
.hidden {
        display: none;
    }
</style> 
</head>

<body>
<!-- Other scripts for jQuery, Bootstrap, etc. -->

<script>
    $(document).ready(function() {
        function toggleChildTable(button) {
            var invoiceId = $(button).data('row');
            var childTable = $('.child-row[data-row="' + invoiceId + '"]');
            var childRow = childTable.closest('.child-row');
            console.log(childRow);
            childRow.toggleClass('hidden');
        }

        $(document).on('click', 'button[data-row]', function() {
            toggleChildTable(this);
        });
    });
</script>


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
                <!-- /Page Header -->

                <!-- Search Filter -->
                <div class="row filter-row">
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus">
                            <div class="cal-icon">
                                <label>Invoice ID:</label>
                                <input class="form-control floating datetimepicker" type="text">
                            </div>
                            <label class="focus-label">From</label>
                        </div>
                    </div>

                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus">
                            <div class="cal-icon">
                                <label>Client:</label>
                                <input class="form-control floating datetimepicker" type="text">
                            </div>
                            <label class="focus-label">To</label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="form-group form-focus select-focus">
                            <select class="select floating">
                                <option>Select Status</option>
                                <option>Pending</option>
                                <option>Paid</option>
                                <option>Partially Paid</option>
                            </select>
                            <label class="focus-label">Status</label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <a href="#" class="btn btn-success btn-block"> Search </a>
                    </div>
                </div>
                <br><br>
                <!-- /Search Filter -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <!-- Parent Table -->
                            <table class="table table-striped custom-table" id="parentTable">
                                <thead>
                                    <tr>
                                        <th>Action</th>
                                        <th>Invoice ID</th>
                                        <th>Client</th>
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
                                    <tr>
                                        <td>
                                            <!-- Add a button to expand/collapse child records -->
                                           <%--  <button  data-row="<%= i %>" onclick="toggleChildTable()">+</button>    --%>
                                         
                                           <button data-row="<%= invoice.getId() %>" onclick="toggleChildTable(this)">+</button>

                                                                                                                      
                                        </td>
                                        <!-- Parent table data -->
                                        <td><%= invoice.getId()%></td>
                                        <td><%= invoice.getClient() %></td>
                                        <td><%= invoice.getProject() %></td>
                                        <td><%= invoice.getEmail() %></td>
                                        <td><%= invoice.getTax() %></td>
                                        <td><%= invoice.getClientAddress() %></td>
                                        <td><%= invoice.getBillingAddress() %></td>
                                        <td><%= invoice.getInvoicedate() %></td>
                                        <td><%= invoice.getDueDate() %></td>
                                        <td><%= invoice.getOtherInformation() %></td>
                                        <td><%= invoice.getDiscount() %></td>
                                        <td><%= invoice.getTaxamount() %></td>
                                        <td><%= invoice.getGrandtotal() %></td>
                                    </tr>
										<!-- Child Table for Invoice Items -->
									<tr class="child-row hidden" data-row="<%= invoice.getId() %>">
										    <td></td> <!-- Empty column for consistency with the header -->
										    <td colspan="12">
										        <table id="childTable_<%= invoice.getId() %>" class="table table-striped custom-table child-table">
										            <thead>
										                <tr>
										                    <!-- Child table headers -->
										                    <th>Invoice ID</th>
										                    <th>Item</th>
										                    <th>Description</th>
										                    <th>UnitCost</th>
										                    <th>Quantity</th>
										                    <th>Amount</th>
										                </tr>
										            </thead>
										            <tbody class="hidden">
										                <% 
										                    List<AddInvoiceItems> invoiceItems = InvoiceDAO.getInvoiceItemsByInvoiceId(invoice.getId());
										                    for (AddInvoiceItems invoiceItem : invoiceItems) {
										                %>
										                <tr>
										                    <!-- Child table data -->
										                    <td><%= invoiceItem.getInvoiceid() %></td>
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
        var recordsPerPage = <%= recordsPerPage %>; // Use Java variable in JavaScript
        var currentPage = <%=currentPage %>;

        function changeRecordsPerPage() {
            var recordsPerPageSelect = document.getElementById("recordsPerPage");
            var selectedValue = recordsPerPageSelect.value;

            // Update the URL with the selected "recordsPerPage" value and navigate to it
            var baseUrl = window.location.href.split('?')[0];
            var newUrl = baseUrl + '?newRecordsPerPage=' + selectedValue;
            window.location.href = newUrl;
        }
    </script>
    
</body>
</html>
