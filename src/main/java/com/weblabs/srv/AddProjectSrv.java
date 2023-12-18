package com.weblabs.srv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.CreateProject;
import com.weblabs.service.impl.AddProjectServiceImp;
import com.weblabs.service.impl.ProjectDAO;
import com.weblabs.utility.DBUtil;

@WebServlet("/AddProjectSrv")
public class AddProjectSrv extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your code to handle GET requests
        commonLogic(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        commonLogic(request, response);
    }

    private void commonLogic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//Connection conn = null;
    	try 
        {
        String status = "Add Project Failed!";
        String projectname = request.getParameter("projectname");
        String Clientid = request.getParameter("Clientid");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String rate = request.getParameter("rate");
        String hourly = request.getParameter("hourly");
        String priority = request.getParameter("priority");
        String projectleader = request.getParameter("projectleader");
        String[] addteam = request.getParameterValues("addteam");
        String description = request.getParameter("description");
        String uploadfile = request.getParameter("uploadfile");
        String pid=null;
        Connection conn = DBUtil.provideConnection();
        if (conn != null) {
            try {
                // Insert data into payroll_addition
                String insertAdditionSQL = "INSERT INTO project (projectname,Clientid,startdate,enddate,rate,hourly,priority,projectleader,description,uploadfile) VALUES (?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(insertAdditionSQL, PreparedStatement.RETURN_GENERATED_KEYS);
                
                ps.setString(1, projectname);
                ps.setString(2, Clientid);
                ps.setString(3, startdate);
                ps.setString(4, enddate);
                ps.setString(5, rate);
                ps.setString(6, hourly);
                ps.setString(7, priority);
                ps.setString(8, projectleader);
                ps.setString(9, description);
                ps.setString(10, uploadfile);
          // Get the affected rows
                int affectedRows = ps.executeUpdate();

                if (affectedRows > 0) {
					/*
					 * List<CreateProject> cp = ProjectDAO.getAllProjects(); for(CreateProject cpp:
					 * cp) { pid= cpp.getProject_id(); }
					 */
                    ResultSet generatedKeys = ps.getGeneratedKeys();
                    if (generatedKeys.next()) {
						 int additionId = generatedKeys.getInt(1); 

                        // If at least one employee is selected, create a batch insert statement for payroll_addition_assignee
                        if (addteam != null && addteam.length > 0) {
                            String insertAssigneSQL = "INSERT INTO project_assignee (project_id,Employee_Id,startdate,enddate) VALUES (?,?,?,?)";
                            PreparedStatement assigneStatement = conn.prepareStatement(insertAssigneSQL);
                            
                            
                            for (String employeeId : addteam) {
                            	assigneStatement.setInt(1, additionId);
                                assigneStatement.setString(2, employeeId);
                                assigneStatement.setString(3, startdate);
                                assigneStatement.setString(4, enddate);
                                assigneStatement.addBatch();
                                assigneStatement.executeBatch();
                             }
                          
                            }}}
            }
            
            catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            } finally {
                try {
                    if (conn != null) {
                    	 // assigneStatement.close();
						/* conn.close(); */ // Close the database connection
                    	  // Close the statement after executing the batch
                       

                        
                        // Redirect to a success page
                        response.sendRedirect("projects.jsp");
                        return; // Return after successful processing
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                    // Handle exception occurred while closing connection if needed
                }
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    						}
}
    }

