<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Clents</title>
    

   <script src="js/validateForm.js"></script>
   

   
   <script>
   function validateUsername(username, errorId) {
	    console.log("Duplicate Check Started");
	    // Make an AJAX call to check if the username already exists
	    $.ajax({
	        url: 'CheckUsernameServlet',
	        method: 'POST',
	        data: { username: username },
	        success: function (data) {
	            console.log("AJAX Success:", data);

	            if (data === 'duplicate') {
	                // Display an alert if the username is a duplicate
	                alert('Username is already taken. Please choose a different username.');
	                document.getElementById('Username').value = ''; // Clear the input value
	            }

	            console.log("Duplicate Check End");
	        },
	        error: function (xhr, status, error) {
	            console.error('AJAX Error:', status, error);
	        }
	    });
	}


    function validateForm(event) {
        event.preventDefault();
        var isValid = true;

        // Other field validations...

        // Validate the username
        var username = document.getElementById('Username').value;
        var usernameErrorId = 'UsernameError';
        validateUsername(username, usernameErrorId);

        // If the form is not valid, display errors and prevent form submission
        if (!isValid) {
            return false;
        }

        // If the form is valid, you can submit the form
        return true;
    }
</script>
   


</head>
<body>
<!-- <form action="./AddClientServlet" method="post" onsubmit="return validateForm()"> -->

 
<div id="add_client" class="modal custom-modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Client</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
   <form action="./AddClientServlet" method="post" onsubmit="return validateForm()">            
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                               <!--  <input name="FirstName" required class="form-control" type="text"> -->
                               <input name="FirstName" id="FirstName" required class="form-control" type="text" oninput="validateName(this.value, 'FirstNameError')">
                                   <span id="FirstNameError" style="display: none; color: red;"></span>
                              
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Last Name</label>
                                <!-- <input name="LastName" required class="form-control" type="text"> -->
                                 <input name="LastName" id="LastName" required class="form-control" type="text" oninput="validateName(this.value, 'LastNameError')">
                                   <span id="LastNameError" style="display: none; color: red;"></span>
                              
                            </div>
                        </div>
                       <!--  <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Username <span class="text-danger">*</span></label>
                                <input name="Username" required class="form-control" type="text">
                            </div>
                        </div> -->
                        
                        
                        <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-form-label">Username <span class="text-danger">*</span></label>
                            <input name="Username" required class="form-control" type="text" onblur="validateUsername(this.value, 'UserNameError')">
                        		<span id="UserNameError" style="display: none; color: red;"></span>
                        </div>
                    </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                               <!--  <input name="Email" required class="form-control floating" type="email"> -->
                               <input name="Email" id="Email" required class="form-control" type="text" oninput="validateEmail(this.value, 'EmailError')">
                                   <span id="EmailError" style="display: none; color: red;"></span>
                              
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Phone </label>
                                <!-- <input name="Phone" required class="form-control" type="text"> -->
                                 <input name="Phone" id="Phone" required class="form-control" type="text" oninput="validateContactNumber(this.value, 'PhoneError')">
                                   <span id="PhoneError" style="display: none; color: red;"></span>
                              
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Company Name</label>
                                <input name="Company" required class="form-control" type="text">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-form-label">Address</label>
                                <input class="form-control" name="Address" required type="text">
                            </div>
                        </div>
                         <div class="col-sm-6">
                        <div class="form-group">
                            <div class="custom-file">
                                <label style="margin-top: 10px;" for="">Client Picture</label><br>
                                <input name="Picture" type="file" class="custom-file-input" id="validatedCustomFile" required >
                                <label style="margin-top: 37px;"  class="custom-file-label" for="validatedCustomFile" >Choose Profile Picture...</label>
                                <div class="invalid-feedback">Example invalid custom file feedback</div>
                            </div>
                             </div>
                        </div>
                    </div>
                    <div class="submit-section">
                        <button type="submit" name="add_client" class="btn btn-primary submit-btn">Submit</button>
                    </div>
                    </form>
            </div>
        </div>
    </div>
</div>

 <script>
 
 
    function validateForm(event) {
            event.preventDefault(); // Prevent form submission by default
            var isValid = true;

            // Perform validation for each field
            if (!validateName(document.getElementById('LastName').value, 'LastNameError')) {
            	
                isValid = false;
                document.getElementById('LastName').value = '';
            }
            // Add other field validations similarly
           /*  
            if (!validateName(document.getElementById('FirstName').value, 'FirstNameError')) {
                isValid = false;
            } */
            
            if (!validateName(document.getElementById('FirstName').value, 'FirstNameError')) {
                isValid = false;
                document.getElementById('FirstName').value = ''; // Clear the input value
            }
            
            if (!validateContactNumber(document.getElementById('Phone').value, 'PhoneError')) {
                isValid = false;
                document.getElementById('Phone').value = '';
            }

            if (!validateEmail(document.getElementById('Email').value, 'EmailError')) {
                isValid = false;
                document.getElementById('Email').value = '';
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
<%   response.sendRedirect("clients.jsp"); %>
	</body>
</html>