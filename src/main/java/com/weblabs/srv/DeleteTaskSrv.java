package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.TasksServiceImp;

@WebServlet("/DeleteTaskSrv")
public class DeleteTaskSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve task_id from the request parameter
        String taskid = request.getParameter("task_id");

        // Create an instance of TasksServiceImp
        TasksServiceImp taskService = new TasksServiceImp();

        // Call the deleteTasks method
        String status = taskService.deletetasks(taskid);

        // Redirect to delete_task.jsp with a status message
       // response.sendRedirect("delete_task.jsp?message=" + status);
        RequestDispatcher rd = request.getRequestDispatcher("delete_task.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If needed, handle POST requests (for consistency with the HttpServlet pattern)
        doGet(request, response);
    }
}
