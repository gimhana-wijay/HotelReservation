
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel</title>
        <link rel="stylesheet" href="resources/css/bootstrap.css"> 
        
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
        
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
            .file-import{
                font-size: xx-small;
                margin-top: 7px;
            }
        </style>
        
    </head>
    <body>
    <jsp:include page="Menu.jsp" />
        
    <div class="container" id="searchBar">
        
        <form:form name="user" method="post" action="saveUser" modelAttribute="user" role="form">
            <h2>&nbsp;Add User</h2><br/>
            <div><span id="errormsg" style="display: none; color: red; padding: 10px;font-size: xx-small"></span></div>
            
            <div class="chart">
                <br>
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
                        &nbsp;&nbsp;&nbsp;<label id="label" for="userName" >* User Name :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="userName" class="gs_form"/>
                        </div>
                    </div>
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="password" >* Password :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="password" class="gs_form"/>
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
                </div>
                        
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="userType" >* User Type :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:select path="userType" id="comboBox">
                                <form:option value="admin" label="admin"></form:option>
                                <form:option value="user" label="user"></form:option>
                            </form:select>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="status" >* Status :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="status" class="gs_form"/>
                        </div>
                    </div>
                </div>
              
                &nbsp;&nbsp;&nbsp;<input type="submit" value="Save User" id="gs_btn"><br/>
                &nbsp;&nbsp;
            </div>
            &nbsp;&nbsp;
        </form:form>
    </div>

    </body>
    <script type="text/javascript">

		$(document).ready(function () {
			
//			jQuery.validator.addMethod('pattern', function (value, element) {
//				var val=value.substr(0, 3);
//				var ptrn='071';
//				if (ptrn == val) {
//					return true;
//				} else {
//					return false;
//				};
//			});
			
			$('form[name="user"]').validate({
				rules: {
					userName: {
                                                required: true
				    	},
                                        password: {
                                                required: true,
                                                maxlength: 8,
						minlength: 6
//                                                number: true,
//                                                pattern: true
//                                                equalTo: "#userName"
				    	}
				}, messages: {
					userName: {
						required: "Please enter user name before saving data",
				      	},
                                        password: {
						required: "Please enter password before saving data",
						maxlength: "Password should not exceed 8 characters",
						minlength: "Password should not be less than 6 characters",
//                                                number: "EMD number must not contain any special characters, symbols, letters or spaces",
//						pattern: "Entered EMD number is not valid. Please enter a valid EMD number"
				      	},
				}, errorPlacement: function (error,element) {
                      	error.appendTo("#errormsg");
                      	$("#errormsg").css("display", "block");
				}
		   	 });
			
 		 });
		
	</script>
</html>
