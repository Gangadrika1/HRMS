package com.weblabs.srv;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.PayrollDAO;

@WebServlet("/FetchMonthsServlet")
public class FetchMonthsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String selectedYear = request.getParameter("year");

            if (selectedYear != null && !selectedYear.isEmpty()) {
                int selectedYearInt = Integer.parseInt(selectedYear);
                List<String> months = PayrollDAO.getDistinctMonths(selectedYearInt);

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