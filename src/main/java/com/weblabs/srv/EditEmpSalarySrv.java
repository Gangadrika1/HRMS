package com.weblabs.srv;

	import java.io.IOException;


	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	import com.weblabs.beans.AddsalaryBean;
	import com.weblabs.service.impl.Addempsalaryserviceimpl;
				
	@WebServlet("/EditEmpSalarySrv")
	public class EditEmpSalarySrv extends HttpServlet {
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
	        String empid = request.getParameter("empid");
	        String basic = request.getParameter("basic");
	        String da = request.getParameter("da");
	        String hra= request.getParameter("hra");
	        String conveyance= request.getParameter("conveyance");
	        String allowance= request.getParameter("allowance");
	        String medicalallowance= request.getParameter("medicalallowance");
	        String tds= request.getParameter("tds");
	        String esi= request.getParameter("esi");
	        String pf= request.getParameter("pf");
	        String leave= request.getParameter("leave");
	        String proftax= request.getParameter("proftax");
	        String labourwelfare= request.getParameter("labourwelfare");
	        
	        AddsalaryBean employee = new AddsalaryBean();
	        employee.setEmployee_id(empid);
	        employee.setBasic(basic);
	        employee.setDA (da);
	        employee.setHRA(hra);
	        employee.setCONVEYANCE(conveyance);
	        employee.setALLOWANCE(allowance);
	        employee.setMEDICAL(medicalallowance);
	        employee.setTDS(tds);
	        employee.setESI(esi);
	        employee.setPF(pf);
	        employee.setLEAVE(leave);
	        employee.setPROF_TAX(proftax);
	        employee.setLABOUR_WELFARE(labourwelfare);
	      
	        Addempsalaryserviceimpl dao = new Addempsalaryserviceimpl();
	        
	        status = dao.editempsalary(empid,basic,da,hra,conveyance,
	        		allowance, medicalallowance, tds,  esi,  pf, leave,  proftax,labourwelfare);

	        RequestDispatcher rd = request.getRequestDispatcher("editsalary.jsp?message=" + status);
	        rd.forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	}
	
	

