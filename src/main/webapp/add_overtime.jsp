<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>
<form action="./AddovertimeSrv" method="post">
<div id="add_overtime" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Overtime</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<!-- <div class="form-group">
										<label> ID <span class="text-danger">*</span></label>
										<input name="id" required class="form-control" type="text">
									</div> -->
							<div class="modal-body">
								
									<div class="form-group">
										<label> Employee ID<span class="text-danger">*</span></label>
										<select id="selectedEmployee" name="Employee" class="form-control">
                                 
                                <%
											List<EmployeeBean> dept = EmployeeDAO.getAllEmployees();
											for(EmployeeBean dep: dept)
											{
											%>
                                           <option><%= dep.getEmployee_ID() %></option>
                                        <%
                          					}
									     %>                       
                            </select>
									</div>
									<div class="form-group">
										<label>Overtime Date <span class="text-danger">*</span></label>
										<input class="form-control" name="OverTime_Date" required type="date">
									</div>
									<div class="form-group">
										<label>Overtime Type <span class="text-danger">*</span></label>
										<input name="Type" required class="form-control " type="text">
									</div>

									<div class="form-group">
										<label>Overtime Hours <span class="text-danger">*</span></label>
										<input name="Hours" required class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>Description <span class="text-danger">*</span></label>
										<textarea name="Description" required rows="4" class="form-control"></textarea>
									</div>
									<div class="submit-section">
										<button name="add_overtime" type="submit" class="btn btn-primary submit-btn">Submit</button>
									</div>
								
							</div>
						</div>
					</div>
				</div>
</form>
<% response.sendRedirect("payroll-items.jsp"); %>