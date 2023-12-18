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
import com.weblabs.service.impl.AddDeductionServiceImpl;

@WebServlet("/AddDeductionServlet")
public class AddDeductionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your code to handle GET requests
        commonLogic(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        commonLogic(request, response);
    }

    private void commonLogic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
                      
        	String payroll_id = request.getParameter("payrollid");
            String deductionName = request.getParameter("name");
            String unitCalculationParam = request.getParameter("unitcalculation");
            int unitCalculation = (unitCalculationParam != null) ? 1 : 0;
            String unitAmount = request.getParameter("unitamount");

            // Retrieve data from the request for AddPayrollAdditionAssignee
           
            String[] selectedEmployees = request.getParameterValues("selectedEmployee"); // Assuming "selectedEmployees" is the name of the checkboxes

            Connection conn = DBUtil.provideConnection();
            if (conn != null) {
                try {
                    // Insert data into payroll_deduction
                    String insertAdditionSQL = "INSERT INTO payroll_deduction (Payroll_id,DeductionName,  UnitCalculation, UnitAmount) VALUES ( ?, ?, ?, ?)";
                    PreparedStatement additionStatement = conn.prepareStatement(insertAdditionSQL, PreparedStatement.RETURN_GENERATED_KEYS);
                        
                    additionStatement.setString(1, payroll_id);
                    additionStatement.setString(2, deductionName);
                    additionStatement.setInt(3, unitCalculation);   
                    additionStatement.setString(4, unitAmount);
                    additionStatement.executeUpdate();
                  

                    // Get the affected rows
                    int affectedRows = additionStatement.executeUpdate();

                    if (affectedRows > 0) {
                        ResultSet generatedKeys = additionStatement.getGeneratedKeys();
                        if (generatedKeys.next()) {
                            int deductionId = generatedKeys.getInt(1);

                            // If at least one employee is selected, create a batch insert statement for payroll_deduction_assignee
                            if (selectedEmployees != null && selectedEmployees.length > 0) {
                                String insertAssigneSQL = "INSERT INTO payrolldeductionassignment (employee_id,payrolldeductionid,payroll_id) VALUES (?, ?,?)";
                                PreparedStatement assigneStatement = conn.prepareStatement(insertAssigneSQL);

                                for (String employeeId : selectedEmployees) {
                                    assigneStatement.setString(1, employeeId);
                                    assigneStatement.setInt(2, deductionId);
                                    assigneStatement.setString(3, payroll_id);
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