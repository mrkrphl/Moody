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
            <h1 class = "greeting"> It seems you forgot your password. Don't worry, let's set a new one. </h1>
            <form action = "/reset" onsubmit = "return checkPasswords()">
            	<input class="info" type="password" tabindex="2" minlength="1" required placeholder="New Password" name = "newPass"/>
	            <input class="info" type="password" tabindex="2" minlength="1" required placeholder="Confirm New Password" name = "confNewPass"/>
	            <input type = "hidden" name = "email" value = "${email}"/>
	            <div class = "buttonDiv">
	                <button type = "submit" id = "reset" >Reset Password</button>
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
        <script>
        	function checkPasswords(){
        		let newpass = document.getElementByName('newPass');
            	let confirmPass = document.getElementByName('confNewPass');
            	if (newpass !== confirmPass){
            		alert("Passwords do not match!");
            		return false;
            	}else if(newPass == "" || confirmPass == ""){
            		alert("Passwords cannot be blank!");
            		return false;
            	}
            	return true
        	}
        </script>
</body>
</html>