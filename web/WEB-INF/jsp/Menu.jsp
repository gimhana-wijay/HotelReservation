<%-- 
    Document   : Menu
    Created on : Mar 7, 2020, 4:01:25 PM
    Author     : Gimhana Sandakelum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/bootstrap.css"/>
        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
<!--                    <a class="navbar-brand" href="#" style="color: #006666;font-size: 24pt;font-family: fantasy">Hotel Reservation</a>-->
                        <img src="resources/images/logo.png" style="height: 45px;width: 185px;border-radius: 7px;">
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="viewEngine">Search Engine</a></li>
                    </ul>
                    
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="userList">User</a></li>
                    </ul>
                    
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="hotelList">Hotel</a></li>
                    </ul>
                    
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="roomList">Room</a></li>
                    </ul>
                    
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="viewInventory">Inventory</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
