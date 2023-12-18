package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher; // Import RequestDispatcher from javax.servlet package

@WebServlet("/EmpValidateOtp")
public class EmpValidateOtp extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        int value = Integer.parseInt(request.getParameter("otp"));
        
        HttpSession session = request.getSession();
        // Storing the OTP in the session
        // Rest of your code
        int otp = Integer.parseInt((String) session.getAttribute("otp"));
        
        RequestDispatcher dispatcher = null;

        if (value == otp) {
			/* String email=request.getParameter("email"); */
            request.setAttribute("email", request.getParameter("email"));
            request.setAttribute("status", "success");
            dispatcher = request.getRequestDispatcher("reset_password.jsp");
            dispatcher.forward(request, response);

        } else {
            request.setAttribute("message", "wrong otp");
            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            dispatcher.forward(request, response);
        }
    }
}



//package com.weblabs.srv;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@WebServlet("/EmpValidateOtp")
//public class EmpValidateOtp extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int value = Integer.parseInt(request.getParameter("otp"));
//        HttpSession session = request.getSession();
//        session.setAttribute("otp", value); // Storing the OTP in the session
//
//        int storedOtp = (int) session.getAttribute("otp"); // Retrieving the stored OTP
//        System.out.println("Stored OTP: " + storedOtp);
//
//        // Rest of your code
//        int otp = (int) session.getAttribute("otp");
//        System.out.println(otp);
//        RequestDispatcher dispatcher = null;
//
//        if (value == otp) {
//            request.setAttribute("email", request.getParameter("email"));
//            request.setAttribute("status", "success");
//            dispatcher = request.getRequestDispatcher("reset_password.jsp");
//            dispatcher.forward(request, response);
//
//        } else {
//            request.setAttribute("message", "wrong otp");
//
//            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
//            dispatcher.forward(request, response);
//        }
//    }
//}