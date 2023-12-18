package com.weblabs.srv;

import java.io.IOException; 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddTaxServiceImpl;

@WebServlet("/DeleteTaxSrv")
public class DeleteTaxSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    	String TaxID = request.getParameter("ID");

    	
    	AddTaxServiceImpl tax = new AddTaxServiceImpl();

		String status = tax.deletetax(TaxID);
	
        RequestDispatcher rd = request.getRequestDispatcher("delete_tax.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
