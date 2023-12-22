package com.weblabs.srv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.InvoiceDAO;

@WebServlet("/FetchPaymentAmountServlet")
public class FetchPaymentAmountServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String selectedInvoiceId = request.getParameter("invoice_id");

            if (selectedInvoiceId != null && !selectedInvoiceId.isEmpty()) {
                int selectedInvoiceIDInt = Integer.parseInt(selectedInvoiceId);
                // Assuming getPaymentAmount returns the payment amount as a String
                String paymentAmount = InvoiceDAO.getPaymentAmount(selectedInvoiceIDInt);

                // Send the payment amount as the response
                out.println(paymentAmount);
            } else {
                out.println(""); // Handle the case where the invoice ID is not selected
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}








