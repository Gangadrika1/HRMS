<%-- <%@page import="com.weblabs.service.impl.SupplierDAO"%>
<%@ page import="com.weblabs.beans.SupplierBean" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" con+99tent="width=device-width, initial-scale=1.0">
    <title>Add Asset</title>
    
    <script src="js/validateForm.js"></script>
</head>
<body>
   <form action="./AddAssetsSrv" method="post" onsubmit="return validateForm()">
    
        <div id="AddAssets" class="modal custom-modal fade" role="dialog">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Asset</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Asset Name</label>
                                    <input name="asset_name" id="asset_name" required class="form-control" type="text" oninput="validateName(this.value, 'asset_nameError')">
                                    <span id="asset_nameError" style="display: none; color: red;"></span>
                                </div>
                            </div>
                            <!-- Other form fields... -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Supplier ID</label>
                                    <select required name="supplier_id" class="select">
                                        <%
                                        List<SupplierBean> projectNames = SupplierDAO.getAllSuppliers();
                                        for (SupplierBean projectName : projectNames) {
                                        %>
                                        <option value="<%= projectName.getSupplierID()%>"><%= projectName.getSupplierID()%></option>
                                        <%
                                        }
                                        %>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Manufacture</label>
                                    <!-- <input name="manufacturer" class="form-control" type="text"> -->
                                     <input name="manufacturer" id="manufacturer" required class="form-control" type="text" oninput="validateName(this.value, 'manufacturerError')">
                                   <span id="manufacturerError" style="display: none; color: red;"></span>
                              
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Model</label>
                                    <input name="model" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Status</label>
                                    <!-- <input name="status" class="form-control" type="text"> -->
                                    <input name="status" id="status" required class="form-control" type="text" oninput="validateName(this.value, 'statusError')">
                                   <span id="statusError" style="display: none; color: red;"></span>
                              
                                    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Asset Condition</label>
                                    <!-- <input name="condition" class="form-control" type="text"> -->
                                     <input name="condition" id="condition" required class="form-control" type="text" oninput="validateName(this.value, 'conditionError')">
                                   <span id="conditionError" style="display: none; color: red;"></span>
                              
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Warrantty</label>
                                   <!--  <input name="warranty" class="form-control" type="text"> -->
                                   <input name="warranty" id="warranty" required class="form-control" type="text" oninput="handleWarrantyInput(this.value, 'warrantyError')">
                                   <span id="warrantyError" style="display: none; color: red;"></span>
                              
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="value" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Asset User</label>
                                    <!-- <input name="asset_user" class="form-control" type="text"> -->
                                    <input name="asset_user" id="asset_user" required class="form-control" type="text" oninput="validateName(this.value, 'asset_userError')">
                                   <span id="asset_userError" style="display: none; color: red;"></span>
                              
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Description</label>
                                    <input name="description" class="form-control" type="text">
                                </div>
                            </div>
                            
                            
                           
                         <div class="submit-section">
            <button type="submit" name="add_asset" class="btn btn-primary submit-btn">Submit</button>
        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
<script>


    function validateForm(event) {
        event.preventDefault(); // Prevent form submission by default

        var isValid = true;

        // Perform validation for each field
        if (!validateName(document.getElementById('asset_name').value, 'asset_nameError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
        if (!validateName(document.getElementById('manufacturer').value, 'manufacturerError')) {
            isValid = false;
        }
        
        if (!validateName(document.getElementById('status').value, 'statusError')) {
            isValid = false;
        }

        if (!validateName(document.getElementById('condition').value, 'conditionError')) {
            isValid = false;
        }
        
        if (!validateName(document.getElementById('asset_user').value, 'asset_userError')) {
            isValid = false;
        }
        if (!validateName(document.getElementById('asset_user').value, 'asset_userError')) {
            isValid = false;
        }

        if (!validateWarranty(document.getElementById('warranty').value, 'warrantyError')) {
            isValid = false;
        }

        // If the form is not valid, display errors and prevent form submission
        if (!isValid) {
            // Display errors or perform any other necessary actions
            return false; // Prevent form submission
        }

        // If the form is valid, you can submit the form
        return true;
    }
</script>
    <!-- Include necessary CSS and JS files here if not already included -->
</body>
</html>
 --%>
 
 <%@page import="com.weblabs.service.impl.SupplierDAO"%>
<%@ page import="com.weblabs.beans.SupplierBean" %>
<%@page import="com.weblabs.service.impl.EmployeeDAO"%>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Asset</title>
    
     <script  src="js/validateForm.js"></script>
    
</head>
<body>
<form action="./AddAssetsSrv" method="post">
    <div id="AddAssets" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Asset</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   
                        <div class="row">
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Asset Name</label>
                                    <!-- <input name="asset_name" class="form-control" type="text"> -->
                                    <input name="asset_name" id="asset_name" required class="form-control" type="text" oninput="validateName(this.value, 'asset_nameError')">
                                   <span id="asset_nameError" style="display: none; color: red;"></span>
                              
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Purches Date</label>
                                    <input name="purchase_date" class="form-control" type="date">
                                </div>
                            </div>
                            <!-- <div class="col-md-6">
                                <div class="form-group">
                                    <label>Supplier ID</label>
                                    <input name="supplier_id" class="form-control" type="text">
                                </div>
                            </div> -->
                            
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Supplier ID</label>
                                      <select required name="supplier_id" class="select">
                                              <%
                                             List<SupplierBean> projectNames = SupplierDAO.getAllSuppliers(); // Retrieve project names
                                             
                                             for (SupplierBean projectName : projectNames) {
                                         %>
                                         <option  value="<%= projectName.getSupplierID()%>"><%= projectName.getSupplierID()%></option>
                                         <%
                                             }
                                         %>
									     </select>
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Manufacture</label>
                                    <!-- <input name="manufacturer" class="form-control" type="text"> -->
                                     <input name="manufacturer" id="manufacturer" required class="form-control" type="text" oninput="validateName(this.value, 'manufacturerError')">
                                   <span id="manufacturerError" style="display: none; color: red;"></span>
                              
                                </div>
                            </div>
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Model</label>
                                    <input name="model" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Status</label>
                                    <!-- <input name="status" class="form-control" type="text"> -->
                                    <input name="status" id="status" required class="form-control" type="text" oninput="validateName(this.value, 'statusError')">
                                   <span id="statusError" style="display: none; color: red;"></span>
                              
                                    
                                </div>
                            </div>
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Asset Condition</label>
                                    <!-- <input name="condition" class="form-control" type="text"> -->
                                     <input name="condition" id="condition" required class="form-control" type="text" oninput="validateName(this.value, 'conditionError')">
                                   <span id="conditionError" style="display: none; color: red;"></span>
                              
                                </div>
                            </div>
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Warrantty</label>
                                   <!--  <input name="warranty" class="form-control" type="text"> -->
                                   <input name="warranty" id="warranty" required class="form-control" type="text" oninput="handleWarrantyInput(this.value, 'warrantyError')">
                                   <span id="warrantyError" style="display: none; color: red;"></span>
                              
                                </div>
                            </div>
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="value" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Asset User</label>
                                    <!-- <input name="asset_user" class="form-control" type="text"> -->
                                    <!-- <input name="asset_user" id="asset_user" required class="form-control" type="text" oninput="validateName(this.value, 'asset_userError')">
                                   <span id="asset_userError" style="display: none; color: red;"></span>
                                    -->
                                    <select required name="asset_user" class="select">
                                              <%
                                             List<EmployeeBean> projectNamee = EmployeeDAO.getAllEmployees(); // Retrieve project names
                                             
                                             for (EmployeeBean projectName : projectNamee) {
                                         %>
                                         <option  value="<%= projectName.getEmployee_ID()%>"><%= projectName.getEmployee_ID()%></option>
                                         <%
                                             }
                                         %>
									     </select>
                              
                                </div>
                            </div>
                            <div class="col-md-15">
                                <div class="form-group">
                                    <label>Description</label>
                                    <input name="description" class="form-control" type="text">
                                </div>
                            </div>
                            
                            
                           <!--  <div class="col-md-6">
                                <div class="form-group">
                                    <label>supplier</label>
                                    <input name="Supplier" class="form-control" type="text">
                                </div>
                            </div> -->
                            
                            <!--  <div class="col-md-6">
                                <div class="form-group">
                                    <label>AppliedDate</label>
                                    <input name="applied_date" class="form-control" type="text">
                                </div>
                            </div> -->
                        </div>
                        <!-- ... (rest of the form fields) ... -->
                        <div class="submit-section">
                            <button type="submit" name="add_asset" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                 
                </div>
            </div>
        </div>
    </div>
</form>
<script>


    function validateForm(event) {
        event.preventDefault(); // Prevent form submission by default

        var isValid = true;

        // Perform validation for each field
        if (!validateName(document.getElementById('asset_name').value, 'asset_nameError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
        if (!validateName(document.getElementById('manufacturer').value, 'manufacturerError')) {
            isValid = false;
        }
        
        if (!validateName(document.getElementById('status').value, 'statusError')) {
            isValid = false;
        }

        if (!validateName(document.getElementById('condition').value, 'conditionError')) {
            isValid = false;
        }
        
        if (!validateName(document.getElementById('asset_user').value, 'asset_userError')) {
            isValid = false;
        }
        if (!validateName(document.getElementById('asset_user').value, 'asset_userError')) {
            isValid = false;
        }

        if (!validateWarranty(document.getElementById('warranty').value, 'warrantyError')) {
            isValid = false;
        }

        // If the form is not valid, display errors and prevent form submission
        if (!isValid) {
            // Display errors or perform any other necessary actions
            return false; // Prevent form submission
        }

        // If the form is valid, you can submit the form
        return true;
    }
</script>
    <!-- Include necessary CSS and JS files here if not already included -->
</body>
</html>


 
 
 
    