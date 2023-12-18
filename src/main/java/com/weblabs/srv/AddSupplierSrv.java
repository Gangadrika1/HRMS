
package com.weblabs.srv;
import java.io.IOException; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.SupplierServiceImpl;

@WebServlet("/AddSupplierServlet")
public class AddSupplierSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    
    	 String status = "Add Users Failed!";
    	
         String supplierName= request.getParameter("supplierName");
         String productDetails= request.getParameter("productDetails");
    
         SupplierServiceImpl sup =new SupplierServiceImpl();
         status=sup.addsup( supplierName, productDetails);
         
     		  
     		   RequestDispatcher rd = request.getRequestDispatcher("supplier.jsp?message=" + status);
        rd.forward(request, response);
     } 
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {

         doGet(request, response);
     }
 }
