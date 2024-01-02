<%@page import="com.weblabs.service.impl.GoalsTypeDAO"%>
<%@page import="com.weblabs.beans.AddGoalsType"%>
<%@ page import="com.weblabs.service.impl.GoalsDao" %>
<%@ page import="com.weblabs.beans.AddGoals" %>
<%@ page import="java.util.List" %>
<script>
    function validateDates() {
        var startDateStr = document.getElementsByName("StartDate")[0].value;
        var endDateStr = document.getElementsByName("EndDate")[0].value;

        var startDate = new Date(startDateStr);
        var endDate = new Date(endDateStr);

        if (startDate > endDate) {
            alert("End date must be after the start date.");
            return false;
        }

        return true;
    }
</script>
<form action="./AddGoalsSrv" method="post" onsubmit="return validateDates();">
<div id="add_goal" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Goal Tracking</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-form-label">Goal Type</label>
												 <select required name="Type" class="select">
                                             <%
											List<AddGoalsType> dept = GoalsTypeDAO.getAllGoals();
											for(AddGoalsType dep: dept)
											{
											%>
                                           <option  value="<%= dep.getId()%>"> <%= dep.getType()%></option>
                                        <%
                          					}
									     %>
                                                    </select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Subject</label>
												<!-- <input required name="Subject" class="form-control" type="text"> -->
												<input name="Subject" id="Subject" required class="form-control" type="text" oninput="validateName(this.value, 'SubjectError')">
                                   <span id="SubjectError" style="display: none; color: red;"></span>
                              
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Target Achievement</label>
												<!-- <input required name="Target" class="form-control" type="text"> -->
												<input name="Target" id="Target" required class="form-control" type="text" oninput="validateName(this.value, 'TargetError')">
                                   <span id="TargetError" style="display: none; color: red;"></span>
                              
												
											</div>
										</div>
										
										<div class="col-sm-6">
											<div class="form-group">
												<label>Start Date </label>
												<input required name="StartDate" class="form-control " type="date">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label>End Date <span class="text-danger">*</span></label>
												<input required name="EndDate" class="form-control " type="date">
											</div>
										</div>
										
										<div class="col-sm-12">
											<div class="form-group">
												<label>Description</label>
												<textarea name="Description" required class="form-control" rows="4"></textarea>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-form-label">Status</label>
												<select name="Status" class="select">
													<option value="1">Active</option>
													<option value="0">Inactive</option>
												</select>
											</div>

											<div class="col-sm-6">
												<div class="form-group">
													<label hidden class="col-form-label">Progress</label>
													<input hidden name="Progress"  class="form-control" type="text">
												</div>
											</div>
											
										</div>
									</div>
									<div class="submit-section">
										<button type="submit" class="btn btn-primary submit-btn">Submit</button>
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
        if (!validateName(document.getElementById('Subject').value, 'SubjectError')) {
            isValid = false;
        }
        // Add other field validations similarly
        
        if (!validateName(document.getElementById('Target').value, 'TargetError')) {
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
				 
				
				<%   response.sendRedirect("goal-tracking.jsp"); %>