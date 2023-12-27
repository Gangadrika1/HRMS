package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddsalaryBean;
import com.weblabs.beans.EmployeeBean;

import com.weblabs.service.impl.EmployeeDAO;
import com.weblabs.service.impl.SalaryDAO;

@WebServlet("/SalarySearchSRV")
public class SalarySearchSRV extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idFilter = request.getParameter("Employee_Id");

        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;

        List<AddsalaryBean> employees;

       

        if ( idFilter != null && !idFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (idFilter == null || idFilter.isEmpty()) {
        	 int idFilterInt = 0;
				/*
				 * employees = EmployeeDAO.getFilteredEmployees("Employee_Id = '" + idFilterInt
				 * + "'", start, limit);
				 */
        	 employees= SalaryDAO.getFilteredSalary("Employee_Id = '" + idFilterInt + "'", start, limit);
        	}
        	else {
        		employees = SalaryDAO.getFilteredSalary(" Employee_Id= '" + idFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		employees = SalaryDAO.getFilteredSalary("", start, limit);
        }

      request.setAttribute("employee_id", employees);
      request.setAttribute("search", "true");
      
     // request.getRequestDispatcher("/employee.jsp").forward(request, response);
      RequestDispatcher rd = request.getRequestDispatcher("salary.jsp");
      rd.forward(request, response);
      
   
     
    }
}
