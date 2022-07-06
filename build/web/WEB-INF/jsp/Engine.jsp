<%-- 
    Document   : Engine
    Created on : Mar 17, 2020, 8:51:55 PM
    Author     : Gimhana Sandakelum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      <script>
         $(function() {
            $( "#datepicker-1" ).datepicker({
//               appendText:"(yy-mm-dd)",
               dateFormat:"yy-mm-dd",
               altField: "#datepicker-4",
               altFormat: "DD, d MM, yy"
            });
             $( "#datepicker-2" ).datepicker({
//               appendText:"(yy-mm-dd)",
               dateFormat:"yy-mm-dd",
               altField: "#datepicker-4",
               altFormat: "DD, d MM, yy"
            });
         });
      </script>     
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>hotelsPro</title>
        <style type="text/css">
            .searchBar{
                border: #cccccc 1px solid;
                border-radius: 7px;
                background-color: #e7e7e7;

            }
            
            .chart{
                border: #cccccc 1px solid;
                border-radius: 7px;
                width: 100%;
                height: 200px;
/*                background-color: #f5f5f5;*/
                margin-bottom:-16px;
                margin-top: 16px;
                align-content: center;
            }
            
            .gs_btn{
                padding: 4px 8px;
                color: white;
                font-size: 12px;
                text-align: center;
                background-color: #337ab7;
                border-radius: 4px;
                border: 1px solid #ccc;
                border-color :46b8da;
                width: 200px;
                height: 50px;
            }
            * {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}


.autocomplete {
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
/*  width: 100%;*/
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  top: 100%;
  left: 305;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
/*  border-bottom: 1px solid #d4d4d4; */
  width: 188px;
}

.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
.txt-style{
    height: 30px;
    border: 2px solid #e7e7e7;
}
        </style>
        
    </head>
    <body>
         
            <%--<c:forEach var="user" items="${userList}">
                <c:if test="${user[9] == 'user'}">
                    <jsp:include page="DefaultMenu.jsp"/> 
                </c:if>
                <c:if test="${user[9] == 'admin'}">
                    <jsp:include page="Menu.jsp" />
                </c:if>
            </c:forEach>--%>
            <jsp:include page="Menu.jsp" />
         
            <div class="container searchBar" >
                <div class="chart" >
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox" >
                        <div class="item active">
                            <img src="resources/images/hotel_theme_1.jpg" style="height: 200px;">
                            <div class="carousel-caption">
                                <h3>Welcome To HotelsPro</h3>
                                <p>www.hotelspro.com</p>
                            </div>
                        </div>

                        <div class="item">
                            <img src="resources/images/hotel_theme_2.jpg" style="height: 200px;">
                            <div class="carousel-caption">
                                <h3>Enjoy Your Holiday Vacations</h3>
                                <p>www.hotelspro.com</p>
                            </div>
                        </div>

                        <div class="item">
                            <img src="resources/images/hotel_theme_3.jpg" style="height: 200px;">
                            <div class="carousel-caption">
                                <h3>Get More Offers With Us</h3>
                                <p>www.hotelspro.com</p>
                            </div>
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            
            <h2>Make Your Reservation</h2>

            <div class="row" style="margin-left: 90px;">
                <form:form method="post" action="searchHotel" class="form-inline" role="form">
                    
                    <div class="row" id="table-div">

                    <br/>

                    </div>
                    
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
                            <option value="normal" selected>normal</option>
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
                        <%--<c:forEach var="user" items="${userList}">--%>
                            <tr>
<!--                                <input  name="userName" value="${user[1]}" class="txt-style" type = "text"/>-->
                                <input  name="userName" value="admin" class="txt-style" type = "text"/>
                            </tr>
                            <tr>
<!--                                <input  name="userType" value="${user[9]}" class="txt-style" type = "text"/>-->
                                <input  name="userType" value="admin" class="txt-style" type = "text"/>
                            </tr>
                        <%--</c:forEach>--%>
                    </div>
                    <input type="submit" value="search" class="gs_btn txt-style"><br/>
                    
                </form:form>
                <p></p>    
            </div>
        </div>
        &nbsp; &nbsp;
        <div class="container searchBar">

            <h1>Summer Holiday</h1>

            <div class="w3-row-padding w3-margin-top">

            <div class="w3-third">
            <div class="w3-card">
            <img src="resources/images/mainpage/POST-1.jpg" style="width:100%">
            <div class="w3-container">
            <p>Sri Lanka Vacation Packages. Want to book a vacation to Sri Lanka? Whether you're off for a romantic vacation, family trip, or an all-inclusive holiday ...</p>
            </div>
            </div>
            </div>

            <div class="w3-third">
            <div class="w3-card">
            <img src="resources/images/mainpage/POST-2.jpg" style="width:100%">
            <div class="w3-container">
            <p>Now, your adventure is just one click away. With our search and filter feature, you can find your next holiday destination with a click.Sri Lanka Vacation Packages. Want to book a vacation to Sri Lanka<p>
            </div>
            </div>
            </div>

            <div class="w3-third">
            <div class="w3-card">
            <img src="resources/images/mainpage/POST-3.jpg" style="width:100%">
            <div class="w3-container">
            <p>SriLankan Holidays, the leisure arm of the national carrier promotes travel to and from Sri Lanka, and also within all points throughout the airline's network.</p>
            <p>125 Sri Lanka Tour Packages - Get best deals on Sri Lanka tour packages for a dream vacation with your loved ones. Book customizable Sri Lanka tour ...
               Rating: 4.3 - ‎2,958 reviews.Find cheap package holidays in Sri Lanka with Mercury Holidays, and explore Sri Lanka's premier resort destinations at admirable prices. Whether you choose to ...</p>
            </div>
            </div>
            </div>

            </div>
        
        &nbsp; &nbsp;
        </div>
        
        </body>
        &nbsp; &nbsp;    
          <script>
            function autocomplete(inp, arr) {

              var currentFocus;

              inp.addEventListener("input", function(e) {
                  var a, b, i, val = this.value;

                  closeAllLists();
                  if (!val) { return false;}
                  currentFocus = -1;

                  a = document.createElement("DIV");
                  a.setAttribute("id", this.id + "autocomplete-list");
                  a.setAttribute("class", "autocomplete-items");

                  this.parentNode.appendChild(a);

                  for (i = 0; i < arr.length; i++) {

                    if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {

                      b = document.createElement("DIV");

                      b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                      b.innerHTML += arr[i].substr(val.length);

                      b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";

                      b.addEventListener("click", function(e) {

                          inp.value = this.getElementsByTagName("input")[0].value;

                          closeAllLists();
                      });
                      a.appendChild(b);
                    }
                  }
              });

              inp.addEventListener("keydown", function(e) {
                  var x = document.getElementById(this.id + "autocomplete-list");
                  if (x) x = x.getElementsByTagName("div");
                  if (e.keyCode == 40) {

                    currentFocus++;

                    addActive(x);
                  } else if (e.keyCode == 38) {

                    currentFocus--;

                    addActive(x);
                  } else if (e.keyCode == 13) {

                    e.preventDefault();
                    if (currentFocus > -1) {

                      if (x) x[currentFocus].click();
                    }
                  }
              });
              function addActive(x) {
                if (!x) return false;
                removeActive(x);
                if (currentFocus >= x.length) currentFocus = 0;
                if (currentFocus < 0) currentFocus = (x.length - 1);
                x[currentFocus].classList.add("autocomplete-active");
              }
              function removeActive(x) {
                for (var i = 0; i < x.length; i++) {
                  x[i].classList.remove("autocomplete-active");
                }
              }
              function closeAllLists(elmnt) {
                var x = document.getElementsByClassName("autocomplete-items");
                for (var i = 0; i < x.length; i++) {
                  if (elmnt != x[i] && elmnt != inp) {
                    x[i].parentNode.removeChild(x[i]);
                  }
                }
              }
              document.addEventListener("click", function (e) {
                  closeAllLists(e.target);
              });
            }

            var countries = ["dubai","muscut","colombo","colombia","col","kaluthara","oman"];

            autocomplete(document.getElementById("myInput"), countries);
          </script>

          </body>
    </body>
</html>
