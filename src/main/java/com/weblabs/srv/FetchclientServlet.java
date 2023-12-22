

package com.weblabs.srv;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.InvoiceDAO;
//FetchclientServlet

@WebServlet("/FetchclientServlet")
public class FetchclientServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String selectedClientID = request.getParameter("client_username");

            if (selectedClientID != null && !selectedClientID.isEmpty()) {
				// int selectecccIDInt = Integer.parseInt(selectedClientID); 
                List<String> months = InvoiceDAO.getDistinctInvoiceID(selectedClientID);

                // Generate HTML options for months
                for (String month : months) {
                    out.println("<option>" + month + "</option>");
                }
                out.flush();

            } else {
                out.println("<option></option>"); // Handle the case where the year is not selected
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}