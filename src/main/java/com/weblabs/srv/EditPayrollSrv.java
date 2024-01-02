package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.Payroll;
import com.weblabs.service.impl.PayrollServiceimp;

@WebServlet("/EditPayrollSrv")
public class EditPayrollSrv extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// private static final String addteam = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String status = "updating";

		String payroll_id = request.getParameter("payroll_id");
		/* String name = request.getParameter("name"); */
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String isopen = request.getParameter("isopen");
		String ranby = request.getParameter("ranby");
		String lastime = request.getParameter("lasttime");

		Payroll dept = new Payroll();
		dept.setPayroll_id(payroll_id);
		dept.setYear(year);
		dept.setMonth(month);
		dept.setIs_opened(isopen);
		dept.setRanby(ranby);
		dept.setLast_modified_time(lastime);

		PayrollServiceimp dao = new PayrollServiceimp();

		status = dao.editExpenses(payroll_id, year, month, isopen, ranby, lastime);

		RequestDispatcher rd = request.getRequestDispatcher("payroll-items.jsp?message=" + status);
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
