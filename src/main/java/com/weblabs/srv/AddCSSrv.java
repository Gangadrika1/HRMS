package com.weblabs.srv;

import java.io.IOException; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.CompanySettingServiceImpl;

@WebServlet("/AddCSSrv")
public class AddCSSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
	
        String Status = "Add Training Failed!";
		String CompanyName = request.getParameter("CompanyName");
        String ContactPerson = request.getParameter("ContactPerson");
        String Address = request.getParameter("Address");
        String logo = request.getParameter("logo");
        String Country = request.getParameter("Country");
        String City = request.getParameter("City");
        String State = request.getParameter("State");
        String PostalCode = request.getParameter("PostalCode");
        String Email = request.getParameter("Email");
        String PhoneNumber = request.getParameter("PhoneNumber");
        String MobileNumber = request.getParameter("MobileNumber");
        String Fax = request.getParameter("Fax");
        String WebsiteUrl = request.getParameter("WebsiteUrl");
        String TelegramUrl= request.getParameter("TelegramUrl");
        String InstagramUrl= request.getParameter("InstagramUrl");
        
	
        CompanySettingServiceImpl aaa=new CompanySettingServiceImpl();
     //   Company existingCompany = companyService.getCompany();
	 Status = aaa.addCS(CompanyName, ContactPerson, Address,logo, Country, City, State, PostalCode, Email, PhoneNumber, MobileNumber, Fax, WebsiteUrl,InstagramUrl,TelegramUrl);
		/*
		 * CompanySettingServiceImpl abc=new CompanySettingServiceImpl();
		 * abc.editCS(CompanyName, CompanyName, ContactPerson, Address, Country, City,
		 * State, PostalCode, Email, PhoneNumber, MobileNumber, Fax, WebsiteUrl);
		 */
	 
	 
	// if (existingCompany == null) {
		 
		 
//	 }
	   RequestDispatcher rd = request.getRequestDispatcher("CS.jsp?message=" + Status);
rd.forward(request, response);
} 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

doGet(request, response);
}
}