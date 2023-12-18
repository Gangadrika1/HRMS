package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddPromotionServiceImpl;

@WebServlet("/AddPromotionSrv")
public class AddPromotionSrv  extends HttpServlet {

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
	    	String status = "Add Promotion Failed!";
	        String id = request.getParameter("id");
	        String promotionfor = request.getParameter("promotionfor");
	        String promotionfrom = request.getParameter("promotionfrom");
	        String promotionto = request.getParameter("promotionto");
	        String promotiondate = request.getParameter("promotiondate");
	        
	        AddPromotionServiceImpl add =new AddPromotionServiceImpl();
	        status=add.addpromotion(id,promotionfor, promotionfrom,promotionto,promotiondate);
	  	  
	    		   RequestDispatcher rd = request.getRequestDispatcher("promotion.jsp?message=" + status);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
	}
