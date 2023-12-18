<%@page import="com.weblabs.service.impl.AddClientsDAO"%>
<%@ page import="com.weblabs.beans.AddClient" %>
<%@page import="com.weblabs.service.impl.EmployeeDAO"%>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>	

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" integrity="sha512-Z4jEgrIGWSE5m4e0MmxXo9amii9K4ksAqJHkDzQJDDOV+3+mr8zUo0PvP47qcKE3hNYFVNPikD5MZAgAIdFJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha512-Gn5384xq/58AcB8tJDrabOTtJ5zL04+2bYxIc+2PF3zS3lXtmUjNBeyGv3PpHqccqGCVlFJ6pqu/5t5aU3dfRg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" integrity="sha512-OiE1TD7q2dbUd4bZaRlQ5I1oUiwVw0CLOlKzgAdRxyA1zHdA+f9exSOJ7Sy3i8qOb/sMr3JNtr6CceVcn9Vbrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    function validateDates() {
        var startDateStr = document.getElementsByName("startdate")[0].value;
        var endDateStr = document.getElementsByName("enddate")[0].value;

        var startDate = new Date(startDateStr);
        var endDate = new Date(endDateStr);

        if (startDate > endDate) {
            alert("End date must be after the start date.");
            return false;
        }

        return true;
    }
</script>

<form action="./AddProjectSrv" method="post" onsubmit="return validateDates();">
	<div id="create_project" class="modal custom-modal fade" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Create Project</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Project Name</label> 
								<input name="projectname" id="projectname" class="form-control" type="text">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
											<label>Client Username<span class="text-danger">*</span></label>
											<select required name="Clientid" class="select">
                                           <!--    <input type="hidden" id="departmentIdInput" name="departmentId" value="">  -->
                                             <%
											List<AddClient> dept = AddClientsDAO.getAllClient();
											for(AddClient dep: dept)
											{
											%>
                                           <option  value="<%= dep.getClientID() %>"><%= dep.getUsername()%></option>
                                        <%
                          					}
									     %>
                                    </select>
										</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Start Date</label>
								 <input name="startdate" id="startdate" class="form-control" type="date">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>End Date</label>
								 <input name="enddate" id="enddate" class="form-control" type="date">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group">
								<label>Rate</label>
								 <input name="rate" id="rate" placeholder="$50" class="form-control" type="text">
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label>Hourly/Fixed</label> 
								<select name="hourly" id="hourly" class="select">
									<option>Hourly</option>
									<option>Fixed</option>
								</select>
							</div>
						</div>
                      </div>
						
							<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Priority</label>
								 <select name="priority" id="priority" class="select">
									<option>High</option>
									<option>Medium</option>
									<option>Low</option>
								</select>
							</div>
						</div>
					
						<div class="col-sm-6">
							<div class="form-group">
								<label> Project Leader</label>
								<!--  <input name="projectleader" class="form-control" type="text"> -->
								 <select  id="selectedEmployee" name="projectleader" class="form-control">
                                
                                <%
											List<EmployeeBean> deptt = EmployeeDAO.getAllEmployees();
											for(EmployeeBean dep: deptt)
											{
											%>
                                           <option><%= dep.getEmployee_ID() %></option>
                                        <%
                          					}
									     %>                       
                            </select>
                            
							</div>
						</div>
				        </div>


					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Add Team</label>
								<!--  <input name="addteam"	class="form-control" type="text" id="addteam" > -->
								 
								  <select class="two" multiple style=" width:300px;"  id="selectedEmployee" name="addteam">
                                 
                                <%
											List<EmployeeBean> depttt = EmployeeDAO.getAllEmployees();
											for(EmployeeBean dep: depttt)
											{
											%>
                                           <option><%= dep.getUsername() %></option>
                                        <%
                          					}
									     %>                       
                            </select>
							</div>
						</div>
<script>
    $(document).ready(function() {
        $('.two').select2({
            multiple: true
        });
    });
</script>

				
					<div class="col-sm-6">
						<div class="form-group">
							<label>Description</label>
							<input name="description"	class="form-control" type="text" id="description" >
						</div>
					</div>
					</div>
					
					
                     <div class="row">
					<div class="col-sm-6">
						<!--  <div class="form-group">
							<label>Upload Files</label> 
							<input name="uploadfile" id="uploadfile" class="form-control" type="file">
						</div>  -->
						
						<div class="submit-section">
							<button type="submit" class="btn btn-primary submit-btn">Submit</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</form>
