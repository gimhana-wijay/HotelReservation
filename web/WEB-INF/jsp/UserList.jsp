
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List</title>
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

            <h2>Manage User</h2>

            <div class="row">
                <form:form method="post" action="searchUserData" class="form-inline" role="form">

                    <div class="form-group">
                        <label for="name">Name :</label>
                        <input  name="name"  style="width: 150px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    
                    <div class="form-group">
                        <label for="userName">User Name :</label>
                        <input  name="userName"  style="width: 150px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    
                   <div class="form-group">
                        <label for="userType">User Type :</label>
                        <input  name="userType"  style="width: 150px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    
                    <div class="form-group">
                        <label for="email">Email :</label>
                        <input  name="email"   style="width: 150px;height: 23px"/>
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
                        <th>User Name &nbsp; &nbsp; &nbsp;</th>
<!--                        <th>Password &nbsp; &nbsp; &nbsp;</th>-->
                        <th>Country &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
                        <th>Address  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
                        <th>Description</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>User Type</th>
                        <th>Status</th>
                        <th>Edit </th>
                        <th>Delete </th>
                    </tr>

                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td> &nbsp; &nbsp;${user.userId}</td>
                            <td>${user.name}</td>
                            <td>${user.userName}</td>
<!--                            <td>${user.password}</td>-->
                            <td>${user.country}</td>
                            <td>${user.address}</td>
                            <td>${user.descreption}</td>
                            <td>${user.phone}</td>
                            <td>${user.email}</td>
                            <td>${user.userType}</td>
                            <td>${user.status}</td>
                            <td><a href="editUser?id=${user.userId}" class="btn btn-warning btn-xs">Edit</a></td>  
                            <td><a href="deleteUser?id=${user.userId}" class="btn btn-danger btn-xs">Delete</a></td>  
                        </tr>
                    </c:forEach>

                </table>
                <br/>
                <a href="viewUser" class="btn btn-primary btn-sm">Add User</a>

            </div>
        </div>
        <br/>

    </body>
</html>
