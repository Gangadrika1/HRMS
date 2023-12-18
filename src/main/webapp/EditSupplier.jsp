<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.SupplierDAO" %>
<%@ page import="com.weblabs.beans.SupplierBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Supplier</title>
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
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <!--<![endif]-->
</head>
<body>

<%
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("supplierID");
    List<SupplierBean> tasksList = null;
    String whereClause = "";

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "supplierID = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        tasksList = SupplierDAO.getFilteredSuppliers(whereClause, start, limit);
    }

    if (tasksList != null && !tasksList.isEmpty()) {
        SupplierBean task = tasksList.get(0);

        if (task != null) {
%>

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
                <form action="./EditSupplierSrv" method="post" accept-charset="UTF-8">
                    <div class="main-wrapper">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-form-label"><span class="text-danger">*</span>supplierID</label>
                                    <input name="supplierID" required class="form-control" type="text" readonly value="<%= task.getSupplierID()%>">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-form-label">Supplier Name <span class="text-danger">*</span></label>
                                    <input name="supplierName" required class="form-control" type="text" value="<%= task.getSupplierName()%>">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-form-label">Product Details <span class="text-danger">*</span></label>
                                    <input name="productDetails" required class="form-control" type="text" value="<%= task.getProductDetails()%>">
                                </div>
                            </div>

                            <div class="submit-section">
                                <button type="submit" name="update_assets" class="btn btn-primary submit-btn">Update</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%
            HttpSession sessionstatus = request.getSession(true);
            if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("provident found Position Updated Successfully!")) {
                response.sendRedirect("supplier.jsp");
            } else {
%>
   <div class="col-sm-6">
		<p>Supplier not found with the provided details.</p>
   </div>
<%
            }
        }
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
