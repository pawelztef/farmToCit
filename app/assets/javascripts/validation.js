
	//form validation
	var invalid = 0;
	
function validation1() {	
	var invalid = 0;
	if(document.getElementById("name").value == ""){
		alert("You must enter a name");
		invalid += 1;
		
	}
	else{
		document.getElementById("invalid_1").innerHTML = "";
	}
	
	if(document.getElementById("email").value.indexOf("@")) == -1){
		document.getElementById("invalid_2").innerHTML = "Invalid Email";
		invalid += 1;
	}
	
    else{
	document.getElementById("invalid_2").innerHTML = "";
        }
	
	if(invalid !=0){
		return false;
	}
	
	else{
		return true;
	}
}