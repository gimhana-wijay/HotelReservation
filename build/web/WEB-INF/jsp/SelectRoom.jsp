
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Customer</title>
        <link rel="stylesheet" href="resources/css/bootstrap.css"/>
        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/jquery.js"></script>

        <style type="text/css">
            label{
                font-size: 9pt;
            }
        </style>

    </head>
    <body>
        <jsp:include page="Menu.jsp" />       

        <div class="container">
            
            <h3 style="color: #ff0000">Select Room for Setup Inventory</h3>

            <div class="row">
                <form:form method="post" action="searchSelectCustomer" class="form-inline" role="form">

                    <div class="form-group">
                        <label for="id">ID :</label>
                        <input  name="id"  style="width: 80px;height: 24px" class="form-control"/>
                    </div>
                    &nbsp; &nbsp;
                    <div class="form-group">
                        <label for="name">Name :</label>
                        <input  name="name"  style="width: 200px;height: 24px" class="form-control"/>
                    </div>
                    &nbsp; &nbsp;
                    <div class="form-group">
                        <label for="email">Email :</label>
                        <input  name="email"   style="width: 170px;height: 24px" class="form-control"/>
                    </div>
                    &nbsp; &nbsp;
                    <div class="form-group">
                        <label for="phone">Phone :</label>
                        <input  name="phone"  style="width: 150px;height: 24px" class="form-control"/>
                    </div>
                    &nbsp; &nbsp;
                    <input type="submit" value="search" class="btn btn-primary btn-sm"><br/>
                    
                </form:form>
                <p></p>    
            </div>

            <div class="row">
                <table class="table table-striped" style="width: 950px">
                    <tr>
                        <th>&nbsp; &nbsp;Room ID</th>
                        <th>Room Code &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
                        <th>Room Type&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
                        <th>Bed Type</th>
                        <th>Enabled</th>
                    </tr>

                    <c:forEach var="room" items="${lastList}">
                        <tr>
                            <td> &nbsp; &nbsp;${room.roomId}</td>
                            <td>${room.roomCode}</td>
                            <td>${room.roomType}</td>
                            <td>${room.bedType}</td>
                            <td>${room.roomEnabled}</td>
                            <td><a href="/HotelReservation/selectRoom?id=${room.roomId}&type=${room.roomType}" class="btn btn-primary ">Select</a></td>
                        </tr>
                    </c:forEach>

                </table>
            </div>

        </div>

    </body>
</html>
