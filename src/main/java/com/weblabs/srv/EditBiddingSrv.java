package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.biddingBean;
import com.weblabs.service.impl.biddingServiceImpl;
			
@WebServlet("/EditBiddingSrv")
public class EditBiddingSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Edit designation Failed!"; 
        String id= request.getParameter("id");
        String Clientid = request.getParameter("Clientid");
        String is_fixed = request.getParameter("is_fixed");
        String hourly = request.getParameter("hourly");
        String pricing = request.getParameter("pricing");
        String project_id = request.getParameter("project_id"); 
        String is_approved = request.getParameter("is_approved"); 
        
        biddingBean dept = new biddingBean();
        dept.setId(id);
        dept.setClientid(Clientid);
        dept.setIs_fixed(is_fixed);
        dept.setHourly(hourly);
        dept.setPricing(pricing);
        dept.setProject_id(project_id);
        dept.setIs_approved(is_approved);
        
        biddingServiceImpl dao = new biddingServiceImpl();
   
        String status1 = dao.editB(id, Clientid, is_fixed, hourly, pricing,project_id,is_approved);

        RequestDispatcher rd = request.getRequestDispatcher("edit_bidding.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}