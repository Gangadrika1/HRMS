
package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.utility.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Timestamp;

@WebServlet("/AddPaymentSrv")
public class AddPaymentSrv  extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 commonLogic(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   	 commonLogic(request, response);
    }
    private void commonLogic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        try {        	
            String client_username = request.getParameter("client_username");
            String invoice_id = request.getParameter("invoice_id");
            double payment_amt = Double.parseDouble(request.getParameter("payment_amt"));
            String due_date = request.getParameter("due_date");
            double[] amount_paid = Arrays.stream(request.getParameterValues("amount_paid"))
	                .mapToDouble(Double::parseDouble)
	                .toArray();
            String[] payment_date = request.getParameterValues("payment_date");            
          //  String[] balance_amt = request.getParameterValues("balance_amt");
            double[] balance_amt = Arrays.stream(request.getParameterValues("balance_amt"))
	                .mapToDouble(Double::parseDouble)
	                .toArray();            
            // Perform database operations to save invoice and items
            Connection conn = DBUtil.provideConnection();
            if (conn != null) {
            	PreparedStatement paymentsStatement = conn.prepareStatement(
            		    "INSERT INTO payment ( client_username, invoice_id, payment_amt, due_date) " +
            		    "VALUES (?, ?, ?, ?)",
            		    PreparedStatement.RETURN_GENERATED_KEYS
            		);
            	paymentsStatement.setString(1, client_username);
            	paymentsStatement.setString(2, invoice_id);
            	paymentsStatement.setDouble(3, payment_amt-amount_paid[0]);
            	paymentsStatement.setString(4, due_date);	     
   	      int affectedRows = paymentsStatement.executeUpdate();
   	   if (affectedRows > 0) {
   	       ResultSet generatedKeys = paymentsStatement.getGeneratedKeys(); 	       
   	       if (generatedKeys.next()) {
   	           int payment_id = generatedKeys.getInt(1);
   	           // Create a single prepared statement for batch insert of invoice items
   	           String itemInsertSQL = "INSERT INTO partial_payments ( amount_paid, payment_date, balance_amt,client_name,invoice_id) VALUES (?, ?, ?,?,?)";
   	           PreparedStatement partialStatement = conn.prepareStatement(itemInsertSQL);          
   	            partialStatement.setDouble(1, amount_paid[0]);
   	            partialStatement.setString(2, payment_date[0]);
   	            partialStatement.setDouble(3, balance_amt[0]);
   	            partialStatement.setString(4, client_username);
   	         	partialStatement.setString(5, invoice_id);
   	               // Add the current statement to the batch
   	   partialStatement.addBatch();
   	           // Execute the batch insert
   	        partialStatement.executeBatch();
   	     partialStatement.close();
   	       }
   	       conn.close();
   	    paymentsStatement.close();
   	   }

   	  }   
           // Redirect to a success page
            response.sendRedirect("payments.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("create_payment.jsp");
        }
    }
	public String getInvoiceItemId() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
