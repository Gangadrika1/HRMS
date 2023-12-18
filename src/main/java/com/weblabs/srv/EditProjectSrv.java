
package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.beans.CreateProject;
import com.weblabs.service.impl.AddProjectServiceImp;
			
@WebServlet("/EditProjectSrv")
public class EditProjectSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;

   

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

     
        String status = "Edit designation Failed!"; 
        String project_id= request.getParameter("project_id");
        String projectname = request.getParameter("projectname");
        String Clientid = request.getParameter("Clientid");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        String rate = request.getParameter("rate");
        String hourly = request.getParameter("hourly");
        String priority = request.getParameter("priority");
        String projectleader = request.getParameter("projectleader");
        String addteam = request.getParameter("addteam");
        String description = request.getParameter("description");
        String uploadfile = request.getParameter("uploadfile");
       
        
        CreateProject a = new CreateProject();
        a.setProject_id(project_id);
        a.setProjectname(projectname);
        a.setClientid(Clientid);
        a.setStartdate(startdate);
        a.setEnddate(enddate);
        a.setRate(rate);
        a.setHourly(hourly);
        a.setPriority(priority);
        a.setProjectleader(projectleader);
        a.setAddteam(addteam);
        a.setDescription(description);
        a.setUploadfile(uploadfile);
   
        AddProjectServiceImp dao = new AddProjectServiceImp();
   
        String status1 = dao.editProject(project_id, projectname, Clientid, startdate, enddate, rate, 
        		hourly, priority, projectleader, addteam, description, uploadfile);

        RequestDispatcher rd = request.getRequestDispatcher("edit_project.jsp?message=" + status1);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}