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
import com.weblabs.service.impl.AddPromotionServiceImpl;
			
@WebServlet("/EditPromotionSrv")
public class EditPromotionSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      //  HttpSession session = request.getSession();
      //  String userType = (String) session.getAttribute("usertype");
      //  String userName = (String) session.getAttribute("username");
      //  String password = (String) session.getAttribute("password");

       // if (userType == null || !userType.equals("admin")) {
          //  response.sendRedirect("login.jsp?message=Access Denied, Login As Admin!!");
           // return;
       // } else if (userName == null || password == null) {
           // response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
          //  return;
        //}

        // Login success
        String status = "Edit designation Failed!"; 
        String id= request.getParameter("id");
        String promotionfor = request.getParameter("promotionfor");
        String promotionfrom = request.getParameter("promotionfrom");
        String promotionto = request.getParameter("promotionto");
        String promotiondate = request.getParameter("promotiondate");
        
        AddPromotion a = new AddPromotion();
        a.setId(id);
        a.setPromotionFor(promotionfor);
        a.setPromotionFrom(promotionfrom);
        a.setPromotionTo(promotionto);
        a.setPromotionDate(promotiondate);

        AddPromotionServiceImpl dao = new AddPromotionServiceImpl();
   
        String status1 = dao.editpromotion(id,promotionfor,promotionfrom,promotionto,promotiondate);

        RequestDispatcher rd = request.getRequestDispatcher("promotion.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}