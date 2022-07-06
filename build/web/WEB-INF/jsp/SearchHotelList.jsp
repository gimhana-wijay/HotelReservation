
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
            .div-box{
                border: #cccccc 1px solid;
                border-radius: 7px;
                margin-bottom: 7px;
                background-color: #f5f5f5;
            }
            .modify-table{
                margin-left: 55px;
            }
            .gs_btn{
                padding: 5px 18px;
                color: white;
                font-size: 15px;
                text-align: center;
                background-color: #2e6da4;
                margin-bottom:  8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                border-color : #337ab7;
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
            .font{
                font-family: Arial;
                font-size: smaller;
                font-weight: bold;
            }
        </style>

    </head>
    <body>
            <c:if test="${userType == 'user'}">
                <jsp:include page="DefaultMenu.jsp"/> 
            </c:if>
            <c:if test="${userType == 'admin'}">
                <jsp:include page="Menu.jsp" />
            </c:if>

        <div class="container" >
            <table>
                <td>
                    <div class="main-logo">
                         <img src="resources/images/logo.png" style="height: 90px;width: 370px;border-radius: 7px;">
                    </div>
                </td><td>

            <div class="row">
                <form:form method="post" action="searchCustomerData" class="form-inline" role="form">
                    &nbsp; &nbsp;&nbsp; &nbsp;
                    <div class="form-group">
                        <label for="name">Hotel Name:</label>
                        <input  name="name"  style="width: 150px;height: 23px"/>
                    </div>&nbsp; &nbsp;
          
                    <div class="form-group">
                        <label for="star">Star Category :</label>
                        <input  name="star"  style="width: 30px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    <input type="submit" value="search" class="btn btn-primary btn-sm"><br/>
                </form:form>
            </div>
            </td>
            <td>
                <button class="btn btn-primary btn-sm">Engine</button>
            </td>
            </table>
            <br>
            
            <div class="font"> 
                    <c:forEach items="${hotelResult}" var="result">
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
                                            <img src="resources/images/hotels/${result[3]}.jpg" style="height: 90px;width: 150px;border-radius: 7px;border: #cccccc 1px solid;">
                                        </div>
                                    </td>
                                    <td colspan="3"style="font-size: 20px;"> &nbsp; &nbsp;Hotel&nbsp;${result[3]}&nbsp;-&nbsp;${result[4]}</td>
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
                                                        <img src="resources/images/Telephone_20px.png" style="height: 20px;width:20px">&nbsp;&nbsp;${result[6]}
                                                    </div></td>
                                     <td>*&nbsp;${result[8]} &nbsp;Star </td>
                                     <td>*&nbsp; ${result[18]}&nbsp;${result[11]} &nbsp;Rooms</td>
                                     <td>&nbsp;&nbsp;&nbsp;*&nbsp;${result[12]} &nbsp;Bed</td>
<!--                                     <td>Price </td>
                                     <td>Date </td>-->
                                </tr><br>
                                <tr>
                                    <td>${result[5]}</td>
                                    <td colspan="2"><div>
                                                        <img src="resources/images/Secured Letter_20px.png" style="height: 20px;width:20px;">&nbsp;&nbsp;${result[7]}
                                                    </div></td>
                                    <td colspan="2"><div class="btn-style">Rs :&nbsp; ${result[14]}&nbsp;/=</div></td>
<!--                                    <td>${result[11]}</td>-->
                                    <td colspan="2">&nbsp;&nbsp;&nbsp;Date :&nbsp; ${result[15]}</td>
<!--                                    <td>${result[14]}</td>
                                    <td>${result[15]}</td>-->
                                    <td><a href="/HotelReservation/forPaymentPage?hotelId=${result[0]}
                                                                                  &hotelName=${result[3]}
                                                                                  &hotelLocation=${result[4]}
                                                                                  &hotelAddress=${result[5]}
                                                                                  &hotelPhone=${result[6]}
                                                                                  &hotelMail=${result[7]}
                                                                                  &hotelStar=${result[8]}
                                                                                  &hotelEnabled=${result[9]}
                                                                                  &roomId=${result[1]}
                                                                                  &roomCode=${result[10]}
                                                                                  &roomType=${result[11]}
                                                                                  &bedType=${result[12]}
                                                                                  &price=${result[14]}
                                                                                  &roomEnabled=${result[13]}
                                                                                  &inventoryId=${result[2]}
                                                                                  &dates=${result[15]}
                                                                                  &fromDate=${result[16]}
                                                                                  &toDate=${result[17]}
                                                                                  &rooms=${result[18]}
                                                                                  &userName=${userName}
                                                                                  &userType=${userType}" class="btn btn-primary ">Select</a></td>
                                </tr>
                            </table><br></div>
                    </c:forEach>
                <br/>
<!--                <a href="viewRoom" class="btn btn-primary btn-sm">Add Room</a>-->
            </div>
        </div>
        <br/>

    </body>
</html>
