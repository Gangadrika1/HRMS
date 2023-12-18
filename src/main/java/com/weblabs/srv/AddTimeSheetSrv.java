package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.service.impl.AddDepartmentImpl;
import com.weblabs.service.impl.AddTimeSheetImpl;

@WebServlet("/AddTimeSheetSrv")
public class AddTimeSheetSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//TimesheetID, Employee_Id, DateWorked, project_id, task_id, HoursWorked
        String status = "Add Timesheet Failed!";
       // String TimesheetID = request.getParameter("TimesheetID");
      
        String Employee_Id = request.getParameter("Employee_Id");
        String DateWorked = request.getParameter("DateWorked");
        String project_id = request.getParameter("project_id");
        String task_id = request.getParameter("task_id");
        String HoursWorked = request.getParameter("HoursWorked");
        
        
        AddTimeSheetImpl time =new AddTimeSheetImpl();
        status=time.addTimesheet(Employee_Id, DateWorked, project_id, task_id, HoursWorked);
        
        

        RequestDispatcher rd = request.getRequestDispatcher("timesheet.jsp");
        request.setAttribute("message", status);
        rd.forward(request, response);
    		  
		
    } 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
