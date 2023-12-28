package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.beans.AddPromotion;
import com.weblabs.service.impl.AddResignationServiceImpl;
			
@WebServlet("/EditResignationSrv")
public class EditResignationSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

     

        // Login success
        String status = "Edit designation Failed!"; 
        String id= request.getParameter("id");
        String resigningemp = request.getParameter("resigningemp");
        String noticedate = request.getParameter("noticedate");
        String resignationdate = request.getParameter("resignationdate");
        String reason = request.getParameter("reason");
        
        AddPromotion a = new AddPromotion();
        a.setId(id);
        a.setPromotionFor(resigningemp);
        a.setPromotionFrom(noticedate);
        a.setPromotionTo(resignationdate);
        a.setPromotionDate(reason);

        AddResignationServiceImpl dao = new AddResignationServiceImpl();
   
        status = dao.editresignation(id,resigningemp,noticedate,resignationdate,reason);

        RequestDispatcher rd = request.getRequestDispatcher("resignation.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}