<form action="./DeleteEmpsalarySrv" method="post">
<div class="modal custom-modal fade" id="delete_salary" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Delete Salary</h3>
									<p>Are you sure want to delete?</p>
								</div>
								<!-- Delete employee input fields here -->
                                   <label for="deleteid"> ID:</label>
                                           <input type="number" id="deleteid" name="deleteid" required><br>
	 							<div class="modal-btn delete-action">
									<div class="row">
										
										<div class="col-6">
											<button href="javascript:void(0);" data-dismiss="modal" class="btn btn-primary cancel-btn">Delete</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form>