<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.weblabs.service.impl.EmployeeDAO" %>
<%@ page import="com.weblabs.beans.EmployeeBean" %>
<%@ page import="java.util.List" %>

<form action="./AddResignationSrv" method="post">
    <div id="add_resignation" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Resignation</h5>
                    <button type="button" class="close" name="addresignation" required data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Resigning Employee <span class="text-danger">*</span></label>
                        <!-- <input name="resigingemp" required class="form-control" type="text"> -->
                        <select id="resigingemp" name="resigingemp" class="form-control">                                
                                <%
											List<EmployeeBean> dept = EmployeeDAO.getAllEmployees();
											for(EmployeeBean dep: dept)
											{
											%>
                                           <option value="<%= dep.getEmployee_ID()%>"><%= dep.getUsername() %></option>
                                        <%
                          					}
									     %>                       
                            </select>
                    </div>
                    <div class="form-group">
                        <label>Resignation Date <span class="text-danger">*</span></label>
                        <input type="date" name="termationdate" required class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Notice Date <span class="text-danger">*</span></label>
                        <input name="noticedate" class="form-control" type="date">
                    </div>
    <script>
    // Add JavaScript code for date validation
    document.addEventListener("DOMContentLoaded", function () {
        var terminationDateInput = document.getElementsByName("termationdate")[0];
        var noticeDateInput = document.getElementsByName("noticedate")[0];

        terminationDateInput.addEventListener("change", function () {
            validateDate();
        });

        noticeDateInput.addEventListener("change", function () {
            validateDate();
        });

        function validateDate() {
            var terminationDate = new Date(terminationDateInput.value);
            var noticeDate = new Date(noticeDateInput.value);

            if (noticeDate >= terminationDate) {
                alert("Notice date must be before termination date");
                noticeDateInput.value = ""; // Clear the notice date input
            }
        }
    });
</script>
  
                    <div class="form-group">
                        <label>Reason <span class="text-danger">*</span></label>
                        <textarea style="width: 400px;" class="form-control" name="reason" required rows="7"></textarea>
                    </div>
                    <div class="submit-section">
                        <button class="btn btn-primary submit-btn">Submit</button>
                    </div>
                </div>
            </div>
        </div>
   </div>
</form>

<% response.sendRedirect("resignation.jsp"); %>