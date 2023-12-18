<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>

<form action="./AddPromotionSrv" method="post">
<div id="add_promotion" class="modal custom-modal fade" role="dialog">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add Promotion</h5>
								<button type="button" class="close" name="addpromotion" required data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								
								<!-- <div class="form-group">
										<label> ID <span class="text-danger">*</span></label>
										<input name="id" required class="form-control" type="text">
									</div> -->
									<div class="form-group">
										<label>Promotion For <span class="text-danger">*</span></label>
										<!-- <input name="promotionfor" required class="form-control" type="text"> -->
										<select id="promotionfor" name="promotionfor" class="form-control">
                                 
                                <%
											List<EmployeeBean> dept = EmployeeDAO.getAllEmployees();
											for(EmployeeBean dep: dept)
											{
											%>
                                           <option><%= dep.getUsername() %></option>
                                        <%
                          					}
									     %>                       
                            </select>
									</div>
									<div class="form-group">
										<label>Promotion From <span class="text-danger">*</span></label>
										<input name="promotionfrom" required class="form-control" type="text" value="Web Developer" readonly>
									</div>
									<div class="form-group">
										<label>Promotion To <span class="text-danger">*</span></label>
										<select class="select" name="promotionto" required>
											<option>Web Developer</option>
											<option>Web Designer</option>
											<option>SEO Analyst</option>
										</select>
									</div>
									<div class="form-group">
										<label>Promotion Date <span class="text-danger">*</span></label>
										<!-- <div class="cal-icon">
											<input name="promotiondate" required type="text" class="form-control datetimepicker">
										</div> -->
										
										<div class="col-sm-6">
											<div class="form-group">
												<label>End Date <span class="text-danger">*</span></label>
												<input name="promotiondate" class="form-control" type="date">
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
				<%   response.sendRedirect("promotion.jsp"); %>