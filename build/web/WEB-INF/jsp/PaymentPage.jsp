
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
            
            #searchBar{
/*                border: #cccccc 1px solid;
                border-radius: 7px;*/
                 margin-top: -50px;
            }
            
            .chart{
                border: #cccccc 1px solid;
                border-radius: 7px;
                width: 70%;
                background-color: #f5f5f5;
            }
            .gs_form{
                display: block;
                width: 500%;
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
                margin-top: 10px;
                border-radius: 4px;
                border: 1px solid #ccc;
                border-color :46b8da;
                margin-left: 710px;
            }
            .txt-style{
                height: 30px;
                border: 2px solid #f9f9f9;
            }
            .gs_btn_search{
                padding: 4px 8px;
                color: white;
                font-size: 12px;
                text-align: center;
                background-color: #555;
                border-radius: 4px;
                border: 1px solid #ccc;
                border-color :46b8da;
                width: 120px;
                height: 28px;
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
        <!--engine-->
            <div class="engine">
                <div class="container">
                    <div class="row" style="margin-left: 120px;">

                        <form:form method="post" action="searchHotel" class="form-inline" role="form">
                            <p class="font" style="margin-left: 350px;">Make Your Reservation</p>


                            <div class="form-group">
                                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="name">Location :</label>
                                <input  name="location" class="autocomplete txt-style"  id="myInput" type="text" name="myCountry" placeholder="Country"/>
                            </div>
                            &nbsp; &nbsp;

                           <div class="form-group">
                                <label for="fromDate">From :</label>
                                <input  name="fromDate" class="txt-style" type = "text" id = "datepicker-1"/>
                            </div>
                            &nbsp; &nbsp;

                            <div class="form-group">
                                <label for="toDate">To :</label>
                                <input  name="toDate" class="txt-style" type = "text" id = "datepicker-2"/>
                            </div>

                            <div class="form-group">
                                <label for="roomCount">Rooms :</label>
        <!--                        <input  name="roomCount" class="txt-style" type = "number" style="width: 60px;"/>-->
                                <select name="roomCount" class="txt-style" type = "number" style="width: 60px;background-color:#f1f1f1 ">
                                    <option value="1" selected>1</option>
                                    <option value="2">2</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                </select>
                            </div>
                            &nbsp; &nbsp;
                            <div class="form-group">
                                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label for="roomType">Room Type :</label>
                                <select name="roomType" class="txt-style" style="width: 200px;background-color:#f1f1f1 ">
                                    <option value="nomal" selected>nomal</option>
                                    <option value="luxery">luxery</option>
                                    <option value="family">family</option>
                                </select>
                            </div>
                            &nbsp; &nbsp;
                            <div class="form-group">
                                <label for="bedType">Bed Type :</label>
                                <select name="bedType" class="txt-style" style="width: 200px;background-color:#f1f1f1 ">
                                    <option value="single" selected>single</option>
                                    <option value="couple">couple</option>
                                    <option value="family">family</option>
                                </select>
                            </div>
                            &nbsp; &nbsp;
                            <div class="hidden">
                                    <tr>
                                        <input  name="userName" value="${userName}" class="txt-style" type = "text"/>
                                    </tr>
                                    <tr>
                                        <input  name="userType" value="${userType}" class="txt-style" type = "text"/>
                                    </tr>
                            </div>
                            <input type="submit" value="search" class="gs_btn_search txt-style"><br/>

                        </form:form>
                        <p></p>    
                    </div><br>
                </div>
            </div>
            <!--engine-->
        <div class="container" >
            
            <div class="font"> 
                        <div class="div-box">
                            <table class="modify-table" >
                                <tr>
                                    <td rowspan="3">
                                    
                                        <div class="item active">
                                            <img src="resources/images/cart.png" style="height: 90px;width: 100px;border-radius: 7px;border: #cccccc 1px solid;">
                                        </div>
                                    </td>
                                    <td colspan="3"style="font-size: 20px;"> &nbsp; &nbsp;Hotel&nbsp;${hotelName}&nbsp;-&nbsp;${hotelLocation}</td>
                                    <td colspan="3"></td>
                                </tr>
                                <tr>
                                     <td>Address : &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                                     <td colspan="2"><div>
                                                        <img src="resources/images/Telephone_20px.png" style="height: 20px;width:20px">&nbsp;&nbsp;${hotelPhone}
                                                    </div></td>
                                     <td>*&nbsp;${hotelStar} &nbsp;Star </td>
                                     <td>*&nbsp; ${rooms}&nbsp;${roomType} &nbsp;Rooms</td>
                                     <td>&nbsp;&nbsp;&nbsp;*&nbsp;${bedType} &nbsp;Bed</td>
                                </tr><br>
                                <tr>
                                    <td>${hotelAddress}</td>
                                    <td colspan="2"><div>
                                                        <img src="resources/images/Secured Letter_20px.png" style="height: 20px;width:20px;">&nbsp;&nbsp;${hotelMail}
                                                    </div></td>
                                    <td colspan="3"><div class="btn-style">Full Price Rs :&nbsp; ${allRoomsPrice}&nbsp;/=</div></td>
                                    
                                </tr>
                            </table><br></div>
                <br/>
            </div>
        </div>
        <br/>
<!--sssssssss-->
        <div class="container" id="searchBar">
        
        <form:form method="post" action="paymentDetails" modelAttribute="payment" role="form">
            <br>
            <div class="chart">
                <br>
                <!--hidden fields-->
                <div class="hidden">
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="hotelID" >@ hotelID :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="hotelID" value="${hotelId}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="hotelName" >@ hotelName :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="hotelName" value="${hotelName}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="hotelLocation" >@ hotelLocation :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="hotelLocation" value="${hotelLocation}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="hotelAddress" >@ hotelAddress :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="hotelAddress" value="${hotelAddress}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="hotelPhone" >@ hotelPhone :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="hotelPhone" value="${hotelPhone}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="hotelEmail" >@ hotelEmail :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="hotelEmail" value="${hotelMail}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="hotelStar" >@ hotelStar :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="hotelStar" value="${hotelStar}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="hotelEnabled" >@ hotelEnabled :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="hotelEnabled" value="${hotelEnabled}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="roomId" >@ roomId :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="roomId" value="${roomId}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="roomCode" >@ roomCode :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="roomCode" value="${roomCode}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="roomType" >@ roomType :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="roomType" value="${roomType}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="bedType" >@ bedType :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="bedType" value="${bedType}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="roomEnabled" >@ roomEnabled :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="roomEnabled" value="${roomEnabled}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="allRoomsPrice" >@ all Price :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="allRoomsPrice" value="${allRoomsPrice}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="allRoomsPrice" >@ in Id :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="inventoryId" value="${inventoryId}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="inventoryFrom" >@ in From :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="inventoryFrom" value="${fromDate}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="inventoryTo" >@ in To :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="inventoryTo" value="${toDate}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="inventoryCount" >@ in Count :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="inventoryCount" value="${rooms}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            &nbsp;&nbsp;&nbsp;<label id="label" for="inventoryDates" >@ in Dates :</label>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <form:input path="inventoryDates" value="${dates}" class="gs_form"/>
                            </div>
                        </div>
                    </div>
                </div>
                <!--hidden fields-->

                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="name" >* Name :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="name" class="gs_form"/>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="country" >* Country :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="country" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="address" >* Address :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="address" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="descreption" >* Description :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="descreption" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="phone" >* Phone :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="phone" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="email" >* Email :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="email" class="gs_form"/>
                        </div>
                    </div>
                </div><br>
            </div>
              <div class="chart" style="margin-top: 20px;">
                <div class="row">
                    <div class="col-sm-5">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="bookingType" style="color: #003399">* please select your Booking Type</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-3" style="margin-top: 3px;">
                            <form:radiobutton path="bookingType" value="offline" label="offline" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <form:radiobutton path="bookingType" value="online" label="online" />&nbsp;&nbsp;
                        </div>
                    </div>
                </div>
              </div>
              <div class="chart" style="margin-top: 20px;">
                <div class="row">
                    <div class="col-sm-8">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="confirm" style="color: red">* Are you Entered your correct information with this form ?</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2" style="margin-top: 3px;">
                            <form:checkbox path="confirm" value="Y"/>&nbsp;&nbsp;
                        </div>
                    </div>
                </div>
              </div>
                &nbsp;&nbsp;&nbsp;<input type="submit" value="PROCEED" id="gs_btn"><br/>
                &nbsp;&nbsp;
            
            &nbsp;&nbsp;
        </form:form>
    </div>






    </body>
</html>
