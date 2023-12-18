<!DOCTYPE html>
<<html>
<head>
<title>taxes</title>

<script  src="js/validateForm.js"></script>
</head>
<form action="./AddTaxSrv" method="post">
<div id="add_tax" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Tax tesr</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">																
									<div class="form-group">
										<label>Tax Name <span class="text-danger">*</span></label>
										<!-- <input name="taxname" required class="form-control" type="text"> -->
										 <input name="taxname" id="taxname" required class="form-control" type="text" oninput="validateName(this.value, 'taxnameError')">
                                   <span id="taxnameError" style="display: none; color: red;"></span>
                              
									</div>
									<div class="form-group">
										<label>Tax Percentage (%) <span class="text-danger">*</span></label>
										<input name="taxper" required class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Status <span class="text-danger">*</span></label>
										<select class="select" name="status" required>
											<option>Pending</option>
											<option>Approved</option>
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
				
				
				<script>
    function validateForm(event) {
        event.preventDefault(); // Prevent form submission by default

        var isValid = true;

        // Perform validation for each field
        if (!validateName(document.getElementById('taxname').value, 'taxnameError')) {
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
				
					<%   response.sendRedirect("empTaxes.jsp"); %>
				</html>