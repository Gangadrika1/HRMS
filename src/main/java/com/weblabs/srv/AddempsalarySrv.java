package com.weblabs.srv;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.service.impl.Addempsalaryserviceimpl;

@WebServlet("/AddEmpsalarySrv")
public class AddempsalarySrv  extends HttpServlet {

		private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

//	        HttpSession session = request.getSession();
//	        String userType = (String) session.getAttribute("usertype");
//	        String userName = (String) session.getAttribute("username");
//	        String password = (String) session.getAttribute("password");
	//
//	        if (userType == null || !userType.equals("admin")) {
//	            response.sendRedirect("login.jsp?message=Access Denied!");
//	        } else if (userName == null || password == null) {
//	            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
//	        }
	    	String status = "Add Employee Failed!";
	        String empid = request.getParameter("empid");
	        String basic = request.getParameter("basic");
	        String da = request.getParameter("da");
	        String hra = request.getParameter("hra");
	        String conveyance= request.getParameter("conveyance");
	        String allowance= request.getParameter("allowance");
	        String medicalallowance= request.getParameter("medicalallowance");
	        String tds= request.getParameter("tds");
	        String esi= request.getParameter("esi");
	        String pf= request.getParameter("pf");	          
	        String proftax= request.getParameter("proftax");
	        String labourwelfare= request.getParameter("labourwelfare");
	        
		/* String others= request.getParameter("others"); */
	        
	        Addempsalaryserviceimpl salary =new Addempsalaryserviceimpl();
	        status=salary.addempsalary(empid,basic, da, hra, conveyance, allowance, medicalallowance, tds, esi, pf,proftax,labourwelfare);
	  	  
	    		   RequestDispatcher rd = request.getRequestDispatcher("addsalary.jsp?message=" + status);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
	}

