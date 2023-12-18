package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.weblabs.beans.EmployeeBean;
import com.weblabs.service.impl.EmployeeServiceImpl;
			
@WebServlet("/EditEmployeeSrv")
public class EditEmployeeSrv extends HttpServlet {
    private static final long serialVersionUID = 1L;


   // public UpdateEmployeeSrv() {
       // super();
   // }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Edit Employee Failed!";
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email= request.getParameter("email");
        String phone= request.getParameter("phone");
        String department= request.getParameter("department");
        String designation= request.getParameter("designation");
        String joining_Date =request.getParameter("joiningdate");
        String Gender = request.getParameter("gender");
        String Location =request.getParameter("location");
        String PAN = request.getParameter("pan");
        String PF = request.getParameter("pf");
        String Pf_No = request.getParameter("Pf_No");
        String UAN = request.getParameter("uan");
        String VPF= request.getParameter("vpf");
        String ESI = request.getParameter("esi");
        String empid= request.getParameter("Employee_Id");
      
        

        EmployeeBean employee = new EmployeeBean();
        employee.setFirstName(firstname);
        employee.setLastName(lastname);
        employee.setUsername (username);
        employee.setEmail(email);
        employee.setPhone(phone);
        employee.setDepartment(department);
        employee.setDesignation(designation);
        employee.setJoining_Date(joining_Date);
        employee.setGender(Gender);
        employee.setLocation(Location);
        employee.setPAN(PAN);
        employee.setPF(PF);
        employee.setPf_No(Pf_No);
        employee.setUAN(UAN);
        employee.setVPF(VPF);
        employee.setESI(ESI);
        employee.setEmployee_ID(empid);
        
        

        EmployeeServiceImpl dao = new EmployeeServiceImpl();
        String status1 = dao.editEmployee(empid, firstname, lastname, username, email, phone, department, designation, joining_Date, Gender, Location, PAN, PF, Pf_No, UAN, VPF, ESI);

        RequestDispatcher rd = request.getRequestDispatcher("employee.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
