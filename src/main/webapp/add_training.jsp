<%@page import="com.weblabs.service.impl.AddTrainersDAO"%>
<%@page import="com.weblabs.service.impl.EmployeeDAO"%>
<%@page import="com.weblabs.beans.EmployeeBean"%>
<%@page import="com.weblabs.beans.AddTrainers"%>
<%@page import="com.weblabs.service.impl.AddTraining_TypeDAO"%>
<%@page import="com.weblabs.beans.AddTraining_Type"%>
<%@ page import="com.weblabs.service.impl.AddTrainingDAO" %>
<%@ page import="com.weblabs.beans.AddTraining" %>
<%@ page import="java.util.List" %>
<form action="./AddTrainingServlet">
<div id="add_training" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add New Training</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Training Type</label>
												<select required name="Type" class="select">
                                              <%
                                           List<AddTraining_Type> trainingTypes = AddTraining_TypeDAO.getAlltrainingtype();
											for(AddTraining_Type dep: trainingTypes)
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
												<label class="col-form-label">Trainer</label>
												<select required name="Trainer" class="select">
                                              <%
                                           List<AddTrainers> trainer = AddTrainersDAO.getAlltrainer();
											for(AddTrainers dep: trainer)
											{
											%>
                                           <option  value="<%= dep.getId()%>"> <%= dep.getFirstname()%> </option>
                                        <%
                          					}
									     %>
                                                    </select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Employees</label>
												  <select id="selectedEmployee" name="Employees" class="form-control">
                                 
                                                <%
											List<EmployeeBean> dept = EmployeeDAO.getAllEmployees();
											for(EmployeeBean dep: dept)
											{
											%>
                                           <option  value="<%= dep.getEmployee_ID()%>"><%= dep.getUsername() %></option>
                                        <%
                          					}
									     %>                       
                                          </select>
                        </div>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label class="col-form-label">Training Cost <span class="text-danger">*</span></label>
												<input name="TrainingCost" class="form-control" type="text">
											</div>
										</div>
										<div class="form-group">
									    <label for="starting_at">Starting From <span class="text-danger">*</span></label>
									    <input id="starting_at" name="StartingDate" class="form-control" type="date">
									</div>
										<div class="form-group">
									    <label for="ending_at">Ending At <span class="text-danger">*</span></label>
									    <input id="starting_at" name="EndingDate" class="form-control" type="date">
									</div>
										
										<div class="col-sm-12">
											<div class="form-group">
												<label>Description <span class="text-danger">*</span></label>
												<textarea name="Description" class="form-control" rows="4"></textarea>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label class="col-form-label">Status</label>
												<select name="Status" class="select">
													<option>Active</option>
													<option>Inactive</option>
												</select>
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
				<%   response.sendRedirect("training.jsp"); %>