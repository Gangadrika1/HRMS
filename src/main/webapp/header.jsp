<%-- <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
   <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Lineawesome CSS -->
    <link rel="stylesheet" href="css/line-awesome.min.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="css/select2.min.css">

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
        <!-- table styles CSS -->
     <link rel="stylesheet" href="css/tstyles.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div class="header">
        <!-- Logo -->
        <div class="header-left">
            <a href="index.jsp" class="logo">
                <img src="assets/logo.png" width="110" height="60" alt="">
            </a>
        </div>
        <!-- /Logo -->

        <a id="toggle_btn" href="javascript:void(0);">
            <span class="bar-icon">
                <span></span>
                <span></span>
                <span></span>
            </span>
        </a>

        <!-- Header Title -->
        <div class="page-title-box">
            <h3>Weblabs Technologies</h3>
        </div>
        <!-- /Header Title -->

        <a id="mobile_btn" class="mobile_btn" href="#sidebar"><i class="fa fa-bars"></i></a>

        <!-- Header Menu -->
        <ul class="nav user-menu">

            <!-- Search -->
            <li class="nav-item">
                <div class="top-nav-search">
                    <a href="javascript:void(0);" class="responsive-search">
                        <i class="fa fa-search"></i>
                    </a>
                    <!-- <form action="search.jsp">
                        <input class="form-control" type="text" placeholder="Search here">
                        <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                    </form> -->
                </div>
            </li>
            <!-- /Search -->

            <!-- Notifications -->
            <li class="nav-item dropdown">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <i class="fa fa-bell-o"></i> <span class="badge badge-pill">3</span>
                </a>
                          </li>
          <!-- Add more message notification items here -->
                        </ul>
                        
                    </div>
                    <li>
                    <div class="topnav-dropdown-footer">
                        <a href="chat.jsp">View all Messages</a>
                    </div>
     </li>
<ul>
            <!-- User Profile -->
            <li class="nav-item dropdown has-arrow main-drop">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <span class="user-img"><img src="./profiles/<?php echo htmlentities($result->Picture);?>" alt="User Picture"><span class="status online"></span></span>
                    <span><?php echo htmlentities(ucfirst($_SESSION['userlogin']));?></span>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="profile.jsp">My Profile</a>
                    <a class="dropdown-item" href="settings.jsp">Settings</a>
                    <a class="dropdown-item" href="logout.jsp">Logout</a>
                </div>
            </li>
            <!-- /User Profile -->
        </ul>
        <!-- /Header Menu -->

        <!-- Mobile Menu -->
        <div class="dropdown mobile-user-menu">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="profile.jsp">My Profile</a>
                <a class="dropdown-item" href="settings.jsp">Settings</a>
                <a class="dropdown-item" href="login.jsp">Logout</a>
            </div>
        </div>
        <!-- /Mobile Menu -->
    </div>

   <!-- jQuery -->
    <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="js/jquery.slimscroll.min.js"></script>

    <!-- Select2 JS -->
    <script src="js/select2.min.js"></script>

    <!-- Datetimepicker JS -->
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>

    <!-- Custom JS -->
    <script src="js/app.js"></script>
</body>

</html> --%>


<!DOCTYPE html>
<%@page import="com.weblabs.service.impl.csDAO"%>
<%@page import="com.weblabs.beans.CompanySettingsBean"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

<%
HttpSession sdsession = request.getSession(true);
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <!-- Add your CSS and other meta tags here -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <!-- Logo -->
        <div class="header-left">
        <a href="index.jsp" class="logo">
        <%
       List<CompanySettingsBean> company = csDAO.getAllCS();
        
        for(CompanySettingsBean com:company){
        %>
          <img src="<%=com.getlogoUrl(request)%>" width="110" height="58" alt="">
            </a>
            <%} %>
        </div>
        <!-- /Logo -->

        <a id="toggle_btn" href="javascript:void(0);">
            <span class="bar-icon">
                <span></span>
                <span></span>
                <span></span>
            </span>
        </a>

        <!-- Header Title -->
        <div class="page-title-box">
            <h3>Weblabs Technologies</h3>
        </div>
        <!-- /Header Title -->

        <a id="mobile_btn" class="mobile_btn" href="#sidebar"><i class="fa fa-bars"></i></a>

        <!-- Header Menu -->
        <ul class="nav user-menu">

            <!-- Search -->
           <!--  <li class="nav-item">
                <div class="top-nav-search">
                    <a href="javascript:void(0);" class="responsive-search">
                        <i class="fa fa-search"></i>
                    </a>
                    <form action="search.jsp">
                        <input class="form-control" type="text" placeholder="Search here">
                        <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </li> -->
            <!-- /Search -->

            <!-- Notifications -->
            <li class="nav-item dropdown">
               <!--  <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <i class="fa fa-bell-o"></i> <span class="badge badge-pill">3</span>
                </a> -->
                <div class="dropdown-menu notifications">
                    <div class="topnav-dropdown-header">
                        <span class="notification-title">Notifications</span>
                        <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                    </div>
                    <div class="noti-content">
                        <ul class="notification-list">
                            <li class="notification-message">
                                <a href="activities.jsp">
                                    <div class="media" >
                                        <span class="avatar">
                                            <img alt="" src="assets/profiles/avatar-02.jpg">
                                        </span>
                                        <div class="media-body">
                                            <p class="noti-details"><span class="noti-title">John Doe</span> added new task <span class="noti-title">Patient appointment booking</span></p>
                                            <p class="noti-time"><span class="notification-time">4 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <!-- Add more notification items here -->
                        </ul>
                    </div>
                    <div class="topnav-dropdown-footer">
                        <a href="activities.jsp">View all Notifications</a>
                    </div>
                </div>
            </li>
            <!-- /Notifications -->

            <!-- Message Notifications -->
           <!--  <li class="nav-item dropdown">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                    <i class="fa fa-comment-o"></i> <span class="badge badge-pill">8</span>
                </a>
                <div class="dropdown-menu notifications">
                    <div class="topnav-dropdown-header">
                        <span class="notification-title">Messages</span>
                        <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                    </div>
                     <div class="noti-content">
                        <ul class="notification-list">
                            <li class="notification-message">
                                <a href="chat.jsp">
                                    <div class="list-item">
                                        Message notification content goes here
                                    </div> 
                                </a>
                            </li>
                            Add more message notification items here
                        </ul>
                    </div>
                    <div class="topnav-dropdown-footer">
                        <a href="chat.jsp">View all Messages</a>
                    </div>
                </div>
            </li> -->
            <!-- /Message Notifications -->

            <!-- User Profile -->
            <li class="nav-item dropdown has-arrow main-drop">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                   <div class="user-img">
                            <img src="assets/user.jpg" alt="User Picture">
                              <span class="status online"></span>
                   </div>
                   

                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="profile-list.jsp">My Profile</a>
                <!--     <a class="dropdown-item" href="settings.jsp">Settings</a> -->
                    <a class="dropdown-item" href="logout.jsp">Logout</a>
                </div>
            </li>
            <!-- /User Profile -->
        </ul>
        <!-- /Header Menu -->

        <!-- Mobile Menu -->
        <div class="dropdown mobile-user-menu">
            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="profile.jsp">My Profile</a>
                <a class="dropdown-item" href="settings.jsp">Settings</a>
                <a class="dropdown-item" href="login.jsp">Logout</a>
            </div>
        </div>
        <!-- /Mobile Menu -->
    </div>

    <!-- Add your content here -->

    <!-- Add your JavaScript includes and scripts here -->
     <script src="js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="js/jquery.slimscroll.min.js"></script>

    <!-- Select2 JS -->
    <script src="js/select2.min.js"></script>

    <!-- Datetimepicker JS -->
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>

    <!-- Custom JS -->
    <script src="js/app.js"></script>
</body>

</html>