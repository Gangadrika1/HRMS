	package com.weblabs.srv;

	import java.io.IOException;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import com.weblabs.service.impl.AddDesignationImpl;

	import javax.servlet.RequestDispatcher;
	
@WebServlet("/DeleteDesignationSrv")
	public class DeleteDesignationSrv  extends HttpServlet {

		    private static final long serialVersionUID = 1L;

		    protected void doGet(HttpServletRequest request, HttpServletResponse response)
		            throws ServletException, IOException {

		  
		    	String id = request.getParameter("Designationid");

		    	AddDesignationImpl dept = new AddDesignationImpl();

				String status = dept.deletedesignation(id);
				
		        RequestDispatcher rd = request.getRequestDispatcher("delete_designation.jsp?message=" + status);
		        rd.forward(request, response);
		    }

		    protected void doPost(HttpServletRequest request, HttpServletResponse response)
		            throws ServletException, IOException {

		        doGet(request, response);
		    }
		}


