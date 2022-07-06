
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room</title>
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
        
        <form:form method="post" action="saveRoom" modelAttribute="roomData" role="form">
            <h2>&nbsp;Add Room</h2><br/>
            <div class="chart">
                <br>
                <div class="row">
                    <div class="col-sm-2">
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:hidden path="hotelId" value="${hotelId}" class="gs_form"/>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="hotel_id">* Hotel Name :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="hotelName" value="${hotelName}" class="gs_form"/>
                            <a href="viewSelectHotel" class="btn btn-info btn-xs">Select</a>
                        </div>
                    </div>
                </div>
                            
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="room_code" >* Room Code :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="roomCode" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="room_type">* Room Type :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:select path="roomType" id="comboBox">
                                <form:option value="luxery" label="luxery"></form:option>
                                <form:option value="normal" label="normal"></form:option>
                            </form:select>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="bed_type">* Bed Type :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:select path="bedType" id="comboBox">
                                <form:option value="single" label="single"></form:option>
                                <form:option value="couple" label="couple"></form:option>
                            </form:select>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="room_enabled" >* Enabled :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:radiobutton id="label" path="roomEnabled" value="Y" label="Yes"/>&nbsp;&nbsp;
                            <form:radiobutton path="roomEnabled" value="N" label="No"/>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="room_price" >* Room Price :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="roomPrice" class="gs_form"/>
                        </div>
                    </div>
                </div>
                &nbsp;&nbsp;&nbsp;<input type="submit" value="Save Room" id="gs_btn"><br/>
                &nbsp;&nbsp;
            </div>        
        </form:form>
        &nbsp;&nbsp;
    </div>
    </body>
</html>
