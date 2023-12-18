package com.weblabs.srv;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.AddPromotion;

import com.weblabs.service.impl.PromotionDAO;





@WebServlet("/PromotionSearchSrv")
public class PromotionSearchSrv extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String promotionforFilter = request.getParameter("promotionfor");
        String dateFilter = request.getParameter("promotiondate");

        String startParam = request.getParameter("start");
        int start = (startParam != null) ? Integer.parseInt(startParam) : 0;
        String limitParam = request.getParameter("limit");
        int limit = (limitParam != null) ? Integer.parseInt(limitParam) : 25;

        List<AddPromotion> promotions;

       
        if (promotionforFilter != null && !promotionforFilter.isEmpty() || dateFilter != null && !dateFilter.isEmpty()) {
            // Apply filters for both username and ID
        	if (dateFilter == null || dateFilter.isEmpty()) {
        	 //int idFilterInt = 0;
        	 promotions = PromotionDAO.getFilteredPromotion("promotionfor like '%" + promotionforFilter + "%' and promotiondate = '" + dateFilter + "'", start, limit);
        	}
        	else {
        		promotions = PromotionDAO.getFilteredPromotion("promotionfor like '%" + promotionforFilter + "%' and promotiondate = '" + dateFilter + "'", start, limit);
        	}
        	} else {
            // Retrieve all data
        		promotions = PromotionDAO.getFilteredPromotion("", start, limit);
        }

      request.setAttribute("promotions", promotions);
      request.setAttribute("search", "true");
      request.setAttribute("promotion", promotions.size());
      request.getRequestDispatcher("/promotion.jsp").forward(request, response);

      //  request.getRequestDispatcher("/holidays.jsp").forward(request, response);
    }
}





















