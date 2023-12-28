package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddAddition;
import com.weblabs.service.impl.AddAdditionServiceimpl;


@WebServlet("/EditAdditionServlet")
public class EditAdditionServlet {

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
	        String status = "Edit Additions Failed!"; 
	        String id= request.getParameter("id");
	        String name = request.getParameter("name");
	        String category = request.getParameter("category");
	        String unitcalculation = request.getParameter("unitcalculation");
	        String unitamount = request.getParameter("unitamount");
	        
	        AddAddition dept = new AddAddition();
	        dept.setPayroll_id(id);
	        dept.setAdditionName(name);
	        dept.setCategory(category);
	        dept.setUnitcalculation(unitcalculation);
	        dept.setUnitAmount(unitamount);

	        AddAdditionServiceimpl dao = new AddAdditionServiceimpl();
	   
	        status = dao.editaddition(id, name, category, unitcalculation, unitamount);

	        RequestDispatcher rd = request.getRequestDispatcher("departments.jsp?message=" + status);
	        rd.forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
}
