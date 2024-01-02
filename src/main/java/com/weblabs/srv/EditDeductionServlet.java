package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddDeductions;
import com.weblabs.service.impl.AddDeductionServiceImpl;

@WebServlet("/EditDeductionServlet")
public class EditDeductionServlet extends HttpServlet{
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	 String status = "Edit department Failed!"; 
     String id= request.getParameter("id");
     String Name= request.getParameter("name");
     String unitcalculation = request.getParameter("unitcalculation");
     String unitamout =request.getParameter("unitamount");

     AddDeductions dept = new AddDeductions();
     dept.setPayroll_id(id);
     dept.setDeductionName(Name);
     dept.setUnitcalculation(unitcalculation);
     dept.setUnitAmount(unitamout);

     AddDeductionServiceImpl dao = new AddDeductionServiceImpl();

      status = dao.editDeduction(id, Name, unitcalculation, unitamout);

     RequestDispatcher rd = request.getRequestDispatcher("departments.jsp?message=" + status);
     rd.forward(request, response);
 }

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     doGet(request, response);
 }
}

