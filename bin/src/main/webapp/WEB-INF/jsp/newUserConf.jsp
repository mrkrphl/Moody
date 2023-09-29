<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
        <title>Welcome!</title>
        <link href = "css/styles.css" rel = "stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h1 class = "greeting">Just to make sure, could you say that again? </h1>
             <form action = "/saveUser" method="post" onsubmit = "return verifyPass()">
            	<input type="hidden" id="username" name = "username" value = "${username}"/>
            	<input type="hidden" id="email" name = "email" value = "${email}"/>
            	<input type="hidden" id="password" name = "password" value = "${password}"/>
            	<input class="info" type="password" tabindex="2" required placeholder="Confirm Password" id="confirm" name = "confirm"/>
            	<button class="inv" id="submit"></button>
            </form>
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
		<script src = "js/newUser.js"></script>
    </body>

</body>
</html>