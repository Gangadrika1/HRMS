<form action="./AddHolidaySrv" method="post">
<div class="modal custom-modal fade" id="add_holiday" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Holiday</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<div class="form-group">
										<label>Holiday Name <span class="text-danger">*</span></label>
										<!-- <input name="Holiday_Name" class="form-control" required type="text"> -->
										 <input name="Holiday_Name" id="Holiday_Name" required class="form-control" type="text" oninput="validateName(this.value, 'Holiday_NameError')">
                                   <span id="Holiday_NameError" style="display: none; color: red;"></span>
                              
									</div>
									<div class="form-group">
										<label>Holiday Datess <span class="text-danger">*</span></label>
										<input class="form-control" name="Holiday_Date" required type="date">
									</div>
									<div class="submit-section">
										<button  type="submit" class="btn btn-primary submit-btn">Submit</button>
									</div>
							</div>
						</div>
					</div>
				</div>
</form>

<script  src="js/validateForm.js"></script>
<script>
    function validateForm(event) {
        event.preventDefault(); // Prevent form submission by default

        var isValid = true;

        // Perform validation for each field
        if (!validateName(document.getElementById('Holiday_Name').value, 'Holiday_NameError')) {
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
<%   response.sendRedirect("holidays.jsp"); %>