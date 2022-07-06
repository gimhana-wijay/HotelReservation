<%-- 
    Document   : setup
    Created on : Mar 10, 2020, 10:39:56 PM
    Author     : Gimhana Sandakelum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
/*  border: none;*/
  outline: none;
  cursor: pointer;
/*  padding: 14px 16px;*/
  font-size: 12px;
  width: 7%;
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 90%;
}

#Home {background-color: #ddd;}
#News {background-color: #ddd;}
#Contact {background-color: #ddd;}
#About {background-color: #ddd;}
</style>
</head>
<body>
    <div class="hedder" style="height: 40px"></div>

<button class="tablink" onclick="openPage('Home', this, '#31b0d5')">view</button>
<button class="tablink" onclick="openPage('News', this, '#31b0d5')" id="defaultOpen">News</button>
<button class="tablink" onclick="openPage('Contact', this, '#31b0d5')">Contact</button>
<button class="tablink" onclick="openPage('About', this, '#31b0d5')">About</button>

<div id="Home" class="tabcontent">
  <h3>Home</h3>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room</title>
        <link rel="stylesheet" href="resources/css/bootstrap.css"> 
        
        <style type="text/css">
            input[type=text]{
                width: 450px;
            }
        </style>
        
    </head>
    <body>        
    <div class="">
        
        <form:form method="post" action="saveRoom" modelAttribute="roomData" role="form">
            <h2>Add Room</h2><br/>

<!--            <div class="form-group">
                <label for="hotelId">Hotel Name :</label>
                <input type="text" name="hotelName" value="  ${hotelName}" disabled="" style="height: 23px"> 
                <a href="viewSelectHotel" class="btn btn-info btn-xs">Select</a>
            </div>-->
            
            <div class="form-group">
                <label for="room_type">Hotel Id :</label>
                <form:input path="hotelId" value="${hotelId}" class="form-control"/>
                <a href="viewSelectHotel" class="btn btn-info btn-xs">Select</a>
            </div>
                
            <div class="form-group">
                <label for="room_type">Room Type :</label>
                <form:input path="roomType" class="form-control"/>
            </div>

            <div class="form-group">
                <label for="roomTypeDescreption">Room Type Descreption :</label>
                <form:input path="roomTypeDescreption" class="form-control"/>
            </div>
            
            <div class="form-group">
                <label for="bedType">Bed Type :</label>
                <form:input path="bedType" class="form-control"/>
            </div>
            
            <div class="form-group">
                <label for="bedTypeDescreption">bed type Descreption :</label>
                <form:input path="bedTypeDescreption" class="form-control"/>
            </div>

            <div class="form-group">
                <label for="roomEnabled">Room Enabled :</label>
                <form:input path="roomEnabled" class="form-control"/>
            </div>
            
            <input type="submit" value="Save Room" class="btn btn-primary"><br/>
            
        </form:form>
    </div>

    </body>
</html>

</div>

<div id="News" class="tabcontent">
  <h3>News</h3>
  <p>Some news this fine day!</p> 
</div>

<div id="Contact" class="tabcontent">
  <h3>Contact</h3>
  <p>Get in touch, or swing by for a cup of coffee.</p>
</div>

<div id="About" class="tabcontent">
  <h3>About</h3>
  <p>Who we are and what we do.</p>
</div>

<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
   
</body>
</html> 

