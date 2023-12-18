


package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.SupplierBean;
import com.weblabs.service.impl.SupplierServiceImpl;
			
@WebServlet("/EditSupplierSrv")
public class EditSupplierSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


   	 String status = "Add  Failed!";
 
   	 String supplierID = request.getParameter("supplierID");
        String supplierName = request.getParameter("supplierName");
        String productDetails= request.getParameter("productDetails");
      
	 SupplierBean obj = new SupplierBean();
    
     obj.setSupplierID(supplierID);
     obj.setSupplierID(supplierName);
     obj.setProductDetails(productDetails);
     
     SupplierServiceImpl ass =new SupplierServiceImpl();
     status=ass.editsup(supplierID,supplierName,productDetails );
    
        RequestDispatcher rd = request.getRequestDispatcher("EditSupplier.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}




