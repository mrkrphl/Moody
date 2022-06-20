<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> -->
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Welcome!</title>
        <link href = '/css/home.css' type = text/css rel = stylesheet>
        <link rel="stylesheet" type="text/css" href="/css/circles.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
        
    </head>
	<body>
        
		<ul class = "hidden">
		</ul>
        <div class = 'cardcontainer'>
            <input type="radio" name="slider" id="item-1" checked>
            <input type="radio" name="slider" id="item-2">
            <input type="radio" name="slider" id="item-3">
            <div class = 'cards'>
                <label class="calcontainer" for = "item-1" id="calendar">
                    <div class="calendar">
                        <div class="main">
                            <div class="current-date">
                                <div class = "months">  
                                    <span class='reverse'>&#10094;</span>
                                    <h2 id = "prevMonth"></h2>
                                    <h1 id= "month"></h1>
                                    <h2 id = "nextMonth"></h2>
                                    <span class='forward'>&#10095;</span>
                                </div>
                                <p id = "year"></p> 
                            </div>
                            <div class="current-month">
                                <ul class="week-days">
                                    <li>SUN</li>
                                    <li>MON</li>
                                    <li>TUE</li>
                                    <li>WED</li>
                                    <li>THU</li>
                                    <li>FRI</li>
                                    <li>SAT</li>
                                </ul>
        
                                <div class="weeks">
                                    <div class="first"></div>
                                    <div class="second"></div>
                                    <div class="third"></div>
                                    <div class="fourth"></div>
                                    <div class="fifth"></div>
                                    <div class="sixth"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </label>
                <label class="calcontainer" for = "item-2" id = "profile">
                    <div class="calendar">
                        <div class="main">
                            <div class="photo">
                                <div>
                                    <img src="http://localhost:8080/images/user.png" alt = "ME!" id = "dp"/>
                                    <i class='fa fa-edit edit' style="font-size: 1.3em;" id = "edit"></i>
                                </div>
                                 <div class = "logout">
                                    <form action = "/logout" id = "logOutForm">
                                        <h5 id = "logout">Log Out</h5>
                                    </form>
                                </div>
                            </div>
                            <div class="details">
                            	<form action = "/updateUser" method = "post" onsubmit = "return confirmPass()">
                            		<div class = "name">
	                                    <h4> Name: </h4>
	                                    <input type="hidden" value= "${userId}" name = "userId">
	                                    <div>
	                                        <span>First Name: </span>
	                                        <input type="text" disabled name = "firstName" value="${firstName}">
	                                    </div>
	                                    <div>
	                                        <span>Middle Name: </span>
	                                        <input type="text" disabled name = "middleName" value="${middleName}">
	                                    </div>
	                                    <div>
	                                        <span>Last Name: </span>
	                                        <input type="text" disabled name = "lastName" value="${lastName}">
	                                    </div>
	                                </div>
	                                <div class = "account">
	                                    <h4>Account: </h4>
	                                    <div>
	                                        <span>Username: </span>
	                                        <input type="text" disabled value="${username}" name = "username" required>
	                                      
	                                    </div>
	                                    <div>
	                                        <span>Email: </span>
	                                        <input type="text" disabled value="${email}" name = "email" required>
	                                     	<input type = "hidden" value = "${password}" name = "password"/>
	                                    </div>
	                                    <span class = "error">${error}</span>
	                                   	<div>
	                                   		<span id="changePass">Change Password</span>
	                                   		<div class = "passwords">
	                                   			<input type ="password" id = "oldPass" placeholder = "Old Password" name = "oldPass"/>
		                                   		<input type = "password" id = "newPass" placeholder = "New Password" name = "newPass"/>
		                                   		<input type = "password" id = "confNewPass" placeholder = "Confirm New Password" name = "confNewPass"/>
	                                   		</div>
	                                   	</div>
	                                </div>
	                                <div id = "buttonDiv">
	                                	<button type = "Submit" id = "editButton" class = 'btn'>Edit</button>
	                                	<p style="cursor:pointer;" class = 'btn' id = "cancel"> Cancel </p>
	                                </div>
                            	</form>
                                
                            </div>
                        </div>
                    </div>
                </label>
                <label class="calcontainer" for = "item-3" id = "flow">
                    <div class="calendar">
                        <div class="main">
                            <div class="title">
                                <h1>Mood Flow</h1>
                                
                            </div>
        
                            <div class = "fig">
                            	<div>
                            		<ul class = "tags">
                            			<li style = "color:#f4d600;webkit-text-stroke:5px black;">Ecstatic</li>
                            			<li style = "color:#00ff00;webkit-text-stroke:5px black;">Happy</li>
                            			<li style = "color:#44bb4a;webkit-text-stroke:5px black;">OK</li>
                            			<li style = "color:#1a620d;webkit-text-stroke:5px black;">Sad</li>
                            			<li style = "color:#535353;webkit-text-stroke:5px black;">Devastated</li>
                            		</ul>
                            	</div>
                                <figure class="css-chart" style="--widget-size: 700px;">
                                    <ul class="line-chart"></ul>
                                </figure>
                            </div>	
                        </div>
                    </div>
                </label>
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
        </div>
    	
        <script src="/js/home.js" type="text/javascript"></script>
        <script>
    		var count = ${fn:length(moods)};
    		var xGap = parseInt(700/count);
    		let inp = document.createElement('input');
    		inp.setAttribute('type', 'hidden');
    		inp.setAttribute('value', xGap);
    		inp.setAttribute('id', 'gap');
    		
    		let inp2 = document.createElement('input');
    		inp2.setAttribute('type', 'hidden');
    		inp2.setAttribute('value', 0);
    		inp2.setAttribute('id', 'start');
    		
    		let tit = document.querySelector('.title');
    		tit.appendChild(inp);
    		tit.appendChild(inp2);
    		
    	</script>
        <c:forEach var = 'mood' items = "${moods}">
    		<script>
    			
    			// FOR THE CALENDAR
    			var id = `${mood.date}`;
    			id = id.replaceAll('-', '');
    			liId = 'lidate' + id;
    			id = '#date' + id;
    			var cat = `${mood.category}`;
    			day = document.querySelector(id);
    			day.classList.add(cat);
    			console.log(day);
    			
    			var ul = document.querySelector('.hidden');
    			var li = document.createElement('li');
    			li.setAttribute('id', liId);
    			var mood = document.createElement('input');
    			mood.type = "hidden";
    			mood.value = `${mood.mood}`;
    			mood.setAttribute('class', id);
    			var date = document.createElement('input');
    			date.type = "hidden";
    			date.value = `${mood.date}`;
    			date.setAttribute('class', id);
    			var entry = document.createElement('input');
    			entry.type = "hidden";
    			entry.value = `${mood.entry}`;
    			entry.setAttribute('class', id);
    			var cat = document.createElement('input');
    			cat.type = "hidden";
    			cat.value = `${mood.category}`;
    			
    			li.appendChild(mood);
    			li.appendChild(date);
    			li.appendChild(entry);
    			li.appendChild(cat);
    			
    			ul.appendChild(li);
    			
    			//FOR MOOD FLOW	
    			console.log("FOR MOOD FLOW")
    			
    			var ul2 = document.querySelector('.line-chart');
    			var ulli = document.createElement('li');
    			var div1 = document.createElement('div');
    			var div2 = document.createElement('div');
    			
    			var start = document.getElementById('start');
    			var gap = document.getElementById('gap')
    			var xGap = parseInt(start.value) + parseInt(gap.value);
    			start.value = xGap;
    			
    			
    			div1.setAttribute("class", "data-point");
    			var x = 1;
    			switch(`${mood.category}`){
    				case "Ecstatic":
    					x = 5;
    					break;
    				case "Happy":
    					x = 4;
    					break;
    				case "OK":
    					x = 3;
    					break;
    				case "Sad":
    					x = 2;
    					break;
    				case "Devastated":
						x = 1;
						break;
    			}
    			div1.setAttribute("data-value", x);
    			var yGap = (x/5) * 700;
    			var style = "--x: "+xGap+"px; --y: "+yGap+"px";
    			console.log(style);
    			ulli.setAttribute('style', style);
    			ulli.setAttribute('id', xGap);
    			ulli.setAttribute('name', yGap);
    			console.log(x);
    			div2.setAttribute('class', 'line-segment');
    			if(ul2.firstChild){
    				console.log('YES')
    				var firstChild = ul2.lastChild;
    				if(firstChild.lastChild.getAttribute('style') ===  "--hypotenuse: 0; --angle: 0"){
    					var hypotenuse = Math.sqrt(Math.pow((parseInt(firstChild.getAttribute('name')) - yGap), 2) + Math.pow(parseInt(gap.value), 2));
    					var angle = Math.asin((parseInt(firstChild.getAttribute('name')) - yGap)/hypotenuse) * (180/Math.PI)
    					var style3 = "--hypotenuse: "+hypotenuse+"; --angle: " +angle;
    					
    					firstChild.lastChild.setAttribute('style', style3);
    				}
    				
					
				}
    			var style2 = "--hypotenuse: "+0+"; --angle: " +0;
    			div2.setAttribute('style', style2);
    			ulli.appendChild(div1);
    			ulli.appendChild(div2);
    			ul2.appendChild(ulli);
    			
    		</script>
    	</c:forEach>
    	
    
    </body>
</html>