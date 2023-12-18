package com.weblabs.srv;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.weblabs.utility.DBUtil;
import com.weblabs.beans.AddAddition;
import com.weblabs.service.impl.AddAdditionServiceimpl;

@WebServlet("/AddAdditionServlet")
public class AddAdditionServlet extends HttpServlet {
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
                                  
        	String payroll_id = request.getParameter("payrollid");
            String additionName = request.getParameter("name");
            String category = request.getParameter("category");
            String unitCalculationParam = request.getParameter("unitcalculation");
            int unitCalculation = (unitCalculationParam != null) ? 1 : 0;
            String unitAmount = request.getParameter("unitamount");
            String[] selectedEmployees = request.getParameterValues("selectedEmployees");

            Connection conn = DBUtil.provideConnection();
            if (conn != null) {
                try {
                    // Insert data into payroll_addition
                    String insertAdditionSQL = "INSERT INTO payroll_addition (Payroll_id,AdditionName, Category, UnitCalculation, UnitAmount) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement additionStatement = conn.prepareStatement(insertAdditionSQL, PreparedStatement.RETURN_GENERATED_KEYS);
                    
                    additionStatement.setString(1, payroll_id);
                    additionStatement.setString(2, additionName);
                    additionStatement.setString(3, category);
                    additionStatement.setInt(4, unitCalculation);
                    additionStatement.setString(5, unitAmount);
                    additionStatement.executeUpdate();
                  
                    // Get the affected rows
                    int affectedRows = additionStatement.executeUpdate();

                    if (affectedRows > 0) {
                        ResultSet generatedKeys = additionStatement.getGeneratedKeys();
                        if (generatedKeys.next()) {
                            int additionId = generatedKeys.getInt(1);

                            // If at least one employee is selected, create a batch insert statement for payroll_addition_assignee
                            if (selectedEmployees != null && selectedEmployees.length > 0) {
                                String insertAssigneSQL = "INSERT INTO payrolladditionassignment (employee_id,Payrolladditionid,payroll_id) VALUES (?, ?,?)";
                                PreparedStatement assigneStatement = conn.prepareStatement(insertAssigneSQL);

                                for (String employeeId : selectedEmployees) {
                                    assigneStatement.setString(1, employeeId);
                                    assigneStatement.setInt(2, additionId); 
                                    assigneStatement.setString(3, payroll_id);
                                    // Use the generated addition ID
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