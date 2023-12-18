
package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.beans.TasksBean;
import com.weblabs.service.impl.TasksServiceImp;

@WebServlet("/EditTaskSrv")
public class EditTaskSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	
    	String task_id = request.getParameter("task_id");
    	String project_id = request.getParameter("project_id");
    	String description = request.getParameter("description");
    	String start_date = request.getParameter("start_date");
    	String end_date = request.getParameter("end_date");
    	String assigned_resource = request.getParameter("assigned_resource");
    	String is_completed =request.getParameter("is_completed");
    	
  
    	TasksBean goals = new TasksBean();
    	goals.setTask_id(task_id);
        goals.setProject_id(project_id);
        goals.setDescription(description);
        goals.setStart_date(start_date);
        goals.setEnd_date(end_date);
        goals.setAssigned_resource(assigned_resource);
        goals.setIs_completed(is_completed);
      
        
        TasksServiceImp goal=new TasksServiceImp();
    	String Statuss = goal.edittasks(task_id, project_id, description, start_date, end_date, assigned_resource, is_completed);
		
        RequestDispatcher rd = request.getRequestDispatcher("edit_tasks.jsp?message=" + Statuss);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
}
}
