package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AssetsBean;
import com.weblabs.service.impl.AssetDAO;

@WebServlet("/AssetSearchSrv")
public class AssetSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	String departmentFilter = request.getParameter("assetName");
        String idFilter = request.getParameter("Id");
  
       // String startParam = request.getParameter("start");
        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
		//  int start = Integer.parseInt(startParam); 
		 
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;
        //int limit = Integer.parseInt(limitParam); 
	
      List<AssetsBean> Asset;
        
        

        if (departmentFilter != null && !departmentFilter.isEmpty() || idFilter != null && !idFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (idFilter == null || idFilter.isEmpty()) {
        	 int idFilterInt = 0;
        	 Asset = AssetDAO.getFilteredAssets("assetName like '%" + departmentFilter + "%' and Id = '" + idFilterInt + "'", start, limit);
        	}
        	else {
        		Asset = AssetDAO.getFilteredAssets("assetName like '%" + departmentFilter + "%' and Id = '" + idFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		Asset = AssetDAO.getFilteredAssets("", start, limit);
        }

      request.setAttribute("departments", Asset);
      request.setAttribute("search", "true");
      request.setAttribute("Assets", Asset.size());  
      
   // request.getRequestDispatcher("/employee.jsp").forward(request, response);
      RequestDispatcher rd = request.getRequestDispatcher("Assets.jsp");
      rd.forward(request, response);
    }
}
