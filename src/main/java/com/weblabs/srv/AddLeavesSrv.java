package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.weblabs.service.impl.AddLeavesServiceImp;

@WebServlet("/AddLeavesSrv")
public class AddLeavesSrv extends HttpServlet{

	private static final long serialVersionUID = 1L;
	//private static final String addteam = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String status = "Add Leaves Failed!";
        String Employee = request.getParameter("selectedEmployee"); 
        String Starting_At = request.getParameter("starting_at");
        String Ending_On = request.getParameter("ends_on");
        String Days = request.getParameter("days_count");
        String Reason = request.getParameter("reason");
        String Employee_Id = request.getParameter("selectedEmployee");
       
       AddLeavesServiceImp leave = new  AddLeavesServiceImp();
       status =leave.addLeaves(Employee, Starting_At, Ending_On, Days, Reason,Employee_Id);
        

	   RequestDispatcher rd = request.getRequestDispatcher("add_leave.jsp?message=" + status);
      rd.forward(request, response);
   } 
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

doGet(request, response);
}
}

