<%@ page language="java" contentType="application/json" %>
<%@ page import="java.sql.*, java.util.HashMap, java.util.Map, com.google.gson.Gson, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, java.util.ArrayList, java.util.List, com.weblabs.beans.EmployeeBean, com.weblabs.utility.DBUtil" %>

<%
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");

List<EmployeeBean> filteredEmployees = new ArrayList<>();
Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;

try {
    connection = DBUtil.provideConnection();
    String employeeId = request.getParameter("employeeId");

    String sql = "SELECT FirstName, LastName, Phone, Gender, departmentid, designationid FROM employees WHERE Employee_Id = ?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, employeeId);
    resultSet = preparedStatement.executeQuery();

    Map<String, String> employeeDetails = new HashMap<>();
    if (resultSet.next()) {
        employeeDetails.put("firstname", resultSet.getString("FirstName"));
        employeeDetails.put("lastname", resultSet.getString("LastName"));
        employeeDetails.put("phone", resultSet.getString("Phone"));
        employeeDetails.put("gender", resultSet.getString("Gender"));
        employeeDetails.put("department", resultSet.getString("departmentid"));
        employeeDetails.put("designation", resultSet.getString("designationid"));
    }

    String jsonData = new Gson().toJson(employeeDetails);
    out.print(jsonData);
} catch (Exception e) {
    e.printStackTrace();
    out.print("{\"error\":\"" + e.getMessage() + "\"}");
} finally {
    try {
        if (resultSet != null) resultSet.close();
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
