package com.weblabs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.weblabs.beans.AddProfile;
import com.weblabs.beans.AddPersonalInformation;
import com.weblabs.beans.AddEmergencyInformation;
import com.weblabs.beans.AddBankInformation;
import com.weblabs.beans.AddFamilyInformation;
import com.weblabs.beans.AddEducationInformation;
import com.weblabs.beans.AddExperienceInformation;
import com.weblabs.utility.DBUtil;

public class AddProfileImpl {
    public static List<AddProfile> getFilteredProfile(String whereClause, int start, int limit) {
        List<AddProfile> FilteredProfile = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query;
            if (whereClause != null && !whereClause.isEmpty()) {
                query = "SELECT ID, Employee_id, FirstName, LastName, BirthDate, Gender, Address, State, Country, PinCode, " +
                        "PhoneNumber, DepartmentName, DesignationName, ReportsTo FROM profile WHERE " + whereClause + " LIMIT ?, ?;";
            } else {
                query = "SELECT ID, Employee_id, FirstName, LastName, BirthDate, Gender, Address, State, Country, PinCode, " +
                        "PhoneNumber, DepartmentName, DesignationName, ReportsTo FROM profile LIMIT ?, ?;";
            }

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AddProfile pro = new AddProfile();
                pro.setID(resultSet.getString("ID"));
                pro.setEmployee_id(resultSet.getString("Employee_id"));
                pro.setFirstName(resultSet.getString("FirstName"));
                pro.setLastName(resultSet.getString("LastName"));
                pro.setBirthDate(resultSet.getString("BirthDate"));
                pro.setGender(resultSet.getString("Gender"));
                pro.setAddress(resultSet.getString("Address"));
                pro.setState(resultSet.getString("State"));
                pro.setCountry(resultSet.getString("Country"));
                pro.setPinCode(resultSet.getString("PinCode"));
                pro.setPhoneNumber(resultSet.getString("PhoneNumber"));
                pro.setDepartment(resultSet.getString("DepartmentName"));
                pro.setDesignation(resultSet.getString("DesignationName"));
                pro.setReportsTo(resultSet.getString("ReportsTo"));

                FilteredProfile.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return FilteredProfile;
    }

    public static List<AddPersonalInformation> getPersonalInformationByEmployee_id(String Employee_id) {
        List<AddPersonalInformation> personalInfoList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
            String query = "SELECT ID,  Employee_id, PassportNo, PassportExpiryDate, Tel, Nationality, Religion, " +
                    "MaritalStatus, EmploymentOfSpouse, NumberOfChildren FROM personalinformation WHERE Employee_id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Employee_id);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                AddPersonalInformation personalInfo = new AddPersonalInformation();
                personalInfo.setID(resultSet.getString("ID"));
                personalInfo.setEmployee_id(resultSet.getString("Employee_id"));
                personalInfo.setPassportNo(resultSet.getString("PassportNo"));
                personalInfo.setPassportExpiryDate(resultSet.getString("PassportExpiryDate"));
                personalInfo.setTel(resultSet.getString("Tel"));
                personalInfo.setNationality(resultSet.getString("Nationality"));
                personalInfo.setReligion(resultSet.getString("Religion"));
                personalInfo.setMaritalStatus(resultSet.getString("MaritalStatus"));
                personalInfo.setEmploymentOfSpouse(resultSet.getString("EmploymentOfSpouse"));
                personalInfo.setNumberOfChildren(resultSet.getString("NumberOfChildren"));

                personalInfoList.add(personalInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return personalInfoList;
    }
    
    
    
    public static List<AddEmergencyInformation> getEmergencyInformationByEmployee_id(String Employee_id) {
        List<AddEmergencyInformation> emergencyInfoList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
           
            String query = "SELECT ID, Name, Relationship, Phone, Mobile, Employee_id FROM emergencycontact WHERE Employee_id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Employee_id);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	AddEmergencyInformation emerInfo = new AddEmergencyInformation();
            	emerInfo.setID(resultSet.getString("ID"));
            	emerInfo.setName(resultSet.getString("Name"));
            	emerInfo.setRelationship(resultSet.getString("Relationship"));
            	emerInfo.setPhone(resultSet.getString("Phone"));
            	emerInfo.setMobile(resultSet.getString("Mobile"));
                emerInfo.setEmployee_id(resultSet.getString("Employee_id"));
               
                emergencyInfoList.add(emerInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return emergencyInfoList;
    }
    
    
    public static List<AddBankInformation> getBankInformationByEmployee_id(String Employee_id) {
        List<AddBankInformation> bankinfo = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
           
            String query = "SELECT ID, FullName, BankName, BankAccountNo, ifsccode, PANNO,Employee_id FROM bankdetails WHERE Employee_id = ?";
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Employee_id);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	AddBankInformation bankInfo = new AddBankInformation();
            	bankInfo.setID(resultSet.getString("ID"));
            	bankInfo.setFullName(resultSet.getString("FullName"));
            	bankInfo.setBankName(resultSet.getString("BankName"));
            	bankInfo.setBankAccountNo(resultSet.getString("BankAccountNo"));
            	bankInfo.setIFSCCode(resultSet.getString("ifsccode"));
            	bankInfo.setPANNO(resultSet.getString("PANNO"));
            	bankInfo.setEmployee_id(resultSet.getString("Employee_id"));
               
                bankinfo.add(bankInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return bankinfo;
    }
    
 

    public static List<AddFamilyInformation> getFamilyInformationByEmployee_id(String Employee_id) {
        List<AddFamilyInformation> faminfo = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
           
            String query = "SELECT ID, Name, Relationship, DateOfBirth, Phone, Employee_id FROM familyinformation WHERE Employee_id = ?";
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Employee_id);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	AddFamilyInformation famInfo = new AddFamilyInformation();
            	famInfo.setID(resultSet.getString("ID"));
            	famInfo.setName(resultSet.getString("Name"));
            	famInfo.setRelationship(resultSet.getString("Relationship"));
            	famInfo.setDateOfBirth(resultSet.getString("DateOfBirth"));
            	famInfo.setPhone(resultSet.getString("Phone"));
            	famInfo.setEmployee_id(resultSet.getString("Employee_id"));
               
            	faminfo.add(famInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return faminfo;
    }
    

    public static List<AddEducationInformation> getEducationInformationByEmployee_id(String Employee_id) {
        List<AddEducationInformation> eduinfo = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
           
            String query = "SELECT ID, Institution, Subject, StartingDate, CompleteDate, Degree, Grade, Employee_id FROM education WHERE Employee_id = ?";
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Employee_id);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	AddEducationInformation eduInfo = new AddEducationInformation();
            	eduInfo.setID(resultSet.getString("ID"));
            	eduInfo.setInstitution(resultSet.getString("Institution"));
            	eduInfo.setSubject(resultSet.getString("Subject"));
            	eduInfo.setStartingDate(resultSet.getString("StartingDate"));
            	eduInfo.setCompleteDate(resultSet.getString("CompleteDate"));
            	eduInfo.setDegree(resultSet.getString("Degree"));
            	eduInfo.setGrade(resultSet.getString("Grade"));
            	eduInfo.setEmployee_id(resultSet.getString("Employee_id"));
               
            	eduinfo.add(eduInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return eduinfo;
    }
    
    public static List<AddExperienceInformation> getExperienceInformationByEmployee_id(String Employee_id) {
        List<AddExperienceInformation> expinfo = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.provideConnection();
           
            String query = "SELECT ID, CompanyName, Location, JobPosition, PeriodFrom, PeriodTo, Employee_id FROM workexperience WHERE Employee_id = ?";
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Employee_id);

            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	AddExperienceInformation expInfo = new AddExperienceInformation();
            	expInfo.setID(resultSet.getString("ID"));
            	expInfo.setCompanyName(resultSet.getString("CompanyName"));
            	expInfo.setLocation(resultSet.getString("Location"));
            	expInfo.setJobPosition(resultSet.getString("JobPosition"));
            	expInfo.setPeriodFrom(resultSet.getString("PeriodFrom"));
            	expInfo.setPeriodTo(resultSet.getString("PeriodTo"));
            	expInfo.setEmployee_id(resultSet.getString("Employee_id"));
               
            	expinfo.add(expInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return expinfo;
    }
    
}
