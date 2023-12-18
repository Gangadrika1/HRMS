package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.service.impl.EmployeeServiceImpl;

import javax.servlet.RequestDispatcher;


@WebServlet("/DeleteEmployeeSrv")
public class DeleteEmployeeSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

  
    	String id = request.getParameter("id");

    	EmployeeServiceImpl employee = new EmployeeServiceImpl();

		String status = employee.deleteEmployee(id);
		
        RequestDispatcher rd = request.getRequestDispatcher("deleteEmployee.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}


