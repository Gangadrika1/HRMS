package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddClient;
import com.weblabs.service.impl.AddClientsServiceImpl;

@WebServlet("/EditClientsSRV")
public class EditClientsSRV extends HttpServlet
{
	  private static final long serialVersionUID = 1L;

	    //public UpdateEmployeeSrv() {
	       // super();
	   // }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {


	        // Login success
	        String status = "Edit clients Failed!"; 
	        String Clientid= request.getParameter("Clientid");
	        String FirstName=request.getParameter("FirstName");
	        String LastName = request.getParameter("LastName");
	        String Username = request.getParameter("Username");
	        String Email = request.getParameter("Email");
	        String Phone= request.getParameter("Phone");
	        String Company =request.getParameter("Company");
	        String Address = request.getParameter("Address");  

	        AddClient dept = new AddClient();
	        dept.setClientID(Clientid);
	        dept.setFirstName(FirstName);
	        dept.setLastName(LastName);
	        dept.setUsername(Username);
            dept.setEmail(Email);
            dept.setPhone(Phone);
            dept.setCompany(Company);
            dept.setAddress(Address);

	        AddClientsServiceImpl dao = new AddClientsServiceImpl();
	   
	        status = dao.editClients(FirstName, LastName, Username, Email, Clientid, Phone, Company, Address);

	        RequestDispatcher rd = request.getRequestDispatcher("clients.jsp?message=" + status);
	        rd.forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	
}
