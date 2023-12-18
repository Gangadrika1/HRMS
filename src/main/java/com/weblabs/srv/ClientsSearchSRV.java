package com.weblabs.srv;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddClient;
import com.weblabs.service.impl.AddClientsDAO;


@WebServlet("/ClientsSearchSRV")
public class ClientsSearchSRV extends HttpServlet {

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String itemnameFilter = request.getParameter("UserName");
	        String idFilter = request.getParameter("Clientid");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<AddClient> clients;
	        
	        

	        if (itemnameFilter != null && !itemnameFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
	            // Apply filters for both username and ID
	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 clients = AddClientsDAO.getFilteredAddClient("UserName like '%" + itemnameFilter + "%' or Clientid = '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		clients = AddClientsDAO.getFilteredAddClient("UserName like '%" + itemnameFilter + "%' and Clientid = '" + idFilter + "'", start, limit);
	        	}
	        	} else {
	            // Retrieve all data
	        		clients = AddClientsDAO.getFilteredAddClient("", start, limit);
	        }
	        
	        for (AddClient client : clients) {
	            System.out.println(client); // Assuming AddClient class has a meaningful toString() implementation
	        }


	        System.out.println("Clients record count: " + clients.size());
	        

	      request.setAttribute("clients", clients);
	      request.setAttribute("search", "true");
	      request.setAttribute("client", clients.size());   
	      request.getRequestDispatcher("/clients.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}
