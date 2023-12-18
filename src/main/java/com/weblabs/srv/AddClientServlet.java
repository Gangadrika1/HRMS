package com.weblabs.srv;

import java.io.IOException; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddClientsServiceImpl;

@WebServlet("/AddClientServlet")
public class AddClientServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
	
        String Status = "Add Training Failed!";
		String FirstName = request.getParameter("FirstName");
        String LastName = request.getParameter("LastName");
        String UserName = request.getParameter("Username");
        String Email = request.getParameter("Email");
        String ClientID = request.getParameter("ClientID");
        String Phone = request.getParameter("Phone");
        String Company = request.getParameter("Company");
        String Address = request.getParameter("Address");
        
	
	 AddClientsServiceImpl client=new AddClientsServiceImpl();
	 Status =client.addClients(FirstName, LastName, UserName, Email, ClientID, Phone, Company, Address);
     

	   RequestDispatcher rd = request.getRequestDispatcher("clients.jsp?message=" + Status);
rd.forward(request, response);
} 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

doGet(request, response);
}
}
