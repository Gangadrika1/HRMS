
package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.SupplierBean;
import com.weblabs.service.impl.SupplierDAO;


@WebServlet("/SupplierSearchSrv")
public class SupplierSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	String supplierFilter = request.getParameter("supplierName");
        String idFilter = request.getParameter("supplierID");
  

        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
   
	
      List<SupplierBean> suppliers;
        
        


      if (supplierFilter != null && !supplierFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
         
      	if (idFilter == null || idFilter.isEmpty()) {
      	 int idFilterInt = 0;
      	suppliers = SupplierDAO.getFilteredSuppliers("supplierName like '%" + supplierFilter + "%' or supplierID = '" + idFilterInt + "'", start, limit);
      	}
      	else {
      		suppliers = SupplierDAO.getFilteredSuppliers("supplierName like '%" + supplierFilter + "%' and supplierID = '" + idFilter + "'", start, limit);
      	}
      	} else {
          // Retrieve all data
      		suppliers = SupplierDAO.getFilteredSuppliers("", start, limit);
      }

    request.setAttribute("suppliers", suppliers);
    request.setAttribute("search", "true");
    request.getRequestDispatcher("/supplier.jsp").forward(request, response);

    
  }
}
