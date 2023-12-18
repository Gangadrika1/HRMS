package com.weblabs.srv;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.utility.DBUtil;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Timestamp;

@WebServlet("/EditInvoiceServlet")
public class EditInvoiceServlet extends HttpServlet {
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Your code to handle GET requests
		 commonLogic(request, response);
	    }
	
	    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
	   	 commonLogic(request, response);
	    
	    }
	    
	    private void commonLogic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
	        try {
	            // Retrieve data from the form
	        	  
	            String client = request.getParameter("client");
	            String project = request.getParameter("projectname");
	            String email = request.getParameter("email");
	            double selectedTax = Double.parseDouble(request.getParameter("taxSelect"));
	           String id = request.getParameter("id");
	            String clientAddress = request.getParameter("clientaddress");
	            String billingAddress = request.getParameter("billingaddress");
	            String OtherInformation = request.getParameter("OtherInformation");
	            
	            double discount = Double.parseDouble(request.getParameter("discount"));
	            String taxamountParam = request.getParameter("taxAmount");
	            double taxamount = (taxamountParam != null && !taxamountParam.isEmpty()) ? Double.parseDouble(taxamountParam) : 0.0;

//	            double taxamount = Double.parseDouble(request.getParameter("taxamount"));
	            double grandtotal = Double.parseDouble(request.getParameter("grandtotal"));

	         //   SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
	          //  OtherInformation,discount,taxamount,grandtotal
	         // Parse the date strings into Date objects
	            String invoicedate = request.getParameter("invoicedate");
	            String dueDate =request.getParameter("duedate");

	         // Convert Date objects to Timestamp objects
	       //  Timestamp invoiceTimestamp = new Timestamp(invoiceDate.getTime());
	       //  Timestamp dueTimestamp = new Timestamp(dueDate.getTime());

	            String[] items = request.getParameterValues("items");
	            String[]	 descriptions = request.getParameterValues("description");
	            double[] unitCosts = Arrays.stream(request.getParameterValues("unitcost"))
	                .mapToDouble(Double::parseDouble)
	                .toArray();
	            int[] quantities = Arrays.stream(request.getParameterValues("qty"))
	                .mapToInt(Integer::parseInt)
	                .toArray();
	            
	            // Perform database operations to save invoice and items
	            Connection conn = DBUtil.provideConnection();
	            if (conn != null) {
	            	PreparedStatement invoiceStatement = conn.prepareStatement(
	            		    "UPDATE invoice SET client=?, Project=?, Email=?, Tax=?, ClientAddress=?, BillingAddress=?, Invoicedate=?, DueDate=?, OtherInformation=?, discount=?, taxamount=?, grandtotal=? WHERE id=?",
	            		    PreparedStatement.RETURN_GENERATED_KEYS
	            		);


	                invoiceStatement.setString(1, client);
	                invoiceStatement.setString(2, project);
	                invoiceStatement.setString(3, email);
	                invoiceStatement.setDouble(4, selectedTax);
	                invoiceStatement.setString(5, clientAddress);
	                invoiceStatement.setString(6, billingAddress);
	   	         invoiceStatement.setString(7, invoicedate);
	   	         invoiceStatement.setString(8, dueDate);
	   	      //  OtherInformation,discount,taxamount,grandtotal   	         
	   	      invoiceStatement.setString(9, OtherInformation);
	   	      invoiceStatement.setDouble(10, discount);
	   	   invoiceStatement.setDouble(11, taxamount);
	   	 invoiceStatement.setDouble(12, grandtotal);
	   	 invoiceStatement.setString(13, id);
			     
	   	      int affectedRows = invoiceStatement.executeUpdate();

	   	   if (affectedRows > 0) {
	   	       ResultSet generatedKeys = invoiceStatement.getGeneratedKeys();
	   	       //if (generatedKeys.next()) {
	   	          // int invoiceId = generatedKeys.getInt(1);

	   	           // Create a single prepared statement for batch insert of invoice items
	   	           String itemInsertSQL = "UPDATE invoiceitems SET Item=?, Description=?, UnitCost=?, Qty=?, Amount=? WHERE invoiceid=?";
	   	           PreparedStatement itemStatement = conn.prepareStatement(itemInsertSQL);

	   	           for (int i = 0; i < items.length; i++) {
	   	               double amount = unitCosts[i] * quantities[i];
	   	               
	   	               itemStatement.setString(1, items[i]);
	   	               itemStatement.setString(2, descriptions[i]);
	   	               itemStatement.setDouble(3, unitCosts[i]);
	   	               itemStatement.setInt(4, quantities[i]);
	   	               itemStatement.setDouble(5, amount);
	   	               itemStatement.setString(6, id);
	   	               
	   	               // Add the current statement to the batch
	   	               itemStatement.addBatch();
	   	           }

	   	           // Execute the batch insert
	   	           itemStatement.executeBatch();
	   	           itemStatement.close();
	   	       }

	   	       // Close the database connection
	   	       conn.close();
	   	    invoiceStatement.close();
	   	   }

	   	 // }   
        
	           // Redirect to a success page
	            response.sendRedirect("invoices.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle any exceptions here and redirect to an error page if needed
	            response.sendRedirect("error.jsp");
	        }
	    }

		public String getInvoiceItemId() {
			// TODO Auto-generated method stub
			return null;
		}
		
}