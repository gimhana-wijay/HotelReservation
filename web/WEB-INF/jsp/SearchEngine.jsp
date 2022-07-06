<%-- 
    Document   : SearchEngine
    Created on : Mar 14, 2020, 8:59:57 PM
    Author     : Gimhana Sandakelum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Search Engine</title>
        
        <style type="text/css">
            #searchBar{
                border: #cccccc 1px solid;
                border-radius: 7px;
                background-color: #f9f9f9;

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
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <div class="container" id="searchBar">
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
                        <img src="resources/images/h1.jpg" style="height: 200px;">
                        <div class="carousel-caption">
                            <h3>Welcome To HotelsPro</h3>
                            <p>www.hotelspro.com</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="resources/images/h1.jpg" style="height: 200px;">
                        <div class="carousel-caption">
                            <h3>Enjoy Your Holiday Vacations</h3>
                            <p>www.hotelspro.com</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="resources/images/h1.jpg" style="height: 200px;">
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
<!--        search-->
        
                    
                    
                    
        <div id="booking" class="section">
            <div class="section-center">
                <div class="container">
                    <div class="row">
                        <div class="booking-form">
                            <div class="form-header">
                                <h1>Make your reservation</h1>
                            </div>
                            
                        

            <div class="row">
                <form:form method="post" action="searchHotel" class="form-inline" role="form">

                    <div class="form-group">
                        <label for="name">Location :</label>
                        <input  name="location"  style="width: 150px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    
                   <div class="form-group">
                        <label for="fromDate">From :</label>
                        <input  name="fromDate" type="date" style="width: 150px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
                    
                    <div class="form-group">
                        <label for="toDate">To :</label>
                        <input  name="toDate" type="date"  style="width: 150px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;
              
<!--                    <div class="form-group">
                        <label for="enabled">Enabled :</label>
                        <input  name="enabled"  style="width: 30px;height: 23px"/>
                    </div>
                    &nbsp; &nbsp;-->
                    <input type="submit" value="search" class="btn btn-primary btn-sm"><br/>
                    
                </form:form>
                <p></p> 
                </div>
                    </div>
                </div>
            </div>
        </div>
            </div>
        </div>
    </body>
</html>
