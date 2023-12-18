/*
 * package com.weblabs.srv;
 * 
 * import java.io.IOException; import java.util.List;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import com.weblabs.beans.AddDepartment; import com.weblabs.beans.AddLeaves;
 * import com.weblabs.service.impl.DepartmentDAO; import
 * com.weblabs.service.impl.LeaveDAO;
 * 
 * @WebServlet("/LeaveSearchSrv") public class LeaveSearchSrv extends
 * HttpServlet { protected void doPost(HttpServletRequest request,
 * HttpServletResponse response) throws ServletException, IOException {
 * 
 * String employeeFilter = request.getParameter("employee"); String startFilter
 * = request.getParameter("start_date"); String endFilter =
 * request.getParameter("end_date");
 * 
 * 
 * // String startParam = request.getParameter("start"); String startParam =
 * request.getParameter("start"); int start = (startParam != null) ?
 * Integer.parseInt(startParam) : 0; String limitParam =
 * request.getParameter("limit"); // int start = Integer.parseInt(startParam);
 * 
 * int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25; //int
 * limit = Integer.parseInt(limitParam);
 * 
 * List<AddLeaves> leaves;
 * 
 * 
 * 
 * if ((employeeFilter != null && !employeeFilter.isEmpty()) || (startFilter !=
 * null && !startFilter.isEmpty()) || (endFilter != null &&
 * !endFilter.isEmpty())) { // Apply filters for employee, start date, and end
 * date String filterQuery = "";
 * 
 * if (employeeFilter != null && !employeeFilter.isEmpty()) { filterQuery +=
 * "username like '%" + employeeFilter + "%'"; }
 * 
 * if (startFilter != null && !startFilter.isEmpty()) { if
 * (!filterQuery.isEmpty()) { filterQuery += " AND "; } filterQuery +=
 * "Starting_At >= '" + startFilter + "'"; }
 * 
 * if (endFilter != null && !endFilter.isEmpty()) { if (!filterQuery.isEmpty())
 * { filterQuery += " AND "; } filterQuery += "Ending_On <= '" + endFilter +
 * "'"; }
 * 
 * leaves = LeaveDAO.getFilteredLeaveRequests(filterQuery, start, limit); } else
 * { // Retrieve all data leaves = LeaveDAO.getFilteredLeaveRequests("", start,
 * limit); }
 * 
 * 
 * request.setAttribute("leaves", leaves); request.setAttribute("search",
 * "true"); request.setAttribute("Assets", leaves.size());
 * request.getRequestDispatcher("/leaves_search.jsp").forward(request,
 * response);
 * 
 * // request.getRequestDispatcher("/holidays.jsp").forward(request, response);
 * } }
 */



package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddLeaves;
import com.weblabs.service.impl.LeaveDAO;

@WebServlet("/LeaveSearchSrv")
public class LeaveSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	String employeeFilter = request.getParameter("employee");
        String startFilter = request.getParameter("start_date");
        String endFilter = request.getParameter("end_date");
        
  
       // String startParam = request.getParameter("start");
        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		//  int start = Integer.parseInt(startParam); 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
        //int limit = Integer.parseInt(limitParam); 
	
      List<AddLeaves> leaves;
        
        

      if ((employeeFilter != null && !employeeFilter.isEmpty()) || 
    		    (startFilter != null && !startFilter.isEmpty()) || 
    		    (endFilter != null && !endFilter.isEmpty())) {
    		    // Apply filters for employee, start date, and end date
    		    String filterQuery = "";

    		    if (employeeFilter != null && !employeeFilter.isEmpty()) {
    		        filterQuery += "username like '%" + employeeFilter + "%'";
    		    }

    		    if (startFilter != null && !startFilter.isEmpty()) {
    		        if (!filterQuery.isEmpty()) {
    		            filterQuery += " AND ";
    		        }
    		        filterQuery += "StartDate >= '" + startFilter + "'";
    		    }

    		    if (endFilter != null && !endFilter.isEmpty()) {
    		        if (!filterQuery.isEmpty()) {
    		            filterQuery += " AND ";
    		        }
    		        filterQuery += "EndDate <= '" + endFilter + "'";
    		    }

    		    leaves = LeaveDAO.getFilteredLeaveRequests(filterQuery, start, limit);
    		} else {
    		    // Retrieve all data
    		    leaves = LeaveDAO.getFilteredLeaveRequests("", start, limit);
    		}


      request.setAttribute("leaves", leaves);
      request.setAttribute("search", "true");
      request.setAttribute("Assets", leaves.size());
      request.getRequestDispatcher("/leaves.jsp").forward(request, response);

      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
    }
}