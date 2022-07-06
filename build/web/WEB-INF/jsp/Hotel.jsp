
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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
        
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
        
        <form:form name="hotel" method="post" action="saveHotel" modelAttribute="hotel" role="form">
            <h2>&nbsp;Add Hotel</h2><br/>
            <div><span id="errormsg" style="display: none; color: red; padding: 10px;font-size: xx-small"></span></div>
            
            <div class="chart">
                <br>
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="name" >* Name :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="name" id="field" class="gs_form"/>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="location" >* Location :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="location" class="gs_form"/>
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
                        &nbsp;&nbsp;&nbsp;<label id="label" for="descreption" >* Image :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <input type="file" name="image" class="file-import"/>
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
                        &nbsp;&nbsp;&nbsp;<label id="label" for="star" >* Star Category :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:input path="star" class="gs_form"/>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-2">
                        &nbsp;&nbsp;&nbsp;<label id="label" for="enabled" >* Enabled :</label>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <form:radiobutton path="enabled" value="Y" label="Yes"/>&nbsp;&nbsp;
                            <form:radiobutton path="enabled" value="N" label="No"/>
                        </div>
                    </div>
                </div>
              
                &nbsp;&nbsp;&nbsp;<input type="submit" value="Save Hotel" id="gs_btn"><br/>
                &nbsp;&nbsp;
            </div>
            &nbsp;&nbsp;
        </form:form>
    </div>

    </body>
   <script type="text/javascript">

		$(document).ready(function () {

			
			$('form[name="hotel"]').validate({
				rules: {
					name: {
                                                required: true
				    	}
				}, messages: {
					name: {
						required: "Please enter hotel name before saving data"
				      	},
				}, errorPlacement: function (error,element) {
                      	error.appendTo("#errormsg");
                      	$("#errormsg").css("display", "block");
				}
		   	 });
			
 		 });
		
	</script>
</html>
