<form action="./EditEmpSalarySrv" method="post">
<div id="edit_salary" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered modal-md" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Edit Staff Salary</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								
									<div class="row"> 
										<div class="col-sm-6"> 
											<div class="form-group">
												<label>Select Staff</label>
												<select name="empid" required  class="select">
													 <option value="1">1</option>
                                                      <option value="2">2</option>
                                                         <option value="3">3</option>
												</select>
											</div>
										</div>
										<div class="col-sm-6"> 
											<label>Net Salary</label>
											<input  name="netsalary" class="form-control" type="text" >
										</div>
									</div>
									<div class="row"> 
										<div class="col-sm-6"> 
											<h4 class="text-primary">Earnings</h4>
											<div class="form-group">
												<label>Basic</label>
												<input  name="basic" class="form-control" type="text" >
											</div>
											<div class="form-group">
												<label>DA(40%)</label>
												<input  name="da" class="form-control" type="text" >
											</div>
											<div class="form-group">
												<label>HRA(15%)</label>
												<input  name="hra" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Conveyance</label>
												<input  name="conveyance" class="form-control" type="text" >
											</div>
											<div class="form-group">
												<label>Allowance</label>
												<input  name="allowance" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Medical  Allowance</label>
												<input  name="medicalallowance" class="form-control" type="text">
											</div>
											
										</div>
										<div class="col-sm-6">  
											<h4 class="text-primary">Deductions</h4>
											<div class="form-group">
												<label>TDS</label>
												<input  name="tds" class="form-control" type="text">
											</div> 
											<div class="form-group">
												<label>ESI</label>
												<input  name="esi" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>PF</label>
												<input  name="pf" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Leave</label>
												<input  name="leave" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Prof. Tax</label>
												<input  name="proftax" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Labour Welfare</label>
												<input  name="labourwelfare" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Fund</label>
												<input  name="fund" class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Others</label>
												<input  name="others" class="form-control" type="text">
											</div>
										</div>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Save</button>
									</div>
							
							</div>
						</div>
					</div>
				</div>
				</form>