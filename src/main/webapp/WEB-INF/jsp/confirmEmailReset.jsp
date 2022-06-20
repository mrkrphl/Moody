<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Reset Password</title>
	<link href = "../css/styles.css" rel = "stylesheet" type="text/css">
</head>
<body>
	<body>
        <div class="container">
            <h1 class = "greeting"> Trying to reset your password? Enter your email and we'll send you a link!</h1>
            <form action = "/confirmEmail">
            	<input class="info" type="email" tabindex="2" minlength="1" required placeholder="Email" name = "email"/>
	            <h2 style = "text-align:center">${error}</h2>
	            <div class = "buttonDiv">
            		<button type = "submit" id = "reset">Submit email</button>
            	</div>
            </form>
            <form action = "/">
            	<div class = "buttonDiv">
            		<button type = "submit" id = "reset">Back to login</button>
            	</div>
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
        </div>
</body>
</html>