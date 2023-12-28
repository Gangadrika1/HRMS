<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="./AddRolesSrv" method="post">
    <div id="addemployee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Roles</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Role Name<span class="text-danger">*</span></label>
                                    <input name="rolename" required class="form-control" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Description</label>
                                    <input name="description" required class="form-control" type="text">
                                </div>
                            </div>
                            
                             <div class="submit-section">
                            <button type="submit" name="add_role" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                          </div>
                      </div>
                    </div>
               </div>
           </div>
         </form>

         
         <form action="./EditRoleSrv" method="post">
    <div id="addemployee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Update Roles</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                
                <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">RoleID</label>
                                    <input name="roleId" required class="form-control" type="text">
                                </div>
                            </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Role Name<span class="text-danger">*</span></label>
                                    <input name="rolename" required class="form-control" type="text">
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Description</label>
                                    <input name="description" required class="form-control" type="text">
                                </div>
                            </div>
                             <div class="submit-section">
                            <button type="submit" name="edit_role" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                            
                          </div>
                      </div>
                    </div>
               </div>
           </div>
         </form>
         
         
            <form action="./DeleteRoleSrv" method="post">
    <div id="addemployee" class="modal custom-modal fade" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Roles</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-form-label">Role ID<span class="text-danger">*</span></label>
                                    <input name="roleid" required class="form-control" type="text">
                                </div>
                            </div>
                            
                          </div>
                          
                           <div class="submit-section">
                            <button type="submit" name="delete_role" class="btn btn-primary submit-btn">Submit</button>
                        </div>
                      </div>
                    </div>
               </div>
           </div>
         </form>
         
     </body>
</html> --%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Coming Soon</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Set the body height to viewport height for centering */
            font-family: Arial, sans-serif;
        }
        h2 {
            font-size: 24px;
            color: #333;
        }
    </style> 
</head>
<body>
    <!-- Header -->
    <jsp:include page="header.jsp" />
    <!-- Include your header HTML here -->

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />
    <!-- Include your sidebar HTML here -->

    <h2>Coming Soon</h2>
</body>
</html>

