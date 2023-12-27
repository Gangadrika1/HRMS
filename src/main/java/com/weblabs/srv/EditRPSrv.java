package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddRolePermissionBean;
import com.weblabs.service.impl.AddRPServiveImpl;
			

@WebServlet("/EditRPSrv")
public class EditRPSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status1 = "rp Failed!";
        String rolepermissionId= request.getParameter("RolePermissionID");
        String roleid = request.getParameter("roleid");
        String modulename = request.getParameter("modulename");
        String formname = request.getParameter("formname");
        String permissiontype = request.getParameter("permissiontype");
        

          AddRolePermissionBean role = new AddRolePermissionBean();
          role.setRolePermissionID(rolepermissionId);
          role.setRoleID(roleid);
          role.setModuleName(modulename);
          role.setFormName(formname);
          role.setPermissionType(permissiontype);
        
        AddRPServiveImpl dao = new AddRPServiveImpl();
        

       status1= dao.updateRP(rolepermissionId,roleid,modulename,formname,permissiontype);

        RequestDispatcher rd = request.getRequestDispatcher("roles-permissions.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}




