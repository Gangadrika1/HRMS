package com.weblabs.srv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.utility.DBUtil;

@WebServlet("/AddPayrollServlet")
public class AddPayrollServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your code to handle GET requests
        commonLogic(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        commonLogic(request, response);
    }

    private void commonLogic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try 
        {

       	String[] empid = request.getParameterValues("empid");
		/* String name = request.getParameter("name"); */
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String isopen = request.getParameter("isopen");
        String ranby = request.getParameter("ranby");
        String lastime = request.getParameter("lasttime");
       
        Connection conn = DBUtil.provideConnection();
        if (conn != null) {
            try {
                // Insert data into payroll_addition
                String insertAdditionSQL = "INSERT INTO payroll (year,Month,Is_opened,Ranby,last_modified_time) VALUES (?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(insertAdditionSQL, PreparedStatement.RETURN_GENERATED_KEYS);
                
               
				 
    	        ps.setString(1, year);
    	        ps.setString(2, month);
    	        ps.setString(3, isopen);
    	        ps.setString(4, ranby);
    	        ps.setString(5, lastime);
        
    	        int affectedRows = ps.executeUpdate();

                if (affectedRows > 0) {
                    ResultSet generatedKeys = ps.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int additionId = generatedKeys.getInt(1);

                        // If at least one employee is selected, create a batch insert statement for payroll_addition_assignee
                        if (empid != null && empid.length > 0) {
                            String insertAssigneSQL = "INSERT INTO payrollemloyeeassignment (employee_id,payroll_id) VALUES (?, ?)";
                            PreparedStatement assigneStatement = conn.prepareStatement(insertAssigneSQL);

                            for (String employeeId : empid) {
                                assigneStatement.setString(1, employeeId);
                                assigneStatement.setInt(2, additionId); // Use the generated addition ID
                                assigneStatement.addBatch();
                            }

                            assigneStatement.executeBatch();
                            assigneStatement.close();
                        }

                        // Close the database connection
                        conn.close();

                        // Redirect to a success page
                        response.sendRedirect("payroll-items.jsp");
                    }
                }
                
            }
            
            catch (Exception e) {
                e.printStackTrace();
                
                response.sendRedirect("error.jsp");
            }
        } else {
           
            response.sendRedirect("error.jsp");
        }
    }
    
    catch (Exception e) 
    
    {
        e.printStackTrace();
       
        response.sendRedirect("error.jsp");
    }
			}

}
        
           
		/*
		 * PayrollServiceImpl payroll = new PayrollServiceImpl(); status
		 * =payroll.addpayroll(id, name, year, month, isopen,ranby,lastime,empid);
		 * 
		 * 
		 * RequestDispatcher rd =
		 * request.getRequestDispatcher("add_payroll.jsp?message=" + status);
		 * rd.forward(request, response); } protected void doPost(HttpServletRequest
		 * request, HttpServletResponse response) throws ServletException, IOException {
		 * 
		 * doGet(request, response);
		 * 
		 */
      
