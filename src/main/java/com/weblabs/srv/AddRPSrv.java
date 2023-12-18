
package com.weblabs.srv;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddRPServiveImpl;

@WebServlet("/AddRPSrv")
public class AddRPSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    
    	 String status = "Add rp Failed!";
    	
         String RoleID = request.getParameter("roleid");
         String ModuleName = request.getParameter("module name");
         String FormName= request.getParameter("formname");
         String PermissionType= request.getParameter("permissiontype");
         
    
         AddRPServiveImpl ass =new AddRPServiveImpl();
         status=ass.addRP(RoleID, ModuleName, FormName, PermissionType);
         
     		  
     		   RequestDispatcher rd = request.getRequestDispatcher("rolepermission.jsp?message=" + status);
        rd.forward(request, response);
     } 
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {

         doGet(request, response);
     }
 }