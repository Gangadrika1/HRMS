package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.AddExpenses;
import com.weblabs.service.impl.AddExpensesServiceImp;


@WebServlet("/EditExpensesSrv")
public class EditExpensesSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String Id =request.getParameter("Id");
    	String itemName = request.getParameter("ItemName");       
        String purchaseDate = request.getParameter("PurchaseDate");
        String purchasedBy = request.getParameter("PurchasedBy");
        String amount = request.getParameter("Amount");
        String paidBy = request.getParameter("PaidBy");
        String status = request.getParameter("Status");
        String attachments = request.getParameter("Attachments");
        String Supplierid = request.getParameter("Supplierid");
        
        AddExpenses expense=new AddExpenses();
        expense.setItemName(itemName);
        expense.setPurchaseDate(purchaseDate);
        expense.setPurchasedBy(purchasedBy);
        expense.setAmount(amount);
        expense.setPaidBy(paidBy);
        expense.setStatus(status);
        expense.setAttachments(attachments);
        
        AddExpensesServiceImp expense1=new AddExpensesServiceImp();
    	String Statuss = expense1.editExpenses(Id, itemName, purchaseDate, purchasedBy, amount, paidBy, status, attachments,Supplierid);
		
        RequestDispatcher rd = request.getRequestDispatcher("expenses.jsp?message=" + Statuss);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
