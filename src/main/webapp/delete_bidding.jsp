<!-- <form action="./DeleteBiddingSrv" method="post">
<div class="modal custom-modal fade" id="delete_bidding" role="dialog">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-header">
									<h3>Delete Bidding</h3>
									<p>Are you sure want to delete?</p>
								</div>
								<div class="form-group">
				                 <label> Bidding ID <span class="text-danger">*</span></label>
				                 <input name="id" required class="form-control" type="text">
				                           </div>
								<div class="modal-btn delete-action" >
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
				</form> -->
				
				
				
				
				
				
				
				<!DOCTYPE html>
<html>
<head>
    <title>Delete Bidding Form</title>
</head>
<body>

<!-- Script to automatically trigger deletion when the page loads -->
<script>
    window.addEventListener('load', function() {
        // Extract the 'id' parameter from the URL
        var urlParams = new URLSearchParams(window.location.search);
        var employeeId = urlParams.get('id');
console.log("you have entered deleteEmployee");
        // Make an AJAX request to delete the employee
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DeleteBiddingSrv', true);
        console.log("DeleteBiddingSrv called");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('id=' + employeeId);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Handle the response if needed
                var response = xhr.responseText;
                console.log(response); // You can log the response to the console
            }
        };
    });
</script>
console.log("you are about to leaves.jsp");
<%   response.sendRedirect("bidding.jsp"); %>
</body>
</html>
				