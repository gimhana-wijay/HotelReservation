
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

            <h2>Manage Hotel</h2>

            <div class="row">
                <form:form method="post" action="searchHotelData" class="form-inline" role="form">

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
                        <label for="enabled">Enabled :</label>
                        <input name="enabled"  style="width: 30px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    <input type="submit" value="search" class="btn btn-primary btn-sm"><br/>
                    
                </form:form>
                <p></p>    
            </div>


            <div class="row" id="table-div">

                <table class="table-bordered">
                    <tr>
                        <th>&nbsp; &nbsp;ID</th>
                        <th>Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
                        <th>Location &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
                        <th>Address  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
                        <th>Description</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Star Category</th>
                        <th>Enabled</th>
                        <th>Edit </th>
                        <th>Delete </th>
                    </tr>

                    <c:forEach var="hotel" items="${hotelList}">
                        <tr>
                            <td> &nbsp; &nbsp;${hotel.hotelId}</td>
                            <td>${hotel.name}</td>
                            <td>${hotel.location}</td>
                            <td>${hotel.address}</td>
                            <td>${hotel.descreption}</td>
                            <td>${hotel.phone}</td>
                            <td>${hotel.email}</td>
                            <td>${hotel.star}</td>
                            <td>${hotel.enabled}</td>
                            <td><a href="editHotel?id=${hotel.hotelId}" class="btn btn-warning btn-xs">Edit</a></td>  
                            <td><a href="deleteHotel?id=${hotel.hotelId}" class="btn btn-danger btn-xs">Delete</a></td>  
                        </tr>
                    </c:forEach>

                </table>
                <br/>
                <a href="viewHotel" class="btn btn-primary btn-sm">Add Hotel</a>

            </div>
        </div>
        <br/>

    </body>
</html>
