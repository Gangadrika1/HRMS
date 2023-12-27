

package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddRolesBean;
import com.weblabs.service.impl.rolesServiceImpl;
			
@WebServlet("/EditRolesSrv")
public class EditRolesSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


   	 String status = "Add Failed!";
 
   	 String RoleID = request.getParameter("RoleID");
        String RoleName = request.getParameter("rolename");
        String Description= request.getParameter("description");
      
        AddRolesBean obj = new AddRolesBean();
    
     obj.setRoleID(RoleID);
     obj.setRoleName(RoleName);
     obj.setDescription(Description);
     
     rolesServiceImpl ass =new rolesServiceImpl();
     status=ass.editRole( RoleID,RoleName, Description );
    
        RequestDispatcher rd = request.getRequestDispatcher("edit_roles.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}




