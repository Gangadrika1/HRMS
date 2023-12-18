<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>
<form action="./AddEmpsalarySrv" method="post">
<div id="add_salary" class="modal custom-modal fade" role="dialog">

					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Emp Salary</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>	
							<div class="modal-body">
								
									<div class="row"> 
										<div class="col-sm-6"> 
											<div class="form-group">
												<div class="form-group">
                                                  <label>Emp ID</label>
                              <select id="selectedEmployee" name="empid" class="form-control">
                                 
                                <%
											List<EmployeeBean> dept = EmployeeDAO.getAllEmployees();
											for(EmployeeBean dep: dept)
											{
											%>
                                           <option><%= dep.getEmployee_ID()%></option>
                                        <%
                          					}
									     %>                       
                            </select>                                              
                                                </div>
											</div>
										</div>
										 <!-- <div class="col-sm-6"> 
											<label>Employee Name</label>
											<input class="form-control" type="text">
										</div>  -->
									</div>
									<div class="row"> 
										<div class="col-sm-6"> 
											<h4 class="text-primary">Earnings</h4>
											<div class="form-group">
												<label>Basic</label>
												<input name="basic" required class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>DA(40%)</label>
												<input name="da" required class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>HRA(15%)</label>
												<input name="hra" required class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Conveyance</label>
												<input name="conveyance" required class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Allowance</label>
												<input name="allowance" required class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Medical  Allowance</label>
												<input name="medicalallowance" required class="form-control" type="text">
											</div>
										
											<div class="add-more">
												<a href="#"><i class="fa fa-plus-circle"></i> Add More</a>
											</div>
										</div>
										<div class="col-sm-6">  
											<h4 class="text-primary">Deductions</h4>
											<div class="form-group">
												<label>TDS</label>
												<input name="tds" required class="form-control" type="text">
											</div> 
											<div class="form-group">
												<label>ESI</label>
												<input name="esi" required class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>PF</label>
												<input name="pf" required class="form-control" type="text">
											</div>
											
											<div class="form-group">
												<label>Prof. Tax</label>
												<input name="proftax" required class="form-control" type="text">
											</div>
											<div class="form-group">
												<label>Labour Welfare</label>
												<input name="labourwelfare" required class="form-control" type="text">
											</div>
											<!-- <div class="form-group">
												<label>Others</label>
												<input name="others" readonly="readonly" required class="form-control" type="text">
											</div> -->
											<div class="add-more">
												<a href="#"><i class="fa fa-plus-circle"></i> Add More</a>
											</div>
										</div>
									</div>
									<div class="submit-section">
										<button type="submit" name="add" class="btn btn-primary submit-btn">Submit</button>
									</div>
							</div>
						</div>
					</div>
				</div>
				</form>
				<%   response.sendRedirect("salary.jsp"); %>