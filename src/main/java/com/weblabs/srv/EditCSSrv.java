package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.CompanySettingsBean;
import com.weblabs.service.impl.CompanySettingServiceImpl;
			
@WebServlet("/EditCSSrv")
public class EditCSSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
  
    
        String status = "Edit  Failed!"; 
        
        String CompanyID= request.getParameter("CompanyID");
        String CompanyName = request.getParameter("CompanyName");
        String ContactPerson = request.getParameter("ContactPerson");
        String Address = request.getParameter("Address");
        String Country = request.getParameter("Country");   
        String City= request.getParameter("City");
        String State = request.getParameter("State");
        String PostalCode = request.getParameter("PostalCode");
        String Email = request.getParameter("Email");
        String PhoneNumber = request.getParameter("PhoneNumber");
        String MobileNumber= request.getParameter("MobileNumber");
        String Fax = request.getParameter("Fax");
        String WebsiteUrl = request.getParameter("WebsiteUrl");
        String logo = request.getParameter("logo");
        String InstagramUrl = request.getParameter("InstagramUrl");
        String TelegramUrl = request.getParameter("TelegramUrl");
        
		/*
		 * CompanySettingsBean a = new CompanySettingsBean(); a.setCompanyID(CompanyID);
		 * a.setCompanyName(CompanyName); a.setContactPerson(ContactPerson);
		 * a.setAddress(Address); a.setCountry(Country); a.setCity(City);
		 * a.setState(State); a.setPostalCode(PostalCode); a.setEmail(Email);
		 * a.setPhoneNumber(PhoneNumber); a.setMobileNumber(MobileNumber);
		 * a.setFax(Fax); a.setWebsiteUrl(WebsiteUrl);
		 */
     


        CompanySettingServiceImpl dao = new CompanySettingServiceImpl();
   
        String status1 = dao.editCS( CompanyID,  CompanyName, ContactPerson, Address, Country, City, State, PostalCode, Email, PhoneNumber, MobileNumber, Fax, WebsiteUrl,logo,InstagramUrl,TelegramUrl);

        RequestDispatcher rd = request.getRequestDispatcher("CS.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}