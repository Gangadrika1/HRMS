<form action="./AddTraining_TypeSrv" method="post">
<div id="add_trainingtype" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add New</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								
									<div class="form-group">
										<label>Type <span class="text-danger">*</span></label>
										<!-- <input name="type"  class="form-control" type="text"> -->
										 <input name="type" id="type" required class="form-control" type="text" oninput="validateName(this.value, 'typeError')">
                                   <span id="typeError" style="display: none; color: red;"></span>
                              
									</div>
									<div class="form-group">
										<label>Description <span class="text-danger">*</span></label>
										<textarea name="description" class="form-control" rows="4"></textarea>
									</div>
									<div class="form-group">
										<label class="col-form-label">Status</label>
										<select name="Status" class="select">
											<option>Active</option>
											<option>Inactive</option>
										</select>
									</div>
									<div class="submit-section">
										<button class="btn btn-primary submit-btn">Submit</button>
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
        if (!validateName(document.getElementById('type').value, 'typeError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
       

        // If the form is not valid, display errors and prevent form submission
        if (!isValid) {
            // Display errors or perform any other necessary actions
            return false; // Prevent form submission
        }

        // If the form is valid, you can submit the form
        return true;
    }
</script>
				
				<%   response.sendRedirect("training-type.jsp"); %>