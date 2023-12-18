package com.weblabs.srv;

import java.io.IOException;  
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.HolidayBean;
import com.weblabs.service.impl.AddHolidaysServiceImp;



@WebServlet("/UpdateHolidaySrv")
public class UpdateHolidaySrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        HttpSession session = request.getSession();
//        String userType = (String) session.getAttribute("usertype");
//        String userName = (String) session.getAttribute("username");
//        String password = (String) session.getAttribute("password");
//
//        if (userType == null || !userType.equals("admin")) {
//            response.sendRedirect("login.jsp?message=Access Denied!");
//        } else if (userName == null || password == null) {
//            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
//        }

    	
    	String id = request.getParameter("id");
    	String holiday_Name = request.getParameter("holidayname");
    	String holiday_Date = request.getParameter("holidaydate");
    	 
    	HolidayBean holiday= new HolidayBean();
    	holiday.setId(id);
    	holiday.setHoliday_Date(holiday_Date);
    	holiday.setHoliday_Name(holiday_Name);
    	


    	AddHolidaysServiceImp employee1 = new AddHolidaysServiceImp();
		String status = employee1.update(id,holiday_Name, holiday_Date);
		
        RequestDispatcher rd = request.getRequestDispatcher("update-holiday.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}