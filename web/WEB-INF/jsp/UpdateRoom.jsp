
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Hotel</title>
        <link rel="stylesheet" href="resources/css/bootstrap.css">     

        <style type="text/css">
                       input[type=text]{
                width: 450px;
            }
            
            #searchBar{
                border: #cccccc 1px solid;
                border-radius: 7px;
            }
            
            .chart{
                border: #cccccc 1px solid;
                border-radius: 7px;
                width: 70%;
                background-color: #f5f5f5;
            }
            .gs_form{
                display: block;
                width: 100%;
                height: 20px;
                padding: 6px 12px;
                font-size: 11px;
                line-height: 1.42857143;
                color: #555;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 4px;
                margin-top: 6px;
            }
            #comboBox{
                font-size: 11px;
                width: 100%;
                height: 20px;
                border-radius: 4px;
                margin-top: 6px;
            }
            #label{
                font-size: 11px;
                margin-top: 8px;
            }
            #gs_btn{
                padding: 4px 8px;
                color: white;
                font-size: 12px;
                text-align: center;
                background-color: grey;
                margin-top: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                border-color :46b8da;
            }
        </style>

    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        
        <div class="container" id="searchBar">
        
        <form:form method="post" action="updateHotel" modelAttribute="room" role="form">
            <h2>&nbsp;Update Room</h2><br/>
            
            <div class="chart">
                <br>
                <div class="row">
                    <div class="col-sm-2">
<!--                        &nbsp;&nbsp;&nbsp;<label id="label" for="roomId" >* Room ID :</label>-->
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:hidden path="roomId" value="${map.room.roomId}" class="gs_form" disabled="true"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="room_code" >* Room Code :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="roomCode" value="${map.room.roomCode}" class="gs_form"/>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="room_type" >* Room Type :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="roomType" value="${map.room.roomType}" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="bed_type" >* Bed Type :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="bedType" value="${map.room.bedType}" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="room_enabled" >* Enabled :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="roomEnabled" value="${map.room.roomEnabled}" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="room_enabled" >* Enabled :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="roomEnabled" value="${map.room.roomPrice}" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:hidden path="hotelId" value="${map.room.roomPrice}" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                
<!--                &nbsp;&nbsp;&nbsp;<input type="submit" value="Update" id="gs_btn"><br><br>-->
                &nbsp;&nbsp;&nbsp;<a href="roomList" id="gs_btn">View Room List</a><br/>
                &nbsp;&nbsp;
            </div>
            &nbsp;&nbsp;
        </form:form>
        </div>
    </body>
</html>
