<form action="./AddGoalTypeSrv" method="post">
<div id="add_goaltype" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add New Goal Type</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<div class="form-group">
										<label>Goal Type <span class="text-danger">*</span></label>
										<!-- <input required name="Type" class="form-control" type="text"> -->
										<input name="Type" id="Type" required class="form-control" type="text" oninput="validateName(this.value, 'TypeError')">
                                   <span id="TypeError" style="display: none; color: red;"></span>
                                 
									</div>
									<div class="form-group">
										<label>Description <span class="text-danger">*</span></label>
										<textarea required name="Description" class="form-control" rows="4"></textarea>
									</div>
									<div class="form-group">
										<label class="col-form-label">Status</label>
										<select name="Status" class="select">
											<option >Active</option>
											<option >Inactive</option>
										</select>
									</div>
									<div class="submit-section">
										<button type="submit" name="add_goal_type" class="btn btn-primary submit-btn">Submit</button>
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
        if (!validateName(document.getElementById('TypeError').value, 'TypeError')) {
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
					
				<%   response.sendRedirect("goal-type.jsp"); %>