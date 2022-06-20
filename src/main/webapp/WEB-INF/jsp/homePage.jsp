<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Welcome!</title>
		<link rel="stylesheet" type="text/css" href="/css/homePage.css">
		<link rel="stylesheet" type="text/css" href="/css/circles.css">
    <link href='https://fonts.googleapis.com/css?family=Dekko' rel='stylesheet'>
    
	</head>
	<body>
        <div class="container">
            <h1 class = "greeting">Great to see you, <span>${username}</span>! How are you feeling today? </h1>
            <form action = "/saveMood" method="post">
            	<input type="hidden" name = "user_id" value = "${user_id}">
              <div class = "moods">
                <section id = 'one'>
                  <div>
                    <input type="radio" id="calm" name="feeling" value="Calm">
                    <label for="calm">
                      <h2>Calm</h2>
                    </label>
                  </div>
                  <div>
                    <input type="radio" id="stressed" name="feeling" value="Stressed">
                    <label for="stressed">
                      <h2>Stressed</h2>
                    </label>
                  </div>
                  
                  <div>
                    <input type="radio" id="positive" name="feeling" value="Positive">
                    <label for="positive">
                      <h2>Positive</h2>
                    </label>
                  </div>
                  <div>
                    <input type="radio" id="happy" name="feeling" value="Happy">
                    <label for="happy">
                      <h2>Happy</h2>
                    </label>
                  </div>
                  <div>
                    <input type="radio" id="hopeful" name="feeling" value="Hopeful">
                    <label for="hopeful">
                      <h2>Hopeful</h2>
                    </label>
                  </div>
                  </section>
                  <section id = 'two'>
                    <div>
                      <input type="radio" id="tired" name="feeling" value="Tired">
                      <label for="tired">
                        <h2>Tired</h2>
                      </label>
                    </div>
                    <div>
                      <input type="radio" id="upset" name="feeling" value="Upset">
                      <label for="upset">
                        <h2>Upset</h2>
                      </label>
                    </div>
                    <div>
                      <input type="radio" id="inspired" name="feeling" value="Inspired">
                      <label for="inspired">
                        <h2>Inspired</h2>
                      </label>
                    </div>
                    <div>
                      <input type="radio" id="anxious" name="feeling" value="Anxious">
                      <label for="anxious">
                        <h2>Anxious</h2>
                      </label>
                    </div>
                    <div>
                      <input type="radio" id="loved" name="feeling" value="Loved">
                      <label for="loved">
                        <h2>Loved</h2>
                      </label>
                    </div>
                    </section>
                    <section id = 'three'>
                      <div>
                        <input type="radio" id="lonely" name="feeling" value="Lonely">
                        <label for="lonely">
                          <h2>Lonely</h2>
                        </label>
                      </div>
                      <div>
                        <input type="radio" id="angry" name="feeling" value="Angry">
                        <label for="angry">
                          <h2>Angry</h2>
                        </label>
                      </div>
                      <div>
                        <input type="radio" id="hopeless" name="feeling" value="Hopeless">
                        <label for="hopeless">
                          <h2>Hopeless</h2>
                        </label>
                      </div>
                      <div>
                        <input type="radio" id="sad" name="feeling" value="Sad">
                        <label for="sad">
                          <h2>Sad</h2>
                        </label>
                      </div>
                      <div>
                        <input type="radio" id="enthusiastic" name="feeling" value="Enthusiastic">
                        <label for="enthusiastic">
                          <h2>Enthusiastic</h2>
                        </label>
                      </div>
                    </section>
              </div>
                    <section class = "journal">
                      <textarea placeholder = "Tell me more about your day..." name = "entry"></textarea>
                      <button type = "submit">&#10095;</button>
                    </section>
                    
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
        	let username = document.getElementById('username');
        	username.addEventListener("keydown", function(e){

        	    // Enter is pressed
        	    if (e.keyCode == 13) { document.getElementById('submit').click() }
        	}, false);
        </script>
    </body>
</html>