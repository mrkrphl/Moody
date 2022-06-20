<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <title>Welcome Back!</title>
        <link href = "css/styles.css" rel = "stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h1 class = "greeting"> Welcome Back! To visit Moody, please enter your password.</h1>
            <div style = "display: flex; justify-content:center;">
            	<h2>${error}</h2>
            </div>
            <form action = "/validateLogin" method="post">
            	<input type = "hidden" name = "username" id = "username" value = "${username}">
            	<input class="info" type="password" tabindex="2" required placeholder="password" id="password" name = "password"/>
            	<button class="inv" id="submit"></button>	
            </form>
            <div id = "forgot" style = "display:flex;justify-content:center;margin:2%;"> 
           		<form action = "/resetPassword" id = "resetForm">
            		<a class = "forgot" style = "cursor:pointer" onclick = "return submitForm()">Forgot Password</a>
           		</form>
            </div>
        </div>
        <div class="area" >
            <ul class="circles">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
            </ul>
        </div >
        <script>
        	function submitForm(){
        		let reset = document.getElementById("resetForm");
        		reset.submit();
        	}
        </script>
    </body>

</body>
</html>