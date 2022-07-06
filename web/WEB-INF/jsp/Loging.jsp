<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
    <head>
        <title>Login Page</title>
        <link rel="stylesheet" href="resources/css/bootstrap.css"> 
        <script type="text/javascript" src="resources/js/bootstrap.js"></script>

        <style>

            body{
                background-image: url(resources/images/world.jpg);
            }

            .error {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
            }

            .msg {
                padding: 15px;
                margin-bottom: 20px;
                border: 1px solid transparent;
                border-radius: 4px;
                color: #31708f;
                background-color: #d9edf7;
                border-color: #bce8f1;
            }

            #login-box {
                width: 400px;
                padding: 20px;
                margin: 100px auto;
                background: #fff;

                border: 1px solid #999999;
                border-radius: 5px;
                
                -webkit-box-shadow: 0 0 5px 2px #999999;
                -moz-box-shadow: 0 0 5px 2px #999999;
                box-shadow: 0 0 5px 2px #999999;
            }

            label{
                width: 70px;
            }

            h1{
                text-align: center;
                font-size: 65px;
                color: #666666;

            }
            .error-msg{
                width: 200px;
                height: 10px;
                font-size: x-small;
            }

        </style>
    </head>
    <body onload='document.loginForm.username.focus();'>

        <h1>Welcome to HotelsPro</h1>

        <div id="login-box">

            <h4 style="text-align: center">Login with Username and Password</h4>
            <label class="error-msg" style="color: red">${errorMsg}</label>
            <br><br>

            <form name='loginForm' action="<c:url value='/login' />" method='POST'>
               
                <div class="form-inline">
                    <label>User</label>
                    <input type='text' name='username'  class="form-control" style="height: 30px; width: 250px;">
                </div>
                <p></p>
                <div class="form-inline">
                    <label>Password</label></td>
                    <input type='password' name='password'  class="form-control" style="height: 30px;width: 250px;"/>
                </div>
                <p></p>
                <input name="submit" type="submit" value="submit" class="btn btn-block btn-primary btn-default" />

            </form>
        </div>

    </body>
</html>