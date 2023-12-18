package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddTax;
import com.weblabs.service.impl.AddTaxDAO;

@WebServlet("/TaxesSearchSRV")
public class TaxesSearchSRV extends HttpServlet{

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String taxnameFilter = request.getParameter("TaxName");
	        String idFilter = request.getParameter("ID");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<AddTax> expenses;
	        
	        

	        if (taxnameFilter != null && !taxnameFilter.isEmpty() || idFilter != null &&!idFilter.isEmpty()) {
	            // Apply filters for both username and ID
	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 expenses = AddTaxDAO.getFilteredAddTax("TaxName like '%" + taxnameFilter + "%' or  TaxID= '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		expenses = AddTaxDAO.getFilteredAddTax("TaxName like '%" + taxnameFilter + "%' and TaxID = '" + idFilter + "'", start, limit);
	        	}
	        	} else {
	            // Retrieve all data
	        		expenses = AddTaxDAO.getFilteredAddTax("", start, limit);
	        }
	       System.out.println("in taxessearch"+expenses.size());
	      request.setAttribute("taxes", expenses);
	      request.setAttribute("search", "true");
	      request.setAttribute("taxes", expenses.size());  
	      request.getRequestDispatcher("/empTaxes.jsp").forward(request, response);

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}
