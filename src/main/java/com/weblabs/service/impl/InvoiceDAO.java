package com.weblabs.service.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddClient;
import com.weblabs.beans.AddInvoice;
import com.weblabs.beans.AddInvoiceItems;
import com.weblabs.utility.DBUtil;

public class InvoiceDAO {

	public static List<AddInvoice> getFilteredInvoices(String whereClause, int start, int limit) {
		List<AddInvoice> filteredInvoices = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = DBUtil.provideConnection();
			String query;
			if (whereClause != null && !whereClause.isEmpty()) {
				
				query = "SELECT invoice.id, client, Project, Email, Tax, ClientAddress, BillingAddress, invoicedate, duedate, OtherInformation, \r\n"
						+ "discount, taxamount, grandtotal, Tax,Discount,  grandTotal from invoice\r\n" + "WHERE "
						+ whereClause + " LIMIT ?, ?;";

			} else {
				/*
				 * query =
				 * "SELECT invoice.id, client, Project, Email, Tax, ClientAddress, BillingAddress, invoicedate, duedate, OtherInformation, \r\n"
				 * +
				 * "discount, taxamount, grandtotal, Tax,Discount,  grandTotal,  invoiceitems.id as invoiceitemsid, Item, Description, \r\n"
				 * + "UnitCost, Qty, Amount from invoice\r\n" +
				 * "join invoiceitems on invoice.id = invoiceitems.invoiceid LIMIT ?, ?;";
				 */

				query = "SELECT invoice.id, client, Project, Email, Tax, ClientAddress, BillingAddress, invoicedate, duedate, OtherInformation, \r\n"
						+ "discount, taxamount, grandtotal, Tax,Discount,  grandTotal from invoice\r\n"
						+ " LIMIT ?, ?;";
			}
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, start);
			preparedStatement.setInt(2, limit);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				AddInvoice invoice = new AddInvoice();
				invoice.setId(resultSet.getString("id"));
				invoice.setClient(resultSet.getString("client"));
				invoice.setProject(resultSet.getString("Project"));
				invoice.setEmail(resultSet.getString("Email"));
				invoice.setTax(resultSet.getString("Tax"));
				invoice.setClientAddress(resultSet.getString("ClientAddress"));
				invoice.setBillingAddress(resultSet.getString("BillingAddress"));
				invoice.setInvoicedate(resultSet.getString("InvoiceDate"));
				invoice.setDueDate(resultSet.getString("DueDate"));
				invoice.setOtherInformation(resultSet.getString("OtherInformation"));
				invoice.setDiscount(resultSet.getString("Discount"));
				invoice.setTaxamount(resultSet.getString("TaxAmount"));
				invoice.setGrandtotal(resultSet.getString("grandTotal"));

				// Get associated invoice items for each invoice
				// List<AddInvoiceItems> invoiceItems = getInvoiceItemsByInvoiceId(connection,
				// invoice.getId());

				// invoice.setInvoiceItems(invoiceItems);

				filteredInvoices.add(invoice);
			}
		} catch (SQLException e) {
			// Handle exceptions or log them properly
			e.printStackTrace();
		} finally {
			// closeResources(connection, preparedStatement, resultSet);
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				// Handle exceptions
				e.printStackTrace();
			}
		}

		return filteredInvoices;
	}

	public static List<AddInvoiceItems> getInvoiceItemsByInvoiceId(String invoiceId) {
	    List<AddInvoiceItems> invoiceItemsByInvoiceId = new ArrayList<>();
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        connection = DBUtil.provideConnection();
	        String query = "SELECT InvoiceId, Item, Description, UnitCost, Qty, Amount FROM invoiceitems WHERE InvoiceId = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, invoiceId);

	        resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	            AddInvoiceItems invoiceItem = new AddInvoiceItems();
	            invoiceItem.setInvoiceid(resultSet.getString("InvoiceId"));
	            invoiceItem.setItem(resultSet.getString("Item"));
	            invoiceItem.setDescription(resultSet.getString("Description"));
	            invoiceItem.setUnitCost(resultSet.getString("UnitCost"));
	            invoiceItem.setQty(resultSet.getString("Qty"));
	            invoiceItem.setAmount(resultSet.getString("Amount"));
	            invoiceItemsByInvoiceId.add(invoiceItem);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (Exception e) {
	            // Handle exceptions
	            e.printStackTrace();
	        }
	    }

	    return invoiceItemsByInvoiceId;
	}

	 



	public static int totalCount() {
		int count = 0;
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = DBUtil.provideConnection();
			String query = "select count(*) as count from invoice";
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return count;
	}

	public static double getSumOfAmountForAllItems() {
	    double sum = 0.0;
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        connection = DBUtil.provideConnection();
	        String query = "SELECT SUM(Amount) AS totalAmount FROM invoiceitems";
	        preparedStatement = connection.prepareStatement(query);
	        resultSet = preparedStatement.executeQuery();

	        if (resultSet.next()) {
	            sum = resultSet.getDouble("totalAmount");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (resultSet != null)
	                resultSet.close();
	            if (preparedStatement != null)
	                preparedStatement.close();
	            if (connection != null)
	                connection.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return sum;
	}

	
	  public static List<AddInvoice> getAllInvoice() {
	        List<AddInvoice> allInvoice = new ArrayList<>();
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            connection = DBUtil.provideConnection();
	            String query = "SELECT  invoice.id ,grandTotal FROM invoice";
	            preparedStatement = connection.prepareStatement(query);
	            resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	            	AddInvoice cli = new AddInvoice();
	                 cli.setId(resultSet.getString("id"));
	                 cli.setGrandtotal(resultSet.getString("grandTotal"));
	                 allInvoice.add(cli);
	            }
	        } catch (Exception e) {
	            // Handle exceptions
	            e.printStackTrace();
	        } finally {
	            // Close database resources (connection, statement, result set)
	            try {
	                if (resultSet != null) resultSet.close();
	                if (preparedStatement != null) preparedStatement.close();
	                if (connection != null) connection.close();
	            } catch (Exception e) {
	                // Handle exceptions
	                e.printStackTrace();
	            }
	        }

	        return allInvoice;
	    }

//retriving data of invoiceid using clientid	  
	  public static List<String> getDistinctInvoiceID(int selectedClientIDInt) {
		    List<String> months = new ArrayList<>();

		    try (Connection connection = DBUtil.provideConnection()) {
		        if (connection != null) {
		            String sql = "SELECT DISTINCT invoice.id FROM invoice WHERE client = ? ";
		            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
		                preparedStatement.setInt(1,selectedClientIDInt );

		                try (ResultSet resultSet = preparedStatement.executeQuery()) {
		                    while (resultSet.next()) {
		                        // Retrieve the month as a String
		                        String month = resultSet.getString("id");
		                        
		                        // Add the month to the list
		                        months.add(month);
		                    }
		                }
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        // Handle the exception or log it as needed
		    }

		    return months;
		}
	  
	  
	  
	//retriving data of GrandAmt(paymentamt in payment DB) using invoiceid	 
	  
	  public static String getPaymentAmount(int selectedInvoiceIDInt) {
		    String paymentAmount = null;

		    try (Connection connection = DBUtil.provideConnection()) {
		        if (connection != null) {
		            String sql = "SELECT min(payment_amt) as payment_amt FROM payment WHERE invoice_id = ? ";
		            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
		                preparedStatement.setInt(1, selectedInvoiceIDInt);

		                try (ResultSet resultSet = preparedStatement.executeQuery()) {
		                    if (resultSet.next() ) {
		                        // Retrieve the payment amount as a String
		                        paymentAmount = resultSet.getString("payment_amt");
		                    }
		                    if (paymentAmount == null || "null".equals(paymentAmount) || paymentAmount.isEmpty()) {
		                    	Connection conn = DBUtil.provideConnection();
		                    	String sql1 = "select grandtotal from invoice where id=? ";
		                    	PreparedStatement preparedStatement1 = conn.prepareStatement(sql1);
		                    	preparedStatement1.setInt(1, selectedInvoiceIDInt);
		                    	ResultSet resultSet1 = preparedStatement1.executeQuery();
		                    	if (resultSet1.next() )
		                    	paymentAmount = resultSet1.getString("grandtotal");
		                    }
		                }
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        // Handle the exception or log it as needed
		    }

		    return paymentAmount;
		}

	  
	  
	  
	  //CLIENTUSERNAME KOSAM
	  public static List<String> getDistinctInvoiceID(String selectedClientUsername) {
		    List<String> invoiceIDs = new ArrayList<>();

		    try (Connection connection = DBUtil.provideConnection()) {
		        if (connection != null) {
					/*
					 * String sql = "SELECT DISTINCT invoice.id FROM invoice " +
					 * "JOIN clients ON invoice.client = clients.Clientid " +
					 * "WHERE clients.UserName = ?";
					 */
//		        	String sql = "SELECT DISTINCT invoice.id " +
//		                    "FROM invoice " +
//		                    "INNER JOIN ( " +
//		                    "    SELECT invoice_id " +
//		                    "    FROM hrms1.partial_payments " +
//		                    "    GROUP BY invoice_id " +
//		                    "    HAVING MIN(balance_amt) > 0 " +
//		                    ") AS pp ON invoice.id = pp.invoice_id " +
//		                    "WHERE client = ? ";
		        	
		        	String sql = "SELECT DISTINCT invoice.id \n"
		        			+ "FROM invoice\n"
		        			+ "WHERE invoice.id NOT IN (\n"
		        			+ "    SELECT invoice_id \n"
		        			+ "    FROM hrms1.partial_payments \n"
		        			+ "    GROUP BY invoice_id \n"
		        			+ "    HAVING MIN(balance_amt) <= 0\n"
		        			+ ") and invoice.client= ? ";
        			        	
		        	


		            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
		                preparedStatement.setString(1, selectedClientUsername);

		                try (ResultSet resultSet = preparedStatement.executeQuery()) {
		                    while (resultSet.next()) {
		                        // Retrieve the invoice ID as a String
		                        String invoiceID = resultSet.getString("id");

		                        // Add the invoice ID to the list
		                        invoiceIDs.add(invoiceID);
		                    }
		                }
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        // Handle the exception or log it as needed
		    }

		    return invoiceIDs;
		}


	  //duedate
	  public static String getduedate(int selectedInvoiceIDInt) {
		    String duedate = null;

		    try (Connection connection = DBUtil.provideConnection()) {
		        if (connection != null) {
		            String sql = "SELECT duedate FROM invoice WHERE id = ? ";
		            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
		                preparedStatement.setInt(1, selectedInvoiceIDInt);

		                try (ResultSet resultSet = preparedStatement.executeQuery()) {
		                    if (resultSet.next()) {
		                        // Retrieve the duedate  as a String
		                    	duedate = resultSet.getString("duedate");
		                    }
		                }
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        // Handle the exception or log it as needed
		    }

		    return duedate;
		}

	  
}
