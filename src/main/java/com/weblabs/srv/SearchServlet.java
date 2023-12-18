package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.EmployeeBean;
import com.weblabs.service.impl.EmployeeDAO;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	String usernameFilter = request.getParameter("username");
        String idFilter = request.getParameter("id");
  
       // String startParam = request.getParameter("start");
        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		//  int start = Integer.parseInt(startParam); 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
        //int limit = Integer.parseInt(limitParam); 
	
      List<EmployeeBean> employees;
        
        

        if (usernameFilter != null && !usernameFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (idFilter == null || idFilter.isEmpty()) {
        	 int idFilterInt = 0;
        	  employees = EmployeeDAO.getFilteredEmployees("username like '%" + usernameFilter + "%' or Id = '" + idFilterInt + "'", start, limit);
        	}
        	else {
        employees = EmployeeDAO.getFilteredEmployees("username like '%" + usernameFilter + "%' or Id = '" + idFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
         employees = EmployeeDAO.getFilteredEmployees("", start, limit);
        }

      request.setAttribute("employees", employees);
      request.setAttribute("search", "true");
      request.getRequestDispatcher("/employee.jsp").forward(request, response);

      //  request.getRequestDispatcher("/employee.jsp").forward(request, response);
    }
}

