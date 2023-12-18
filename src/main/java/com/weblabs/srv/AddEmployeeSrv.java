package com.weblabs.srv;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.EmployeeServiceImpl;


@WebServlet("/AddEmployeeSrv")
public class AddEmployeeSrv extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	
        String status = "Add Employee Failed!";
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email= request.getParameter("email");
        String password= request.getParameter("password");
        String employeeID= request.getParameter("employee_id");
        String phone= request.getParameter("phone");
        String department= request.getParameter("department");
        String designation= request.getParameter("designation");
        String picture= request.getParameter("picture");
        String Joining_Date = request.getParameter("Joining_Date");
        String Gender = request.getParameter("Gender");
        String Location = request.getParameter("Location");
        String PAN = request.getParameter("PAN");
        String PF = request.getParameter("PF");
        String pf_No = request.getParameter("Pf_No");
        String UAN = request.getParameter("UAN");
        String VPF = request.getParameter("VPF");
        String ESI = request.getParameter("ESI");
         
         
         EmployeeServiceImpl employee =new EmployeeServiceImpl();
         status=employee.addEmployee(firstname, lastname, username, email, password, employeeID, phone, department, designation,picture,Joining_Date,Gender,Location,PAN, PF,pf_No,UAN,VPF ,ESI);
        
         
         RequestDispatcher rd = request.getRequestDispatcher("addemployee.jsp?message=" + status);
	       rd.forward(request, response);
	    } 
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        doGet(request, response);
	    }
         
         
	}
         
    