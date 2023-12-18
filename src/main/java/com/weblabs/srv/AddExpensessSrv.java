package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AddExpensesServiceImp;

@WebServlet("/AddExpensessSrv")
public class AddExpensessSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
	
        String Status = "Add Training Failed!";
		String itemName = request.getParameter("ItemName");
        String purchaseDate = request.getParameter("PurchaseDate");
        String purchasedBy = request.getParameter("PurchasedBy");
        String amount = request.getParameter("Amount");
        String paidBy = request.getParameter("PaidBy");
        String status = request.getParameter("Status");
        String attachments = request.getParameter("Attachments");
        String Supplierid= request.getParameter("Supplierid");
	
	 AddExpensesServiceImp expense=new AddExpensesServiceImp();
	 Status =expense.addExpenses(itemName, purchaseDate, purchasedBy, amount, paidBy, status, attachments,Supplierid);
     

	   RequestDispatcher rd = request.getRequestDispatcher("expenses.jsp?message=" + Status);
rd.forward(request, response);
} 
	   protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
}