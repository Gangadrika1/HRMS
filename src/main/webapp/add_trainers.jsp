<form action="AddTrainingSrv" method="post">
	<div id="add_trainer" class="modal custom-modal fade" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add New Trainer</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">First Name <span
									class="text-danger">*</span></label>
								<!-- <input name="firstname" class="form-control" type="text"> -->
								<input name="firstname" id="firstname" required
									class="form-control" type="text"
									oninput="validateName(this.value, 'firstnameError')"> <span
									id="firstnameError" style="display: none; color: red;"></span>

							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Last Name</label>
								<!-- <input name="lastname" class="form-control" type="text"> -->
								<input name="lastname" id="lastname" required
									class="form-control" type="text"
									oninput="validateName(this.value, 'lastnameError')"> <span
									id="lastnameError" style="display: none; color: red;"></span>

							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Role <span
									class="text-danger">*</span></label>
								<!-- <input name="role" class="form-control" type="text"> -->
								<input name="role" id="role" required class="form-control"
									type="text" oninput="validateName(this.value, 'roleError')">
								<span id="roleError" style="display: none; color: red;"></span>

							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Email <span
									class="text-danger">*</span></label>
								<!-- <input name="email" class="form-control" type="email"> -->
								<input name="email" id="email" required class="form-control"
									type="text" oninput="validateEmail(this.value, 'emailError')">
								<span id="emailError" style="display: none; color: red;"></span>

							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Phone </label>
								<!-- <input name="phone" class="form-control" type="text"> -->
								<input name="phone" id="phone" required class="form-control"
									type="text"
									oninput="validateContactNumber(this.value, 'phoneError')">
								<span id="phoneError" style="display: none; color: red;"></span>

							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label class="col-form-label">Status</label> <select
									name="status" class="select">
									<option>Active</option>
									<option>Inactive</option>
								</select>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Description <span class="text-danger">*</span></label>
								<textarea name="description" class="form-control" rows="4"></textarea>
							</div>
						</div>
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
        if (!validateName(document.getElementById('lastname').value, 'lastnameError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
        if (!validateName(document.getElementById('firstname').value, 'firstnameError')) {
            isValid = false;
        }
        
        if (!validateName(document.getElementById('role').value, 'roleError')) {
            isValid = false;
        }
        
        if (!validateContactNumber(document.getElementById('phone').value, 'phoneError')) {
            isValid = false;
        }

        if (!validateEmail(document.getElementById('email').value, 'emailError')) {
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

<%   response.sendRedirect("trainers.jsp"); %>