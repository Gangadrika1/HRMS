
package com.weblabs.srv;

import java.io.IOException; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.TasksServiceImp;

@WebServlet("/AddTasksSrv")
public class AddTasksSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
	//	description, start_date, end_date, assigned_resource, is_completed
        String Status = "Add Training Failed!";
        String project_id = request.getParameter("project_id");
		String description = request.getParameter("description");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String assigned_resource = request.getParameter("assigned_resource");
        String is_completed = request.getParameter("is_completed");
        
        
	
        TasksServiceImp client=new TasksServiceImp();
	 Status =client.addtasks(project_id,description, start_date, end_date, assigned_resource, is_completed);
     

	   RequestDispatcher rd = request.getRequestDispatcher("tasks.jsp?message=" + Status);
rd.forward(request, response);
} 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {

doGet(request, response);
}
}
