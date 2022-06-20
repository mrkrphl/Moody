username.addEventListener("keydown", function(e){

        	    // Enter is pressed
        	    if (e.keyCode == 13) { document.getElementById('submit').click() }
        	}, false);
        	
function validate(){
	let password = document.getElementById("password");
	let confirm = document.getElementById("confirm");
	if(password.value == ""){
		alert("Fields cannot be blank...");
		return false;
	}
	else if(password.value != confirm.value){
		alert("Passwords do not match...");
		return false;
	}
	return true;
}