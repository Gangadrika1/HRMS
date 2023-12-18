<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*, java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page errorPage="" %>

<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>One Fitness</title>
    <!-- Stylesheets -->
    <link rel	="shortcut icon" type="image/x-icon" href="assets/logo.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
    
    <!-- Include other CSS files as necessary -->
</head>

<body>
    <!-- Header Section -->
    <%@ include file="header.jsp" %>
    <br /><br /><br /><br>

    <%!
        // Define your Java methods here
        // Implement necessary functions for handling database interactions and email sending
    %>

    <%!
        // Define your variables here
        String token = "";
        String error = ""; // Initialize your error variable
        String msg = ""; // Initialize your message variable
    %>

    <% if (request.getParameter("token") != null) {
        token = request.getParameter("token");
        out.println(token); // Print the token
    } %>

    <!-- Pricing Section -->
    <section class="pricing-section spad set-bg" data-setbg="img/gym3.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <!-- Add your content for the first column here -->
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="pricing-item entermediate">
                        <div class="pi-top">
                            <h2> Welcome to Reset Password</h2><br />
                            <!-- Add your content here -->
                        </div>
                       <%--  <% if (error != null) { %>
                            <div class="errorWrap" style="color: red;"><strong>ERROR</strong>: <%= error %> </div>
                        <% } else if (msg != null) { %>
                            <div class="succWrap" style="color: red;"><strong>Error</strong>: <%= msg %> </div>
                        <% } %>
 --%>
                        <form class="singup-form contact-form" method="GET" action="./ResetPasswordServlet">
                            <div class="row">
                                  <div class="col-md-12">
                                <label>Re-enter email</label>
                                    <input type="text" name="email" placeholder="Enter new password">
                                </div>
                                <div class="col-md-12">
                                <label>newpassword</label>
                                    <input type="password" name="newpassword" placeholder="Enter new password">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                 <label>confirmpassword</label>
                                    <input type="password" name="confirmpassword" placeholder="Confirm new password">
                                </div>
                            </div>
                            <input type="hidden" name="token" value="<%= token %>">
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="submit" name="reset" value="Reset Password"> Reset</button>
                                </div>
                            </div>
                        </form>
                        <!-- Include your Java code to handle password reset form submission here -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Include other necessary scripts and closing tags here -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Custom JS -->
    <script src="js/app.js"></script>
</body>
</html>
