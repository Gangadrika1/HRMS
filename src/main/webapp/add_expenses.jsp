<%@page import="com.weblabs.service.impl.SupplierDAO"%>
<%@page import="com.weblabs.beans.SupplierBean"%>
<%@ page import="java.util.List" %>
<form action="./AddExpensessSrv" method="post" >
<div id="add_expense" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Expense</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Item Name</label>
												<!-- <input name="ItemName" class="form-control" type="text"> -->
												 <input name="ItemName" id="ItemName" required class="form-control" type="text" oninput="validateName(this.value, 'ItemNameError')">
                                   <span id="ItemNameError" style="display: none; color: red;"></span>
                              
												
											</div>
										</div>
										<!-- <div class="col-md-6">
											<div class="form-group">
												<label>Purchase From</label>
												<input name="PurchaseFrom" class="form-control" type="text">
											</div>
										</div> -->
										
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Purchase Date</label>
												<div class="cal-icon">
												<input name="PurchaseDate" class="form-control datetimepicker" type="text"></div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Purchased By </label>
												<!-- <input name="PurchasedBy" class="form-control" type="text"> -->
												 <input name="PurchasedBy" id="PurchasedBy" required class="form-control" type="text" oninput="validateName(this.value, 'PurchasedByError')">
                                   <span id="PurchasedByError" style="display: none; color: red;"></span>
                              
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Amount</label>
												<input name="Amount" placeholder="$50" class="form-control" type="number">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Paid By</label>
												<select name="PaidBy" class="select">
													<option>Cash</option>
													<option>Cheque</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Status</label>
												<select name="Status" class="select">
													<option>Pending</option>
													<option>Approved</option>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Attachments</label>
												<input name="Attachments" class="form-control" type="file">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Supplier Name</label>
												<select required name="Supplierid" class="form-control" class="select">
                                                        <%
											List<SupplierBean> dept = SupplierDAO.getAllSuppliers(); 
											for(SupplierBean dep: dept)
											{
											%>
                                           <option  value="<%= dep.getSupplierID() %>"><%= dep.getSupplierName() %></option>
                                        <%
                          					}
									     %>
                                    </select>
												
											</div>
										</div>
										
									</div>
									<div class="attach-files">
										<ul>
											<li>
												<img src="assets/img/placeholder.jpg" alt="">
												<a href="#" class="fa fa-close file-remove"></a>
											</li>
											<li>
												<img src="assets/img/placeholder.jpg" alt="">
												<a href="#" class="fa fa-close file-remove"></a>
											</li>
										</ul>
									</div>
									
									
									<div class="submit-section">
										<!-- <button class="btn btn-primary submit-btn">Submit</button> -->
										<button type="submit" class="btn btn-primary submit-btn">Submit</button>
    
									</div>
							</div>
						</div>
					</div>
				</div>
				</form>
				 <script src="js/validateForm.js"></script>
				
				<script>
    function validateForm(event) {
        event.preventDefault(); // Prevent form submission by default

        var isValid = true;

        // Perform validation for each field
        if (!validateName(document.getElementById('ItemName').value, 'ItemNameError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
        if (!validateName(document.getElementById('PurchasedBy').value, 'PurchasedByError')) {
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
				
				<%   response.sendRedirect("expenses.jsp"); %>
				
				
				
				
<%-- <%@page import="com.weblabs.service.impl.SupplierDAO"%>
<%@page import="com.weblabs.beans.SupplierBean"%>
<%@ page import="java.util.List" %>
<form action="./AddExpensessSrv" method="post">
<div id="add_expense" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Expense</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Item Name</label>
												<input name="ItemName" class="form-control" type="text">
											</div>
										</div>
										<!-- <div class="col-md-6">
											<div class="form-group">
												<label>Purchase From</label>
												<input name="PurchaseFrom" class="form-control" type="text">
											</div>
										</div> -->
										
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Purchase Date</label>
												<div class="cal-icon">
												<input name="PurchaseDate" class="form-control datetimepicker" type="text"></div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Purchased By </label>
												<input name="PurchasedBy" class="form-control" type="text">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Amount</label>
												<input name="Amount" placeholder="$50" class="form-control" type="text">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Paid By</label>
												<select name="PaidBy" class="select">
													<option>Cash</option>
													<option>Cheque</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Status</label>
												<select name="Status" class="select">
													<option>Pending</option>
													<option>Approved</option>
												</select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Attachments</label>
												<input name="Attachments" class="form-control" type="file">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Supplier Name</label>
												<select required name="Supplierid" class="form-control" class="select">
                                                        <%
											List<SupplierBean> dept = SupplierDAO.getAllSuppliers(); 
											for(SupplierBean dep: dept)
											{
											%>
                                           <option  value="<%= dep.getSupplierID() %>"><%= dep.getSupplierName() %></option>
                                        <%
                          					}
									     %>
                                    </select>
												
											</div>
										</div>
										
									</div>
									<div class="attach-files">
										<ul>
											<li>
												<img src="assets/img/placeholder.jpg" alt="">
												<a href="#" class="fa fa-close file-remove"></a>
											</li>
											<li>
												<img src="assets/img/placeholder.jpg" alt="">
												<a href="#" class="fa fa-close file-remove"></a>
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
				</form>
				<%   response.sendRedirect("expenses.jsp"); %> --%>