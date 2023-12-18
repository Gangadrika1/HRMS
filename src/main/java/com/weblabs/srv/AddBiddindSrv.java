package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.service.impl.biddingServiceImpl;

@WebServlet("/AddBiddindSrv")
public class AddBiddindSrv  extends HttpServlet {

		private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	    	String status = "Add Bidding Failed!";
	        String Clientid = request.getParameter("Clientid");
	        String is_fixed = request.getParameter("is_fixed");
	        String hourly = request.getParameter("hourly");
	        String pricing = request.getParameter("pricing"); 
	        String project_id = request.getParameter("project_id"); 
	        String is_approved = request.getParameter("is_approved");
	        if (hourly == null || hourly.trim().isEmpty()) {
	            hourly = null;
	        }
	        
	        biddingServiceImpl add =new biddingServiceImpl();
	        status=add.addB( Clientid, is_fixed, hourly, pricing,project_id,is_approved);
	  	  
	    		   RequestDispatcher rd = request.getRequestDispatcher("add_bidding.jsp?message=" + status);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
	}