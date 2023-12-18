package com.weblabs.srv;

	import java.io.IOException;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;

	import com.weblabs.beans.AddPF;
	import com.weblabs.service.impl.AddPFImpl;
				
	@WebServlet("/EditPFSrv")
	public class EditPFSrv extends HttpServlet {
	    private static final long serialVersionUID = 1L;

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
	        String status = "pf salary Failed!";
	        String id= request.getParameter("id");
	        String employeename = request.getParameter("employeename");
	        String pf = request.getParameter("pf");
	        String employeesharea = request.getParameter("employeesharea");
	        String organizationsharea= request.getParameter("organizationsharea");
	        String employeesharep= request.getParameter("employeesharep");
	        String organizationsharep= request.getParameter("organizationsharep");
	        String description= request.getParameter("description");
	      

	        AddPF employee = new AddPF();
	        employee.setId(id);
	        employee.setEmployee_Id(employeename);
	        employee.setProvidentFundType(pf);
	        employee.setEmployeeShareAmount (employeesharea);
	        employee.setOrganizationShareAmount(organizationsharea);
	        employee.setEmployeeSharePer(employeesharep);
	        employee.setOrganizationSharePer(organizationsharep);
	        employee.setDescription(description);
	        
	        AddPFImpl dao = new AddPFImpl();
	        

	        String status1 = dao.editpf(id,employeename,pf,employeesharea,organizationsharea,employeesharep,organizationsharep, description);

	        RequestDispatcher rd = request.getRequestDispatcher("edit_pf.jsp?message=" + status1);
	        rd.forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	}
	
	

