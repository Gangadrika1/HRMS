package com.weblabs.srv;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.utility.DBUtil;




@WebServlet("/GenaratePayslipSRV")
public class GenaratePayslipSRV extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your code to handle GET requests
        commonLogic(request, response);
	}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        commonLogic(request, response);
    
    }
    private void commonLogic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
    	    String status="adding payslip fail";
        	String Year = request.getParameter("year");
            String Month = request.getParameter("month");
            Connection con = DBUtil.provideConnection();
            PrintWriter out = response.getWriter();
            if(con != null) {
                try {
                	PreparedStatement ps = null;
                	
                    // Insert data into payroll_deduction
                	ps = con.prepareStatement("INSERT INTO payslips \r\n" + 
                			"                	        (DepartmentId, payroll_id, CostCenter, Designationid, DOB, Bank_AC_No, DOJ, Employee_Id) \r\n" + 
                			"                	        SELECT DISTINCT employees.DepartmentId, payroll.payroll_id, assignee.projectID AS CostCenter,  \r\n" + 
                			"                	        employees.Designationid, profile.BirthDate AS DOB, bankdetails.BankAccountNo AS Bank_AC_No,  \r\n" + 
                			"                	        employees.Joining_Date AS DOJ, employees.Employee_Id AS Employee_Id  \r\n" + 
                			"                	        FROM payroll\r\n" + 
                			"                            \r\n" + 
                			"                	        JOIN payrollemloyeeassignment ON payroll.payroll_id = payrollemloyeeassignment.payroll_id\r\n" + 
                			"                             \r\n" + 
                			"                             join employees  on employees.Employee_Id = payrollemloyeeassignment.Employee_Id \r\n" + 
                			"                	        LEFT JOIN payroll_deduction ON payroll_deduction.payroll_id = payroll.payroll_id  \r\n" + 
                			"                	        LEFT JOIN payroll_addition ON payroll_addition.payroll_id = payroll.payroll_id  \r\n" + 
                			"                	        LEFT JOIN payrolladditionassignment ON payrolladditionassignment.employee_id = employees.employee_id  \r\n" + 
                			"                	        LEFT JOIN payrolldeductionassignment ON payrolldeductionassignment.employee_id = employees.employee_id  \r\n" + 
                			"                	        \r\n" + 
                			"                            LEFT JOIN leaves ON leaves.employee_id = employees.employee_id  \r\n" + 
                			"                	        LEFT JOIN assignee ON assignee.Employee_Id = employees.Employee_Id  \r\n" + 
                			"                	        LEFT JOIN profile ON profile.Employee_Id = employees.Employee_Id  \r\n" + 
                			"                	        LEFT JOIN bankdetails ON bankdetails.BankAccountNo = employees.Employee_Id  \r\n" + 
                			"                 	        JOIN salary ON salary.employee_id = employees.employee_id  \r\n" + 
                			"                 	        WHERE payroll.year = ? AND Month = ? AND is_opened = 0;");

                   
                    ps.setString(1, Year);
                    ps.setString(2, Month);
                    int k = ps.executeUpdate();

    	            if (k > 0) {
    	                status = "tax Added Successfully!";
    	            }
                 else {
					/*
					 * // Display an alert if k is not greater than 0
					 * out.println("<script type=\"text/javascript\">");
					 * out.println("alert('Error: Tax not added. Please try again.');"); //
					 * out.println("window.location = 'Genatare_Payslip.jsp';");
					 * out.println("</script>");
					 */
                    // You might want to include return; here to stop further execution
                	 response.sendRedirect("Genatare_Payslip.jsp");
                 }
                    
               

                // Redirect to a success page
				 response.sendRedirect("PayslipList.jsp"); 
                con.close();
                }
    catch (Exception e) {
        e.printStackTrace();
        
        response.sendRedirect("error.jsp");
    }
} else {
   
    response.sendRedirect("error.jsp");
}
}
    }    

