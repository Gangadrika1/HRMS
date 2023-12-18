<form action="./DeleteExpensesSrv">
<div class="modal custom-modal fade" id="delete_expense" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Delete Expense</h3>
									<p>Are you sure want to delete?</p>
								</div>
								<div class="form-group">
				                <label>ID <span class="text-danger">*</span></label>
				                <input name="id" required class="form-control" type="text">
				                </div>
								<div class="modal-btn delete-action">
									<div class="row">
										<div class="col-6">
											<button  class="btn btn-primary continue-btn">Delete</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form>