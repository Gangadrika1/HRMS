
package com.weblabs.srv;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.ProjectDAO;
//FetchclientServlet

@WebServlet("/FetchProjectnameServlet")
public class FetchProjectnameServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
        	String selectedClientID = request.getParameter("client");

            if (selectedClientID != null && !selectedClientID.isEmpty()) {
            	 int selectedClientIDs = Integer.parseInt(selectedClientID);
                List<String> projects = ProjectDAO.getDistinctProjectName(selectedClientIDs);

                // Generate HTML options for projects
                for (String project : projects) {
                    out.println("<option>" + project + "</option>");
                }
            } else {
                out.println("<option></option>"); // Handle the case where the client ID is not selected
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}

