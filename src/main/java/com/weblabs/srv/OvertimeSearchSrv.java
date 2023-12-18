package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddDesignation;
import com.weblabs.beans.AddOverTime;
import com.weblabs.service.impl.DesignationDAO;
import com.weblabs.service.impl.OvertimeDAO;

@WebServlet("/OvertimeSearchSrv")
public class OvertimeSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	String employeeFilter = request.getParameter("Employee_Id");
        String overtimedate = request.getParameter("OverTime_Date");
  
       // String startParam = request.getParameter("start");
        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		//  int start = Integer.parseInt(startParam); 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
        //int limit = Integer.parseInt(limitParam); 
	
      List<AddOverTime> overtime;
        
        

        if (employeeFilter != null && !employeeFilter.isEmpty() || overtimedate != null && !overtimedate.isEmpty()) {
            // Apply filters for both username and ID
        	if (overtimedate == null || overtimedate.isEmpty()) {
        	 int idFilterInt = 0;
        	 overtime = OvertimeDAO.getFilteredOvertimes("Employee_Id like '%" + employeeFilter + "%' and OverTime_Date = '" + overtimedate + "'", start, limit);
        	}
        	else {
        		overtime = OvertimeDAO.getFilteredOvertimes("Employee_Id like '%" + employeeFilter + "%' and OverTime_Date = '" + overtimedate + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		overtime = OvertimeDAO.getFilteredOvertimes("", start, limit);
        }

      request.setAttribute("overtime", overtime);
      request.setAttribute("search", "true");
      request.setAttribute("overtime", overtime.size());
      // request.getRequestDispatcher("/employee.jsp").forward(request, response);
      RequestDispatcher rd = request.getRequestDispatcher("overtime.jsp");
      rd.forward(request, response);
    }
}
