package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddResignation;
import com.weblabs.beans.AddTermination;
import com.weblabs.service.impl.ResignationDAO;
import com.weblabs.service.impl.TerminationDAO;



@WebServlet("/ResignationSearchSrv")
public class ResignationSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String resigningempnameFilter = request.getParameter("resigningemployee");
        String dateFilter = request.getParameter("resignationdate");

        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;

        List<AddResignation> resignations;

       
        if (resigningempnameFilter != null && !resigningempnameFilter.isEmpty() || dateFilter != null && !dateFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (dateFilter == null || dateFilter.isEmpty()) {
        	 int idFilterInt = 0;
        	 resignations = ResignationDAO.getFilteredResignation("resigningemployee like '%" + resigningempnameFilter + "%' and resignationdate = '" + dateFilter + "'", start, limit);
        	}
        	else {
        		resignations = ResignationDAO.getFilteredResignation("resigningemployee like '%" + resigningempnameFilter + "%' and resignationdate = '" + dateFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		resignations = ResignationDAO.getFilteredResignation("", start, limit);
        }

      request.setAttribute("resignations", resignations);
      request.setAttribute("search", "true");
      request.setAttribute("resignation", resignations.size());
      request.getRequestDispatcher("/resignation.jsp").forward(request, response);

      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
    }
}





















