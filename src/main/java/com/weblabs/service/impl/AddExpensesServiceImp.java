package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.weblabs.service.AddExpenses;
import com.weblabs.utility.DBUtil;

public class AddExpensesServiceImp implements AddExpenses{

	@Override
	public String addExpenses(String ItemName, String PurchaseDate, String PurchasedBy,
			String Amount, String PaidBy, String Status, String Attachments,String Supplierid) {
		String Status1 = "Expenses Adding Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("INSERT INTO expenses (ItemName,PurchaseDate, PurchasedBy,Amount,PaidBy,Status,Attachments,supplierID) VALUES (?,?,?,?,?,?,?,?)");
            ps.setString(1, ItemName);
            ps.setString(2, PurchaseDate);
            ps.setString(3, PurchasedBy);
            ps.setString(4, Amount);
            ps.setString(5, PaidBy);
            ps.setString(6, Status);
            ps.setString(7, Attachments);
            ps.setString(8, Supplierid);
           
            int k = ps.executeUpdate();

            if (k > 0) {
                Status1 = "Training Added Successfully!";
            }
        } catch (SQLException e) {
            Status1 = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status1;
	}

	@Override
	public String editExpenses(String Id, String ItemName, String PurchaseDate, String PurchasedBy,
			String Amount, String PaidBy, String Status, String Attachments,String Supplierid) {
		
		String Status3 = "Updating Goals Failed!";

		
        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("UPDATE expenses SET ItemName=?,supplierID=?,PurchaseDate=?, PurchasedBy=?,Amount=?,PaidBy=?,Status=?,Attachments=? WHERE Id = ?");
        	 ps.setString(1, ItemName);  
        	 ps.setString(2, Supplierid);
             ps.setString(3, PurchaseDate);
             ps.setString(4, PurchasedBy);
             ps.setString(5, Amount);
             ps.setString(6, PaidBy);
             ps.setString(7, Status);
             ps.setString(8, Attachments);
            ps.setString(9, Id);
           
           
            int k = ps.executeUpdate();

            if (k > 0) {
            	Status3 = "Updating Successfully!";
            }
        } catch (SQLException e) {
        	Status3 = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status3;
	}

	@Override
	public String deleteExpenses(String Id) {
		String Status2 = "Training delete Failed!";

        Connection con = DBUtil.provideConnection();
        PreparedStatement ps = null;

        try {
        	ps = con.prepareStatement("DELETE FROM expenses  WHERE id = ?");
            ps.setString(1, Id);
           
            int k = ps.executeUpdate();

            if (k > 0) {
            	Status2 = "Training deleted Successfully!";
            }
        } catch (SQLException e) {
        	Status2 = "Error: " + e.getMessage();
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(con);
            DBUtil.closeConnection(ps);
        }

        return Status2;
	}

}
