
package com.weblabs.srv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AddClientsDAO;

@WebServlet("/FetchEmailServlet")
public class FetchEmailServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String selectedInvoiceId = request.getParameter("client");

            if (selectedInvoiceId != null && !selectedInvoiceId.isEmpty()) {
                int selectedInvoiceIDInt = Integer.parseInt(selectedInvoiceId);
                // Assuming getPaymentAmount returns the payment amount as a String
                String ClientEmail = AddClientsDAO.getClientEmail(selectedInvoiceIDInt);

                // Send the payment amount as the response
                out.println(ClientEmail);
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








