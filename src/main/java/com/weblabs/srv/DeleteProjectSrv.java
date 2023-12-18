
package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddProjectServiceImp;

@WebServlet("/DeleteProjectSrv")
public class DeleteProjectSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String project_id = request.getParameter("project_id");

    	
    	AddProjectServiceImp tax = new AddProjectServiceImp();

		String status = tax.deleteProject(project_id);
	
        RequestDispatcher rd = request.getRequestDispatcher("delete_project.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
