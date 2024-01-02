package com.weblabs.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weblabs.service.impl.AddTrainingServiceImp;

@WebServlet("/AddTrainingServlet")
public class AddTrainingSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// private static final String addteam = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String status = "Add Training Failed!";
		String TrainingType = request.getParameter("Type");
		String Trainer = request.getParameter("Trainer");
		String Employees = request.getParameter("Employees");
		String TrainingCost = request.getParameter("TrainingCost");
		String StartingDate = request.getParameter("StartingDate");
		String EndingDate = request.getParameter("EndingDate");
		String Description = request.getParameter("Description");
		String Status = request.getParameter("Status");

		AddTrainingServiceImp training = new AddTrainingServiceImp();
		status = training.addTraining(TrainingType, Trainer, Employees, TrainingCost, StartingDate, EndingDate,
				Description, Status);

		RequestDispatcher rd = request.getRequestDispatcher("training.jsp?message=" + status);
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
