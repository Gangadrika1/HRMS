<form action="./DeleteAdditionServlet" method="post">
<div class="modal custom-modal fade" id="delete_addition" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Delete Addition</h3>
									<p>Are you sure want to delete?</p>
								</div>
								 <div class="form-group">
										<label>Addition ID <span class="text-danger">*</span></label>
										<input name="id" required class="form-control" type="text">
									</div>
								<div class="modal-btn delete-action">
									<div class="row">
										<div class="col-6">
											 <button href="delete_addition.jsp?delid=<%= request.getParameter("id") %>" class="btn btn-primary continue-btn">Delete</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>