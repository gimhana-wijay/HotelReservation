<%-- 
    Document   : Inventory
    Created on : Mar 14, 2020, 11:45:58 AM
    Author     : Gimhana Sandakelum
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory</title>
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
        <form:form method="post" action="saveInventory" modelAttribute="inventoryData" role="form">
            <h2>&nbsp;Add Inventory</h2><br/>
            
            <div class="chart">
                <br>
                <div class="row">
                    <div class="col-sm-2">
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:hidden path="roomId" value="${roomId}" class="gs_form"/>
                        </div>
                    </div>
                </div>
                            
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="room_id">* Room Type :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="roomType" value="${roomType}" class="gs_form"/>
                            <a href="viewSelectRoom" class="btn btn-info btn-xs">Select</a>
                        </div>
                    </div>
                </div>
                            
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="inventory_from" >* Inventory From :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="inventoryFrom" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="inventory_to" >* Inventory To :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="inventoryTo" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="inventory_count" >* Count :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="inventoryCount" class="gs_form"/>
                        </div>
                    </div>
                </div>
                &nbsp;&nbsp;&nbsp;<input type="submit" value="Save Inventory" id="gs_btn"><br/>
                &nbsp;&nbsp;
            </div>
        </form:form>
        &nbsp;&nbsp;
    </div>
    &nbsp;&nbsp;

    </body>
</html>
