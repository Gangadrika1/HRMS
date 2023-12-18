


package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.SupplierServiceImpl;


@WebServlet("/DeleteSupplierSrv")
public class DeleteSupplierSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String supplierID = request.getParameter("supplierID");
        SupplierServiceImpl ass = new SupplierServiceImpl();

		String status = ass.deletesup(supplierID);
		
        RequestDispatcher rd = request.getRequestDispatcher("deleteSupplier.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}