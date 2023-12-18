package com.weblabs.srv;

	import java.io.IOException;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;

	import com.weblabs.beans.AddOverTime;
	import com.weblabs.service.impl.AddOverTimeImpl;
				
	@WebServlet("/EditOvertimeSrv")
	public class EditOvertimeSrv extends HttpServlet {
	    private static final long serialVersionUID = 1L;

	    //public UpdateEmployeeSrv() {
	       // super();
	   // }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	      //  HttpSession session = request.getSession();
	      //  String userType = (String) session.getAttribute("usertype");
	      //  String userName = (String) session.getAttribute("username");
	      //  String password = (String) session.getAttribute("password");

	       // if (userType == null || !userType.equals("admin")) {
	          //  response.sendRedirect("login.jsp?message=Access Denied, Login As Admin!!");
	           // return;
	       // } else if (userName == null || password == null) {
	           // response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	          //  return;
	        //}

	        // Login success
	        String status = "Edit Employee salary Failed!";
	        String id= request.getParameter("id");
	        String employee = request.getParameter("employee");
	        String overtimedate = request.getParameter("overtimedate");
	        String hours = request.getParameter("hours");
	        String type= request.getParameter("type");
	        String description= request.getParameter("description");
	      

	        AddOverTime time = new AddOverTime();
	        time.setId(id);
	        time.setEmployee_Id(employee);
	        time.setOverTime_Date(overtimedate);
	        time.setHours (hours);
	        time.setType(type);
	        time.setDescription(description);
	        
	        

	        AddOverTimeImpl dao = new AddOverTimeImpl();
	        

	        String status1 = dao.editovertime(id,employee,overtimedate,hours,type,description );

	        RequestDispatcher rd = request.getRequestDispatcher("overtime.jsp?message=" + status);
	        rd.forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	}
	
	

