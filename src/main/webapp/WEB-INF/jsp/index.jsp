<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Welcome!</title>
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
        <div class="container">
            <h1 class = "greeting"> Welcome to Moody, your daily Mood Tracker! Hello, </h1>
            <form action = "/verifyUser" method="post">
            	<input class="info" type="email" tabindex="2" required placeholder="email" id="email" name="email"/>
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
        </div>
        <script>
        	let username = document.getElementById('email');
        	username.addEventListener("keydown", function(e){

        	    // Enter is pressed
        	    if (e.keyCode == 13) { document.getElementById('submit').click() }
        	}, false);
        </script>
    </body>
</html>