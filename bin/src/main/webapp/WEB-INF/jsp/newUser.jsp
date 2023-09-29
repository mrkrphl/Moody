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
            <h1 class = "greeting"> I see it's your first time. To make your visits more secure, please create a username and password:</h1>
            <form action = "/newUserConf" method="post">
            	<input type = "hidden" value = "${email}" name = "email" id = "email">
            	<div id = "fields">
   
	            	<input class="info" type="text" tabindex="2" required placeholder="username" id="username" name = "username"/>
	          		<span>${usedUsername}</span>
	            	<input class="info" type="password" tabindex="2" required placeholder="password" id="password" name = "password"/>
            	</div>
            	<button class="inv" id="submit"></button>
            </form>
            <form action = "/" id = "signinForm">
            	<div style = "display:flex;justify-content:center;">
            		<p>Already a user? <a id = "signin" style = "cursor:pointer;text-decoration:underline;"> <b>Sign in</b> </a> instead </p>
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
        </div >
        <script>
        	username.addEventListener("keydown", function(e){
        	    // Enter is pressed
        	    if (e.keyCode == 13) { document.getElementById('submit').click() }
        	}, false);
        	
        	let siginin = document.getElementById("signin");
        	signin.addEventListener('click', function signin(){
        		document.getElementById('signinForm').submit();
        	})
        </script>
    </body>

</body>
</html>