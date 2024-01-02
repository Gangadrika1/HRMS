package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.beans.AddDepartment;
import com.weblabs.service.impl.AddDepartmentImpl;
			
@WebServlet("/EditDepartmentSrv")
public class EditDepartmentSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    //public UpdateEmployeeSrv() {
       // super();
   // }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      //  HttpSession session = request.getSession();
      //  String userType = (String) session.getAttribute("usertype");
      //  String userName = (String) session.getAttribute("username");
      //  String password = (String) session.getAttribute("password");

       // if (userType == null || !userType.equals("admin")) {
          //  response.sendRedirect("login.jsp?message=Access Denied, Login As Admin!!");
           // return;
       // } else if (userName == null || password == null) {
           // response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
          //  return;
        //}

        // Login success
        String status = "Edit department Failed!"; 
        String id= request.getParameter("DepartmentId");
        String department = request.getParameter("department");
        

        AddDepartment dept = new AddDepartment();
        dept.setid(id);
        dept.setDepartmentName(department);

        AddDepartmentImpl dao = new AddDepartmentImpl();
   
        status = dao.editdepartment(id,department);

        RequestDispatcher rd = request.getRequestDispatcher("departments.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}