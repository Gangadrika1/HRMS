package com.weblabs.srv;
	import java.io.IOException; 
	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import com.weblabs.beans.AddTrainers;
	import com.weblabs.service.impl.AddTrainersServletImp;

	@WebServlet("/UpdateTrainerSrv")
	public class UpdateTrainerSrv extends HttpServlet{
		private static final long serialVersionUID = 1L;
		//private static final String addteam = null;

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

	    	
	    	String id = request.getParameter("id");
	    	String firstname = request.getParameter("firstname");
	    	String lastname = request.getParameter("lastname");
	    	String role = request.getParameter("role");
	    	String email = request.getParameter("email");
	    	String phone = request.getParameter("phone");
	    	String status =request.getParameter("status");
	    	String description = request.getParameter("description");
	  
	    	AddTrainers train1=new AddTrainers();
	    	train1.setFirstname(firstname);
	    	train1.setLastname(lastname);
	    	train1.setRole(role);
	    	train1.setEmail(email);
	    	train1.setPhone(phone);
	    	train1.setStatus(status);
	    	train1.setDescription(description);
	    	
	    	AddTrainersServletImp training =new AddTrainersServletImp();
	    	String Statuss = training.edit(id, firstname, lastname, role, email, phone, status, description);
			
	        RequestDispatcher rd = request.getRequestDispatcher("trainers.jsp?message=" + Statuss);
	        rd.forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	}
	}
	
