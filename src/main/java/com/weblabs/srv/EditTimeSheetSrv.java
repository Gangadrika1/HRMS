package com.weblabs.srv;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.beans.AddTimesheet;
import com.weblabs.service.impl.AddTimeSheetImpl;
			
@WebServlet("/EditTimeSheetSrv")
public class EditTimeSheetSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	
        String status = "Edit Employee Failed!";
        String TimesheetID= request.getParameter("TimesheetID");
        String Employee_Id = request.getParameter("Employee_Id");
        String DateWorked = request.getParameter("DateWorked");
        String project_id = request.getParameter("project_id");
        String task_id= request.getParameter("task_id");
        String HoursWorked= request.getParameter("HoursWorked");
        
      
        

        AddTimesheet employee = new AddTimesheet();
        employee.setTimesheetID(TimesheetID);
        employee.setEmployee_Id(Employee_Id);
        employee.setDateWorked(DateWorked);
        employee.setProject_id(project_id);
        employee.setTask_id(task_id);
        employee.setHoursWorked(HoursWorked);
       
        
        
        AddTimeSheetImpl dao = new AddTimeSheetImpl();

        String status1 = dao.editTimesheet(TimesheetID, Employee_Id, DateWorked, project_id, task_id, HoursWorked );

        RequestDispatcher rd = request.getRequestDispatcher("edit_timesheet.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
