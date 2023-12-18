package com.weblabs.srv;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import com.weblabs.utility.DBUtil;
import com.weblabs.beans.AddProfile;
import com.weblabs.beans.AddPersonalInformation;
import com.weblabs.beans.AddFamilyInformation;
import com.weblabs.beans.AddEmergencyInformation;
import com.weblabs.beans.AddBankInformation;
import com.weblabs.beans.AddEducationInformation;
import com.weblabs.beans.AddExperienceInformation;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.sql.Statement;
import java.util.UUID;

@WebServlet("/AddProfileServlet")
public class AddProfileServlet extends HttpServlet {

    private static final long serialVersionUID = -1361509398565715838L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        commonLogic(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        commonLogic(request, response);
    }

    private void commonLogic(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


	    Connection conn = null;

	
			// Generate a unique ID for Employee_id (you can customize this as per your
			// requirements)
			String empid = request.getParameter("empid");
			

			// Retrieve data from the form
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String date = request.getParameter("date");
			String rawGender = request.getParameter("gender");
			String address = request.getParameter("address");
			String state = request.getParameter("state");
			String country = request.getParameter("country");
			String pincode = request.getParameter("pincode");
			String phno = request.getParameter("phone");
			String department = request.getParameter("department");
			String designation = request.getParameter("designation");
			String report = request.getParameter("report");

			/* personal information */
			String passportNo = request.getParameter("passportno");
			String passportexpirydate = request.getParameter("passportexpirydate");
			String tel = request.getParameter("tel");
			String nation = request.getParameter("nation");
			String religion = request.getParameter("religion");
			String status = request.getParameter("status");
			String empspouse = request.getParameter("empspouse");
			String children = request.getParameter("children");

			/* family information */
			String name = request.getParameter("name");
			String relationship = request.getParameter("relationship");
			String dob = request.getParameter("dob");
			String phonee = request.getParameter("phonee");

			/* emergency information */
			String namee = request.getParameter("namee");
			String relationships = request.getParameter("relationships");
			String phone = request.getParameter("phone");
			String mobile = request.getParameter("mobile");

			/* bank information */
			String username = request.getParameter("username");
			String bankname = request.getParameter("bankname");
			String bankaccountno = request.getParameter("bankaccountno");
			String ifsccode = request.getParameter("ifsccode");
			String panno = request.getParameter("panno");

			/* education information */
			String instituion = request.getParameter("instituion");
			String subject = request.getParameter("subject");
			String startingdate = request.getParameter("startingdate");
			String completedate = request.getParameter("completedate");
			String degree = request.getParameter("degree");
			String grade = request.getParameter("grade");

			/* work experience */
			String companyname = request.getParameter("companyname");
			String location = request.getParameter("location");
			String jobposition = request.getParameter("jobposition");
			String periodfrom = request.getParameter("periodfrom");
			String periodto = request.getParameter("periodto");
			
			/*
			 * String periodFromDateValue = periodfrom ; // Replace with your actual date
			 * string String periodToDateValue = periodto ; // Replace with your actual date
			 * string
			 */			String formattedBirthDate  = date ;
			String formattedPassportExpiryDate = passportexpirydate;
			String formattedDOB;
			String formattedPeriodFromDate = periodfrom;
			String formattedPeriodToDate = periodto;
			String formattedStartingDate = startingdate;
			String formattedCompleteDate = completedate;

			// Trim the 'gender' value to remove whitespaces
			String gender = (rawGender != null) ? rawGender.trim() : "";

			// Check if the trimmed 'gender' value is one of the allowed values
			if (!Arrays.asList("Male", "Female", "Other").contains(gender)) {
				// Handle the case where the 'gender' value is not valid (set a default value or
				// throw an error)
				gender = "Other"; // You can set a default value or handle it as per your requirements
			}

			

			SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");
		
			SimpleDateFormat inputFormat1 = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

			try {
			    if (date != null && !date.isEmpty()) {
			        Date parsedBirthDate = inputFormat.parse(date);
			        formattedBirthDate = outputFormat.format(parsedBirthDate);
			        // Proceed with inserting 'formattedBirthDate' into your MySQL database
			    }else {
			        // If the date is null or empty, set it as null or handle it accordingly
			        formattedBirthDate = null; // or set a default value as needed
			    }

			    if (dob != null && !dob.isEmpty()) {
			        Date parsedDOB = inputFormat1.parse(dob);
			         formattedDOB = outputFormat.format(parsedDOB);
			        // Proceed with further processing or insertion
			    }else {
			        // If the date is null or empty, set it as null or handle it accordingly
			    	formattedDOB = null; // or set a default value as needed
			    }


			    
			    if (passportexpirydate != null && !passportexpirydate.isEmpty()) {
			        Date formattedped = inputFormat1.parse(passportexpirydate);
			         formattedPassportExpiryDate = outputFormat.format(formattedped);
			        // Proceed with further processing or insertion
			    }else {
			        // If the date is null or empty, set it as null or handle it accordingly
			        formattedBirthDate = null; // or set a default value as needed
			    }
			    
			    
			    if (startingdate != null && !startingdate.isEmpty()) {
			        Date formattedStartingDatee = inputFormat1.parse(startingdate);
			        formattedStartingDate = outputFormat.format(formattedStartingDatee);
			        // Proceed with further processing or insertion
			    }else {
			        // If the date is null or empty, set it as null or handle it accordingly
			        formattedBirthDate = null; // or set a default value as needed
			    }
			    
			    if (completedate != null && !completedate.isEmpty()) {
			        Date formattedCompleteDatee = inputFormat1.parse(completedate);
			        formattedCompleteDate = outputFormat.format(formattedCompleteDatee);
			        // Proceed with further processing or insertion
			    }else {
			        // If the date is null or empty, set it as null or handle it accordingly
			        formattedBirthDate = null; // or set a default value as needed
			    }
			    
			    
			    if (periodfrom != null && !periodfrom.isEmpty()) {
			        Date formattedPeriodFromDatee = inputFormat1.parse(periodfrom);
			        formattedPeriodFromDate = outputFormat.format(formattedPeriodFromDatee);
			        // Proceed with further processing or insertion
			    }else {
			        // If the date is null or empty, set it as null or handle it accordingly
			        formattedBirthDate = null; // or set a default value as needed
			    }
			    
			    
			    if (periodto != null && !periodto.isEmpty()) {
			        Date formattedPeriodToDatee = inputFormat1.parse(periodto);
			        formattedPeriodToDate = outputFormat.format(formattedPeriodToDatee);
			        
			    }else {
			        // If the date is null or empty, set it as null or handle it accordingly
			        formattedBirthDate = null; // or set a default value as needed
			    }

	
			 conn = DBUtil.provideConnection();
			if (conn != null) {
				// Insert into profile table
				PreparedStatement profileStatement = conn.prepareStatement(
						"INSERT INTO profile (Employee_Id, FirstName, LastName, BirthDate, Gender, Address, State, Country, PinCode, PhoneNumber, DepartmentName, DesignationName, ReportsTo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");

				profileStatement.setString(1, empid);
				profileStatement.setString(2, firstname);
				profileStatement.setString(3, lastname);
				profileStatement.setString(4, formattedBirthDate);
				profileStatement.setString(5, gender);
				profileStatement.setString(6, address);
				profileStatement.setString(7, state);
				profileStatement.setString(8, country);
				profileStatement.setString(9, pincode);
				profileStatement.setString(10, phno);
				profileStatement.setString(11, department);
				profileStatement.setString(12, designation);
				profileStatement.setString(13, report);

				int profileAffectedRows = profileStatement.executeUpdate();

						if (profileAffectedRows> 0)	{
							
							// Insert data into the personalinformation table
							PreparedStatement personalInfoStatement = conn.prepareStatement(
									"INSERT INTO personalinformation (Employee_id, PassportNo, PassportExpiryDate, Tel, Nationality, Religion, MaritalStatus, EmploymentOfSpouse, NumberOfChildren) VALUES (?,?,?,?,?,?,?,?,?)");
							personalInfoStatement.setString(1, empid);
							personalInfoStatement.setString(2, passportNo);
							personalInfoStatement.setString(3, formattedPassportExpiryDate);
							personalInfoStatement.setString(4, tel);
							personalInfoStatement.setString(5, nation);
							personalInfoStatement.setString(6, religion);
							personalInfoStatement.setString(7, status);
							personalInfoStatement.setString(8, empspouse);
							personalInfoStatement.setString(9, children);

							int personalInfoAffectedRows = personalInfoStatement.executeUpdate();

							if (personalInfoAffectedRows > 0) {
								
								

								// Now, insert data into the familyinformation table
								PreparedStatement familyInfoStatement = conn.prepareStatement(
										"INSERT INTO familyinformation (Employee_id, Name, Relationship, DateOfBirth, Phone) VALUES (?,?,?,?,?)");
								familyInfoStatement.setString(1, empid);
								familyInfoStatement.setString(2, name);
								familyInfoStatement.setString(3, relationship);
								familyInfoStatement.setString(4, formattedDOB);
								familyInfoStatement.setString(5, phonee);

								int familyInfoAffectedRows = familyInfoStatement.executeUpdate();

								if (familyInfoAffectedRows > 0) {
									

									

									
									

									// Insert data into the emergencycontact table
									PreparedStatement emergencyInfoStatement = conn.prepareStatement(
											"INSERT INTO emergencycontact (Employee_id, Name, Relationship, Phone, Mobile) VALUES (?,?,?,?,?)");
									emergencyInfoStatement.setString(1, empid);
									emergencyInfoStatement.setString(2, namee);
									emergencyInfoStatement.setString(3, relationships);
									emergencyInfoStatement.setString(4, phone);
									emergencyInfoStatement.setString(5, mobile);

									int emergencyInfoAffectedRows = emergencyInfoStatement.executeUpdate();

									if (emergencyInfoAffectedRows > 0) {
										

											// Insert data into the bankinformation table
											PreparedStatement bankInfoStatement = conn.prepareStatement(
													"INSERT INTO bankdetails (Employee_id, FullName, BankName, BankAccountNo, IFSCCode, PANNO) VALUES (?,?,?,?,?,?)");
											bankInfoStatement.setString(1, empid);
											bankInfoStatement.setString(2, username);
											bankInfoStatement.setString(3, bankname);
											bankInfoStatement.setString(4, bankaccountno);
											bankInfoStatement.setString(5, ifsccode);
											bankInfoStatement.setString(6, panno);

											int bankInfoAffectedRows = bankInfoStatement.executeUpdate();

											if (bankInfoAffectedRows > 0) {
												

													// Insert data into the educationinformation table
													PreparedStatement educationInfoStatement = conn
															.prepareStatement(
																	"INSERT INTO education (Employee_id, Institution, Subject, StartingDate, CompleteDate, Degree, Grade) VALUES (?,?,?,?,?,?,?)");
													educationInfoStatement.setString(1, empid);
													educationInfoStatement.setString(2, instituion);
													educationInfoStatement.setString(3, subject);
													educationInfoStatement.setString(4, formattedStartingDate);
													educationInfoStatement.setString(5, formattedCompleteDate);
													educationInfoStatement.setString(6, degree);
													educationInfoStatement.setString(7, grade);

													int educationInfoAffectedRows = educationInfoStatement
															.executeUpdate();

													if (educationInfoAffectedRows > 0) {
													
															// Insert data into the experienceinformation table
															PreparedStatement experienceInfoStatement = conn
																	.prepareStatement(
																			"INSERT INTO workexperience (Employee_id, CompanyName, Location, JobPosition, PeriodFrom, PeriodTo) VALUES (?,?,?,?,?,?)");
															experienceInfoStatement.setString(1, empid);
															experienceInfoStatement.setString(2, companyname);
															experienceInfoStatement.setString(3, location);
															experienceInfoStatement.setString(4, jobposition);
															experienceInfoStatement.setString(5,
																	formattedPeriodFromDate);
															experienceInfoStatement.setString(6,
																	formattedPeriodToDate);
															int experienceInfoAffectedRows = experienceInfoStatement.executeUpdate();

															if (experienceInfoAffectedRows > 0) {
																
														
							
							
								response.sendRedirect("success.jsp");
							} else {
								// Handle the case where any insertion failed
								response.sendRedirect("error.jsp");
														
						}
			}
			}	
			}
								}
							}
						}
			}
}  catch (SQLException | ParseException e) {
    e.printStackTrace();
    // Redirect to an error page
response.sendRedirect("error.jsp");
} finally {
    // Close database resources (connection, statement, result set)
				try {
				    
				    if (conn != null) {
				        conn.close();
				    }
					} catch (SQLException ex) {
					    ex.printStackTrace();
					    // Handle any potential errors while closing resources
					    }
			}
		}
    }
