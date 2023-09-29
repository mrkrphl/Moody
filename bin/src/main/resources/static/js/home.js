var winHeight = window.innerHeight;
var height = ( winHeight * 16.6666 )/10;
var lineHeight = height + "px";

const cont = document.querySelector('.calendar');
console.log("'" + lineHeight + "'");

// Date
let dt = new Date();
let month = dt.getMonth();
let year = dt.getFullYear();
let currentDay = dt.getDate();

let monthNames = [
    'January', 
    'February', 
    'March', 
    'April', 
    'May', 
    'June', 
    'July', 
    'August', 
    'September', 
    'October', 
    'November', 
    'December']

    let forward = document.querySelector('.forward');
    let reverse = document.querySelector('.reverse');
    
    
    forward.addEventListener('click', function back(){
        month = dt.getMonth();
        year = dt.getFullYear();
        currentDay = dt.getDate();
        forward.style.visibility = 'hidden';

        calendar();
    });
    reverse.addEventListener('click', function back(){
        month = dt.getMonth();
        year = dt.getFullYear();
        currentDay = dt.getDate();
        reverse.style.visibility = 'hidden';

        calendar();
    });
    
    prevMonth.addEventListener('click', function prev(){
        if(month===0){
            month =11;       
            year -= 1;
        }else{
            month-=1;
        }
        if(month !== dt.getMonth()){
            forward.style.visibility = 'visible';
        }else{
            forward.style.visibility = 'hidden';
        }

        if(reverse.style.visibility === 'visible'){
            forward.style.visibility = 'hidden';
        }
        
        console.log(month);
        console.log(year);
    
        calendar();
    });
    
    nextMonth.addEventListener('click', function next(){
        if(month===11){
            month =0;
            year += 1;
        }else{
            month+=1;
        }   

        if(month !== dt.getMonth()){
            reverse.style.visibility = 'visible';
        }else{
            reverse.style.visibility = 'hidden';
        }
        if(forward.style.visibility === 'visible'){
            reverse.style.visibility = 'hidden';
        }

        console.log(month);
        console.log(year);
    
        calendar();
    });
// get elements
prevMonth = document.querySelector('#prevMonth');
nextMonth = document.querySelector('#nextMonth');
monthName = document.querySelector('#month');
yearName = document.querySelector('#year');

//Weeks
first = document.querySelector('.first');
second = document.querySelector('.second');
third = document.querySelector('.third');
fourth = document.querySelector('.fourth');
fifth = document.querySelector('.fifth');
sixth = document.querySelector('.sixth');   

calendar();



function calendar(){
	if(month === dt.getMonth()){
        reverse.style.visibility = 'hidden';
        forward.style.visibility = 'hidden';
    }
	var info = document.querySelector('.info');
  	if(document.documentElement.contains(info)){
		info.remove();
	}
    if(month === 0){
        prevMonth.innerHTML = monthNames[11];
    }else{
        prevMonth.innerHTML = monthNames[month-1];
    }
    if(month === 11){
        nextMonth.innerHTML = monthNames[0];
    }else{
        nextMonth.innerHTML = monthNames[month+1];
    }
    
    monthName.innerHTML = monthNames[month];
    yearName.innerHTML = year;

    daysInMonth = new Date(year, month+1, 0).getDate(); //current month
    prevDaysInMonth = new Date(year, month, 0).getDate() //prevMonth
    dayNumber = new Date(year, month, 1).getDay();
    let weeks = [first, second, third, fourth, fifth, sixth];

    for(week = 0; week < 6; week++){
        while (weeks[week].firstChild) {
            weeks[week].removeChild(weeks[week].firstChild);
        }
    }


    console.log(daysInMonth);
    console.log(dayNumber);
    console.log(prevDaysInMonth);


    let gaps
    if(dayNumber === 0){
        gaps = 6
    }else{
        gaps = dayNumber 
    }
 
    let i = 0;
    let j = 0;
    let gapNumber = gaps-1;
    extraDay = 1;

    let limit = 35;
    if(gaps + (daysInMonth) > 35){
        limit = 42;
    }
    console.log(limit)
    for(day = -gaps + 1; day+gaps <= limit; day++){
        if(i > 0 && i%7 == 0){
            j++;
        }
        const days = document.createElement('a');

		
		
		
        days.setAttribute('class', 'days');
		days.addEventListener('click', function handleClick(){
    	            var info = document.querySelector('.info');
    	            var en = document.querySelector('#li'+days.getAttribute('id'))
			
    	            if(en){
						console.log("PARENT");
						var moody = en.firstChild;
				    	var entryy = en.lastChild.previousSibling;
				    	var cat = en.lastChild;
					}else{
						console.log("NO");
						if(document.documentElement.contains(info)){
							info.remove();
						}
						return;
					}
    	            
    	            console.log('#li'+this.getAttribute('id'));
    	            if(document.documentElement.contains(info)){
    	            	console.log("YES");
    	            	if(info.getAttribute('id') !== this.getAttribute('id')){
        	            	console.log("UHUH");
    	            		info.remove();
        	            	var info = document.createElement('div');
            	            info.setAttribute('class', 'info');
            	            info.setAttribute('id', this.getAttribute('id'));
            	            var mood = document.createElement('div');
            	            mood.setAttribute('class', 'mood');
            	            var entry = document.createElement('div');
            	            entry.setAttribute('class', 'entry');
            	            var moodh1 = document.createElement('h2');
            	            moodh1.innerHTML = 'Mood:';
            	            var moodh2 = document.createElement('h2');
            	            moodh2.setAttribute('id', 'mood');
            	            moodh2.innerHTML = moody.value;
            	            moodh2.setAttribute('class', cat.value);

            	            mood.appendChild(moodh1);
            	            mood.appendChild(moodh2);

            	            var p = document.createElement('p');
            	            p.setAttribute('id', 'entry');
            	            p.innerHTML = entryy.value;
            	            entry.appendChild(p);

            	            info.appendChild(mood);
            	            info.appendChild(entry);

            	            this.parentNode.parentNode.insertBefore(info, this.parentNode.nextSibling);
        	            }else{
        	            	info.remove();
        	            }
    	            }else{
    	            	console.log("NONE");
    	            	var info = document.createElement('div');
        	            info.setAttribute('class', 'info');
        	            info.setAttribute('id', this.getAttribute('id'));
        	            var mood = document.createElement('div');
        	            mood.setAttribute('class', 'mood');
        	            var entry = document.createElement('div');
        	            entry.setAttribute('class', 'entry');
        	            var moodh1 = document.createElement('h2');
        	            moodh1.innerHTML = 'Mood:';
        	            var moodh2 = document.createElement('h2');
        	            moodh2.setAttribute('id', 'mood');
        	            moodh2.innerHTML = moody.value;
        	            moodh2.setAttribute('class', cat.value);

        	            mood.appendChild(moodh1);
        	            mood.appendChild(moodh2);

        	            var p = document.createElement('p');
        	            p.setAttribute('id', 'entry');
						p.innerHTML = entryy.value;
        	            entry.appendChild(p);

        	            info.appendChild(mood);
        	            info.appendChild(entry);

        	            this.parentNode.parentNode.insertBefore(info, this.parentNode.nextSibling);
    	            }
    	            
    	        });
        

        if(day <= 0){
            days.innerHTML = prevDaysInMonth - gapNumber;
            days.setAttribute('class', 'last-month');
            let id = `date${year}${stringize(month)}${stringize(prevDaysInMonth - gapNumber)}`;
            days.setAttribute('id', id);
            var en = document.querySelector('#li'+days.getAttribute('id'))
			if(en){
		    	var cat = en.lastChild;
		    	days.classList.add(cat.value);
			}
            gapNumber -= 1;
            weeks[j].appendChild(days);
        }else if(day === currentDay && month === dt.getMonth() && year === dt.getFullYear()){
            days.setAttribute('class', 'active');
            let id = `date${year}${stringize(month+1)}${stringize(day)}`;
            days.setAttribute('id', id);
            var en = document.querySelector('#li'+days.getAttribute('id'))
			if(en){
		    	var cat = en.lastChild;
		    	days.classList.add(cat.value);
			}
            days.innerHTML = day;
            weeks[j].appendChild(days);
        }else if(day > daysInMonth){
            days.innerHTML = extraDay;
            days.setAttribute('class', 'last-month');
            let id = `date${year}${stringize(month+2)}${stringize(extraDay)}`;
            days.setAttribute('id', id);
            var en = document.querySelector('#li'+days.getAttribute('id'))
			if(en){
				
		    	var cat = en.lastChild;
		    	days.classList.add(cat.value);
			}
            extraDay += 1;
            weeks[j].appendChild(days);
        }else{
            days.innerHTML = day;
            let id = `date${year}${stringize(month+1)}${stringize(day)}`;
            days.setAttribute('id', id);
            var en = document.querySelector('#li'+days.getAttribute('id'))
			if(en){
				console.log("YOWW");
		    	var cat = en.lastChild;
		    	days.classList.add(cat.value);
			}
            weeks[j].appendChild(days);
        }
        var en = document.querySelector('#li'+days.getAttribute('id'))
		if(en){
	    	var cat = en.lastChild;
	    	days.classList.add(cat.value);
		}
        i++;
    }
        
    

}

function stringize(num){
	if(num < 10){
		return "0" + num;
	}
	return num;
}


var edit = document.getElementById("edit");
edit.addEventListener("click", function editUser(){
	console.log("CLICKED!")
	var fields = document.querySelectorAll("input[type=text]");
	if(fields[0].disabled === true){
		console.log("YES")
		for(var index = 0; index < fields.length; index++){
		fields[index].disabled = false;
		fields[index].style.borderBottom = '1px solid red';
		}
		document.getElementById('editButton').style.visibility = 'visible';
		document.getElementById('cancel').style.visibility = 'visible';
		
	}
	
})

var changePass = document.getElementById("changePass");
changePass.addEventListener('click', function clicked(){
	var pass = document.querySelector('.passwords');

		console.log("YES")
		pass.style.visibility = 'visible';
		document.getElementById('editButton').style.visibility = 'visible';
		document.getElementById('cancel').style.visibility = 'visible';
		
	var fields = document.querySelectorAll("input[type=text]");
	if(fields[0].disabled === true){
		console.log("YES")
		for(var index = 0; index < fields.length; index++){
			fields[index].disabled = false;
			fields[index].style.borderBottom = '1px solid red';
		}
	}
		
})

var cancel = document.getElementById('cancel');
cancel.addEventListener('click', function handle(){
	var fields = document.querySelectorAll("input[type=text]");
	 if(fields[0].disabled === false){
		console.log("NO")
		for(var index = 0; index < fields.length; index++){
		fields[index].disabled = true;
		fields[index].style.borderBottom = '1px solid black';
		}
		document.getElementById('editButton').style.visibility = 'hidden';
		cancel.style.visibility = 'hidden'
		
	}
	var pass = document.querySelector('.passwords');

		console.log("NO")
		pass.style.visibility = 'hidden';
		document.getElementById('editButton').style.visibility = 'hidden';
		

})
function confirmPass(){
	let newPass = document.getElementById('newPass');
	let confPass = document.getElementById('confNewPass');
	if(newPass.value !== confPass.value){
		alert("Passwords do not match!");
		return false;
	}
	return true;
}

var logout = document.getElementById('logout');
logout.addEventListener('click', function logout(){
	document.getElementById("logOutForm").submit();
});


