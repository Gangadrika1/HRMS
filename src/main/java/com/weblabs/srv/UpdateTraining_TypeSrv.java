package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddTraining_Type;
import com.weblabs.service.impl.AddTraining_TypeServiveImpl;


@WebServlet("/UpdateTraining_TypeSrv")
public class UpdateTraining_TypeSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        HttpSession session = request.getSession();
//        String userType = (String) session.getAttribute("usertype");
//        String userName = (String) session.getAttribute("username");
//        String password = (String) session.getAttribute("password");
//
//        if (userType == null || !userType.equals("admin")) {
//            response.sendRedirect("login.jsp?message=Access Denied!");
//        } else if (userName == null || password == null) {
//            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
//        }

    	
    	String id = request.getParameter("id");
    	String type = request.getParameter("type");
    	String description = request.getParameter("description");
    	String status =request.getParameter("Status");
    	 
    	AddTraining_Type train=new AddTraining_Type();
    	train.setDescription(description);
    	train.setStatus(status);
    	train.setType(type);
    	
    	
    	AddTraining_TypeServiveImpl training = new AddTraining_TypeServiveImpl();
    	String Status = training.editTraining_Type(id, type, description, status);
		
        RequestDispatcher rd = request.getRequestDispatcher("edit.jsp?message=" + Status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
}
}
