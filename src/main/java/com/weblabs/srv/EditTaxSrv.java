/*
 * package com.weblabs.srv;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.RequestDispatcher; import
 * javax.servlet.ServletException; import javax.servlet.annotation.WebServlet;
 * import javax.servlet.http.HttpServlet; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import com.weblabs.beans.AddTax; import
 * com.weblabs.service.impl.AddTaxServiceImpl;
 * 
 * @WebServlet("/EditTaxSrv") public class EditTaxSrv extends HttpServlet {
 * private static final long serialVersionUID = 1L;
 * 
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * 
 * // HttpSession session = request.getSession(); // String userType = (String)
 * session.getAttribute("usertype"); // String userName = (String)
 * session.getAttribute("username"); // String password = (String)
 * session.getAttribute("password");
 * 
 * // if (userType == null || !userType.equals("admin")) { //
 * response.sendRedirect("login.jsp?message=Access Denied, Login As Admin!!");
 * // return; // } else if (userName == null || password == null) { //
 * response.sendRedirect("login.jsp?message=Session Expired, Login Again!!"); //
 * return; //}
 * 
 * // Login success String status1 = "tax Failed!"; String id=
 * request.getParameter("TaxID"); String taxname =
 * request.getParameter("taxname"); String taxper =
 * request.getParameter("taxper"); String status =
 * request.getParameter("status");
 * 
 * 
 * AddTax employee = new AddTax(); employee.setID(id);
 * employee.setTaxName(taxname); employee.setTaxPercentage(taxper);
 * employee.setStatus (status);
 * 
 * 
 * AddTaxServiceImpl dao = new AddTaxServiceImpl();
 * 
 * 
 * status1 = dao.edittax(id,taxname,taxper,status);
 * 
 * RequestDispatcher rd = request.getRequestDispatcher("edit_tax.jsp?message=" +
 * status1); rd.forward(request, response); }
 * 
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { doGet(request, response); }
 * }
 * 
 * 
 * 
 */


package com.weblabs.srv;

	import java.io.IOException;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	import com.weblabs.beans.AddTax;
	import com.weblabs.service.impl.AddTaxServiceImpl;
				
	@WebServlet("/EditTaxSrv")
	public class EditTaxSrv extends HttpServlet {
	    private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	  
	        String status1 = "tax Failed!";
	        String id= request.getParameter("Id");
	        String taxname = request.getParameter("taxname");
	        String taxper = request.getParameter("taxper");
	        String status = request.getParameter("status");
	        

	        AddTax employee = new AddTax();
	        employee.setID(id);
	        employee.setTaxName(taxname);
	        employee.setTaxPercentage(taxper);
	        employee.setStatus (status);
	        
	        employee.setID(id);
	        employee.setTaxName(taxname);
	        employee.setTaxPercentage(taxper);
	        employee.setStatus(status);
	        
	        
	        
	        AddTaxServiceImpl dao = new AddTaxServiceImpl();
	        

	        String status2 = dao.edittax(id,taxname,taxper,status);

	        RequestDispatcher rd = request.getRequestDispatcher("edit_tax.jsp?message=" + status1);
	        rd.forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	}
	
	
