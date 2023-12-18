package com.weblabs.srv;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddInvoice;
import com.weblabs.service.impl.InvoiceDAO;


@WebServlet("/InvoiceSearchSRV")
public class InvoiceSearchSRV extends HttpServlet{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
    	String employeeFilter = request.getParameter("id");
        String overtimedate = request.getParameter("client");
  
       // String startParam = request.getParameter("start");
        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		//  int start = Integer.parseInt(startParam); 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
        //int limit = Integer.parseInt(limitParam); 
	
      List<AddInvoice> invo;
        
        

        if (employeeFilter != null && !employeeFilter.isEmpty() || overtimedate != null && !overtimedate.isEmpty()) {
            // Apply filters for both username and ID
        	if (overtimedate == null || overtimedate.isEmpty()) {
        	 int idFilterInt = 0;
        	 invo = InvoiceDAO.getFilteredInvoices("id like '%" + employeeFilter + "%' or client = '" + overtimedate + "'", start, limit);
        	}
        	else {
        		invo = InvoiceDAO.getFilteredInvoices("id like '%" + employeeFilter + "%' or client = '" + overtimedate + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		invo = InvoiceDAO.getFilteredInvoices("", start, limit);
        }

      request.setAttribute("overtime", invo);
      request.setAttribute("search", "true");
      request.getRequestDispatcher("/invoices.jsp").forward(request, response);

      //  request.getRequestDispatcher("/designations.jsp").forward(request, response);
    }
}
