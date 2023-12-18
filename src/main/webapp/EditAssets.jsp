<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.weblabs.service.impl.AssetDAO" %>
<%@ page import="com.weblabs.beans.AssetsBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
 <%@page import="com.weblabs.service.impl.SupplierDAO"%>
<%@ page import="com.weblabs.beans.SupplierBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Assets</title>
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
    
     <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
 </head>
<body>

<% 
    int start = 0;
    int limit = 25;

    String idFilter = request.getParameter("id"); // Make sure the parameter name matches your form
    List<AssetsBean> assets = null; // Initialize the list as empty

    String whereClause = ""; // Initialize an empty whereClause

    if (idFilter != null && !idFilter.isEmpty()) {
        whereClause += "id = '" + idFilter + "'";
    }

    if (!whereClause.isEmpty()) {
        // Apply the whereClause condition
        assets = AssetDAO.getFilteredAssets(whereClause, start, limit);
    }

    if (assets != null && !assets.isEmpty()) {
    	AssetsBean asset = assets.get(0); // Access the first element
        if (asset != null) {
%> 

   

 
 <div class="main-wrapper">
        <!-- Header -->
        <!-- Include your header HTML here -->
        <%@ include file="header.jsp" %>

        <!-- Sidebar -->
        <!-- Include your sidebar HTML here -->
       <jsp:include page="sidebar.jsp" />

        <!-- Page Wrapper -->
        <div class="page-wrapper">
            <!-- Page Content -->
            <div class="content container-fluid">
                <!-- Page Header -->
                <div class="page-header">
                    <form action="./EditAssetsSrv" method="post">
              		<div class="row">
									 									
					<div class="col-md-6">
											<div class="form-group">
												<label class="col-form-label">Id <span class="text-danger">*</span></label>
												<input name="id" value="<%= asset.getId() %>" required class="form-control" type="text" readonly>
                       
											</div>
										</div> 
					 									
										<div class="col-md-6">
											<div class="form-group">
												
												<label class="col-form-label">Asset Name <span class="text-danger">*</span></label>
													<input name="asset_name" value="<%= asset.getAssetName() %>" required class="form-control" type="text" >
                                             </div>
										</div>
										
									</div>
									<div class="row">
									
										<div class="col-md-6">
											<div class="form-group">
												
												<label class="col-form-label">Purchase Date <span class="text-danger">*</span></label>
													
												<input name="purchase_date" value="<%= asset.getPurchaseDate() %>" required class="form-control" type="text" >
                                        </div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												
												<label for="supplier_id" class="col-form-label">supplierID <span class="text-danger">*</span></label>
													
											<%-- 	<input name="supplier_id" value="<%= asset.getSupplierID() %>" required class="form-control" type="text" > --%>
                       
                       
                       

        <select required name="supplier_id" class="select" id="supplier_id" >
            <%
               String selectedClientId = asset.getSupplierID();
                List<SupplierBean> dept = SupplierDAO.getAllSuppliers();
                for (SupplierBean client : dept) {
            %>
            <option value="<%= client.getSupplierName()%>" <%= (selectedClientId != null && selectedClientId.equals(client.getSupplierID())) ? "selected" : "" %>><%= client.getSupplierName() %></option>
            <%
                }
            %>
        </select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												
												<label class="col-form-label">Manufacturer <span class="text-danger">*</span></label>
													
												<input name="manufacturer" value="<%= asset.getManufacturer()%>" required class="form-control" type="text" >
                       
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
											
												<label class="col-form-label">Model<span class="text-danger">*</span></label>
													
													<input name="model" value="<%= asset.getModel() %>" required class="form-control" type="text" >
                       
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												
												<label class="col-form-label">Status<span class="text-danger">*</span></label>
												
												<select name="status" class="select">
													<option value="0">Pending</option>
													<option value="1">Approved</option>
													<option value="2">Deployed</option>
													<option value="3">Damaged</option>
												</select>
											</div>
										</div>
										<%-- <div class="col-md-6">
											<div class="form-group">
												<label>Supplier</label>
												
												<input name="supplier" value="<%= asset.getSupplier() %>" required class="form-control" type="text" >
                       
											</div>
										</div> --%>
										<div class="col-md-6">
											<div class="form-group">
											
												<label class="col-form-label">Condition<span class="text-danger">*</span></label>
													
												<input name="condition" value="<%= asset.getAssetCondition() %>" required class="form-control" type="text" >
                       
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
											
												<label class="col-form-label">Warranty <span class="text-danger">*</span></label>
													
						           <input name="warranty" value="<%= asset.getWarranty() %>" required class="form-control" type="text" >
                       
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												
												<label class="col-form-label">Value/Price <span class="text-danger">*</span></label>
													
												<input name="value" value="<%= asset.getPrice()%>" required class="form-control" type="text" >
                       
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												
												<label class="col-form-label">Asset User<span class="text-danger">*</span></label>
												<input name="asset_user" value="<%= asset.getAssetUser()%>" required class="form-control" type="text" >
												<!-- <select name="asset_user" class="select">
													<option>John Doe</option>
													<option>Richard Miles</option>
												</select> -->
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												
												<label class="col-form-label">Description<span class="text-danger">*</span></label>
													
												<input name="description" value="<%= asset.getDescription() %>" required class="form-control" type="text" >
                       
											</div>
										</div>
										
										<%-- <div class="col-md-6">
											<div class="form-group">
												<label>Date/Time</label>
												<input name="dt" value="<%= asset.getDateTime() %>" required class="form-control" type="text" >
                       
											</div>
										</div> --%>
										
									</div>	
 
                        <div class="submit-section">
                            <button type="submit" name="update_assets" class="btn btn-primary submit-btn">Update</button>
                        </div>
          
                    </form>
                </div>
            </div>
        </div>
    </div>

 
<%
    HttpSession sessionstatus = request.getSession(true);
    if (sessionstatus.getAttribute("status") != null && sessionstatus.getAttribute("status").equals("provident found Position Updated Successfully!")) {
        response.sendRedirect("Assets.jsp");
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