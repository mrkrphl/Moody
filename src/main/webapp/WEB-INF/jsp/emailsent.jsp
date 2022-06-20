<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Email Sent!</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
        <div class="container">
            <h1 class = "greeting"> Hello, there! We've sent an email to ${email} to reset your password. Please check your inbox and follow the instructions.</h1>
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