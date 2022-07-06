
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
            
            #searchBar{
                border: #cccccc 1px solid;
                border-radius: 7px;
                margin-top: 20px;
            }
            
            .chart{
                border: #cccccc 1px solid;
                border-radius: 7px;
                width: 70%;
                background-color: #f5f5f5;
            }
            .table-div{
                margin-top: 20px;
                margin-left: 80px;
            }
            .btn-style{
                padding: 2px 5px;
                color: white;
                font-size: 12px;
                text-align: center;
                background-color: green;
/*                margin-bottom:  8px;*/
/*                border-radius: 4px;*/
/*                border: 1px solid #ccc;*/
/*                border-color : #337ab7;*/
            }
            .btn-style-paid{
                padding: 2px 5px;
                color: white;
                font-size: 12px;
                text-align: center;
                background-color: #dd4b39;
                width: 80%;
            }
            .font{
                font-family: Arial;
                font-size: smaller;
                font-weight: bold;
            }
        </style>

    </head>
    <body>

        <div class="container" id="searchBar">
            <div class="row">

                <table class="table-bordered table-div">
                    <tr>
                        <td colspan="4">
                            <img src="resources/images/logo.png" style="height: 90px;width: 370px;border-radius: 7px;"> 
                        </td>
                        <td colspan="4">
                            <img src="resources/images/logo.png" style="height: 90px;width: 370px;border-radius: 7px;"> 
                        </td>
                    </tr>
                </table>
                
                <table class="table-div">    

                    <tr>
                        <th style="color: red">*&nbsp;&nbsp;</th>
                        <th>Confirmation ID</th>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th>${payment.paymentId}</th>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    </tr>

                        <tr><th style="color: red">*&nbsp;&nbsp;</th>
                            
                            <th>Customer Name</th>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            
                            <th>${payment.name}</th>
                            
                        </tr>
                        <tr>
                            <th style="color: red">*&nbsp;&nbsp;</th>
                            <th>Country</th>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>${payment.country}</th>
                        </tr>
                        <tr>
                            <th style="color: red">*&nbsp;&nbsp;</th>
                            <th>Address</th>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>${payment.address}</th>
                        </tr>    

                        <tr>
                            <th style="color: red">*&nbsp;&nbsp;</th>
                            <th>Phone</th>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>${payment.phone}</th>
                        </tr>
                        <tr>
                            <th style="color: red">*&nbsp;&nbsp;</th>
                            <th>Email</th>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>${payment.email}</th>
                        </tr>


                </table>
                        
                <div class="container table-div" >
            
                <br>
            
                <div class="font"> 
                            <div class="div-box">
                                <table class="modify-table" >
                                    <tr>
                                        <td rowspan="3">

                                            <!--  <c:choose>
                                                <c:when test="${result[4]=='NO'}">
                                                    <td style="color: red;font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result[4]}&nbsp;</td>
                                                </c:when>    
                                                <c:otherwise>
                                                    <td style="color: #0099cc;font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result[4]}&nbsp;</td>
                                                </c:otherwise>
                                            </c:choose>-->

                                            <div class="item active">
                                                <img src="resources/images/paid.jpg" style="height: 90px;width: 90px;">
                                            </div>
                                        </td>
                                        <td colspan="3"style="font-size: 20px;"> &nbsp; &nbsp;Hotel&nbsp;${hotelName}&nbsp;-&nbsp;${hotelLocation}</td>
                                        <td colspan="2">
                                            <c:if test="${result[8] == 1}">
                                                <div class="star"><img src="resources/images/star_1.png" style="height: 15px;width:90px"></div>
                                            </c:if>
                                            <c:if test="${result[8] == 2}">
                                                <div class="star"><img src="resources/images/star_2.png" style="height: 15px;width:90px"></div>
                                            </c:if>
                                            <c:if test="${result[8] == 3}">
                                                <div class="star"><img src="resources/images/star_3.png" style="height: 15px;width:90px"></div>
                                            </c:if>
                                            <c:if test="${result[8] == 4}">
                                                <div class="star"><img src="resources/images/star_4.png" style="height: 15px;width:90px"></div>
                                            </c:if>
                                            <c:if test="${result[8] == 5}">
                                                <div class="star"><img src="resources/images/star_5.png" style="height: 15px;width:90px"></div>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td>Address : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                                         <td colspan="2"><div>
                                                            <img src="resources/images/Telephone_20px.png" style="height: 20px;width:20px">&nbsp;&nbsp;${hotelPhone}
                                                        </div></td>
                                         <td>*&nbsp;${hotelStar} &nbsp;Star </td>
                                         <td>*&nbsp; ${inventoryCount}&nbsp;${roomType} &nbsp;Rooms</td>
                                         <td>&nbsp;&nbsp;&nbsp;*&nbsp;${bedType} &nbsp;Bed</td>
    <!--                                     <td>Price </td>
                                         <td>Date </td>-->
                                    </tr><br>
                                    <tr>
                                        <td>${hotelAddress}</td>
                                        <td colspan="2"><div>
                                                            <img src="resources/images/Secured Letter_20px.png" style="height: 20px;width:20px;">&nbsp;&nbsp;${hotelEmail}
                                                        </div></td>
                                        <td colspan="2"><div class="btn-style">Rs :&nbsp; ${allRoomsPrice}&nbsp;/=</div></td>
    <!--                                    <td>${result[11]}</td>-->
                                        <td colspan="2"><div class="btn-style-paid">PAID</div></td>
    <!--                                    <td>${result[14]}</td>
                                        <td>${result[15]}</td>-->
                                        <td></td>
                                    </tr>
                                </table><br></div>
                    <br/>
    <!--                <a href="viewRoom" class="btn btn-primary btn-sm">Add Room</a>-->
                </div>
        </div>
                
                
                <br/>
                
            </div>
        </div>
        </div>
        <br/>

    </body>
</html>
