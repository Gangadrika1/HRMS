<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <!-- Add your CSS and JavaScript includes here -->
</head>
<body>

<form action="./AddExpensessSrv" method="post">
<div id="add_expenses" class="modal custom-modal fade" role="dialog">
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
										<div class="col-md-6">
											<div class="form-group">
												<label>Purchase From</label>
												<input name="PurchaseFrom" class="form-control" type="text">
											</div>
										</div>
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
												<select name="PurchasedBy" class="select">
													<option>Daniel Porter</option>
													<option>Roger Dixon</option>
												</select>
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
	     // Redirect to employee.jsp
             <%   response.sendRedirect("expenses.jsp"); %>
   
  
</body>
</html>			