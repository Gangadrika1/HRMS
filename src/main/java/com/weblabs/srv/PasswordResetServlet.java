package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.OTPGenerator;


@WebServlet("/PasswordResetServlet")
public class PasswordResetServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String toEmail = request.getParameter("email"); // Assuming the parameter name is "email"

        
        String otp = OTPGenerator.sendOTPEmail(toEmail);
        // Store the OTP in the session to verify it later
        request.getSession().setAttribute("otp", otp);

        // Redirect to the page where the user can enter the OTP
        response.sendRedirect("EnterOtp.jsp"); // Assuming enterOTP.jsp is the page where the user can enter the OTP
    }
}
