
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel List</title>
        <link rel="stylesheet" href="resources/css/bootstrap.css">       
        <script type="text/javascript" src="resources/js/bootstrap.js"></script>
        
        <style type="text/css">


            label{
                font-size: 9pt;
            }

            #table-div{
                font-size: 10pt;

            }

            form-div{
                font-size: 8pt;
            }

            select {
                font-size: 9pt;
            }

            h2{
                color: red;
                text-align: center;
            }

            table{
                width: 1000px;
            }

        </style>

    </head>
    <body>
       <jsp:include page="Menu.jsp" />       

        <div class="container" >

            <h2>Manage Room</h2>

            <div class="row">
                <form:form method="post" action="searchCustomerData" class="form-inline" role="form">

                    <div class="form-group">
                        <label for="id">ID :</label>
                        <input  name="id"  style="width: 80px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    <div class="form-group">
                        <label for="name">Name :</label>
                        <input  name="name"  style="width: 150px;height: 23px"/>
                    </div>
                    
                    &nbsp; &nbsp;
                    
                   <div class="form-group">
                        <label for="phone">Phone :</label>
                        <input  name="phone"  style="width: 150px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    
                    <div class="form-group">
                        <label for="email">Email :</label>
                        <input  name="email"   style="width: 150px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    
                    <div class="form-group">
                        <label for="star">Star Category :</label>
                        <input  name="star"  style="width: 30px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    
                    <div class="form-group">
                        <label for="enabled">Enabled :</label>
                        <input  name="enabled"  style="width: 30px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    <input type="submit" value="search" class="btn btn-primary btn-sm"><br/>
                    
                </form:form>
                <p></p>    
            </div>


            <div class="row" id="table-div">

                <table class="table-bordered">
                    <tr>
                        <th>&nbsp; &nbsp;Room ID</th>
                        <th>Room code &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
                        <th>Room Type</th>
                        <th>Bed Type</th>
                        <th>Enabled</th>
                        <th>Price</th>
                        <th>Hotel</th>
                        <th>Edit </th>
                        <th>Delete </th>
                    </tr>

                    <c:forEach var="room" items="${roomList}">
                        <tr>
                            <td> &nbsp; &nbsp;${room.roomId}</td>
                            <td>${room.roomCode}</td>
                            <td>${room.roomType}</td>
                            <td>${room.bedType}</td>
                            <td>${room.roomEnabled}</td>
                            <td>${room.roomPrice}</td>
                            <td>${room.hotelId}</td>
                            <td><a href="editRoom?id=${room.roomId}" class="btn btn-warning btn-xs">Edit</a></td>  
                            <td><a href="deleteRoom?id=${room.roomId}" class="btn btn-danger btn-xs">Delete</a></td>  
                        </tr>
                    </c:forEach>

                </table>
                <br/>
                <a href="viewRoom" class="btn btn-primary btn-sm">Add Room</a>

            </div>
        </div>
        <br/>

    </body>
</html>
