package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddExpenses;
import com.weblabs.service.impl.ExpensesDao;

@WebServlet("/ExpensesSearchSRV")
public class ExpensesSearchSRV extends HttpServlet{

	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
	    	String itemnameFilter = request.getParameter("ItemName");
	        String idFilter = request.getParameter("id");
	  
	       // String startParam = request.getParameter("start");
	        String startParam = request.getParameter("start");
	        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
	        String limitParam = request.getParameter("limit");
			//  int start = Integer.parseInt(startParam); 
			 
	        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
	        //int limit = Integer.parseInt(limitParam); 
		
	      List<AddExpenses> expenses;
	        
	        

	        if (itemnameFilter != null && !itemnameFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
	            // Apply filters for both username and ID
	        	if (idFilter == null || idFilter.isEmpty()) {
	        	 int idFilterInt = 0;
	        	 expenses = ExpensesDao.getFiltereExpenses("ItemName like '%" + itemnameFilter + "%' and id = '" + idFilterInt + "'", start, limit);
	        	}
	        	else {
	        		expenses = ExpensesDao.getFiltereExpenses("ItemName like '%" + itemnameFilter + "%' and id = '" + idFilter + "'", start, limit);
	        	}
	        	} else {
	            // Retrieve all data
	        		expenses = ExpensesDao.getFiltereExpenses("", start, limit);
	        }

	      request.setAttribute("expenses", expenses);
	      request.setAttribute("search", "true");
	      request.setAttribute("expenses", expenses.size()); 
	      // request.getRequestDispatcher("/employee.jsp").forward(request, response);
	      RequestDispatcher rd = request.getRequestDispatcher("expenses.jsp");
	      rd.forward(request, response);
	      

	      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
	    }
}