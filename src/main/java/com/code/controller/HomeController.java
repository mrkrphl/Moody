package com.code.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.code.MailUtil;
import com.code.dao.UserDao;
import com.code.model.Mood;
import com.code.model.User;

@Controller
public class HomeController {
	
	@Autowired
	private User user;
	
	@Autowired
	private UserDao userDao;
	
	//INDEX EITHER LOG IN OR HOME PAGE
	@RequestMapping("/")
	public String index(Model model) {
		if(user != null) {
			if(user.getUsername() != null) {
				if(userDao.checkedIn(user)) {
					return goToHome(model, user);
				}else {
					return "homePage";
				}
					
			}
		}
		return "index";
	}
	
	//CHECK IF USERNAME AND PASSWORD MATCH
	@RequestMapping("/validateLogin")
	public String validateLogin(Model model, @RequestParam("username") String username, @RequestParam("password") String password) {
		System.out.println(username);
		user = userDao.findByUsername(username);
		System.out.println(user.getUserId());
		boolean checkPassword = BCrypt.checkpw(password, user.getPassword());
		if(!checkPassword) {
			model.addAttribute("error", "Invalid login credentials...");
			model.addAttribute("username", username);
			model.addAttribute("password", password);
			user = null;
			return "login";
		}
		if(userDao.checkedIn(user)) {
			return goToHome(model, user);
		}
		model.addAttribute("user_id", Integer.toString(user.getUserId()));
		model.addAttribute("username", user.getUsername());
		return "homePage";
	}
	
	//GO TO CHECK IN PAGE
	@RequestMapping("/homePage")
	public String homePage(Model model){
		if (user != null){
			if (user.getUsername() != null){
				if(userDao.checkedIn(user)) {
					return goToHome(model, user);
				}else {
					return "homePage";
				}
			}
		}
		return "index";
	}
	
	//REMOVE CURRENT USER
	@RequestMapping("/logout")
	public String logout(){
		user = null;
		return "index";
	}
	
	@RequestMapping("/resetPassword")
	public String resetPassword(Model model){
		if(user != null) {
			if(user.getUsername() != null) {
				return goToHome(model, user);
			}
		}
		return "confirmEmailReset";
	}
	
	@RequestMapping("/confirmEmail")
	public String confirmEmail(Model model, @RequestParam("email") String email) {
		user = userDao.findByEmail(email);
		if (user != null){
				MailUtil.sendMail(email);
				model.addAttribute("email", email);
				user = null;
				return "emailsent";
		}
		model.addAttribute("error", "User with that email does not exist!");
		return "confirmEmailReset";
	}
	
	@RequestMapping("/resetpass/{email}")
	public String resetpass(Model model, @PathVariable("email") String email) {
		model.addAttribute("email", email);
		return "resetpass";
	}
	
	@RequestMapping("/reset")
	public String reset(Model model, @RequestParam("email") String email, @RequestParam("newPass") String pass) {
		String salt = BCrypt.gensalt(10);
		String hashed = BCrypt.hashpw(pass, salt);
		int result = userDao.resetPassword(email, hashed);
		if (result > 0) {
			System.out.println("Successfully reset password!");
		}
		return "successReset";
	}
	//CHECK IF USER EXISTS
	@RequestMapping("/verifyUser")
	public String validateUser(Model model, @RequestParam("email") String email) {
		if(user != null) {
			if(user.getUsername() != null) {
				return goToHome(model, user);
			}
		}
		user = userDao.findByEmail(email);
		if(user != null){
			model.addAttribute("username", user.getUsername());
			user = null;
			return "login";
		}
		model.addAttribute("email", email);
		return "newUser";
	}
	
	//CONFIRM NEW USER 
	@RequestMapping("/newUserConf")
	public String newUserConf(Model model, @RequestParam("username") String username,
							@RequestParam("password") String password, @RequestParam("email") String email) {
		User found = userDao.findByUsername(username);
		if(found != null) {
			model.addAttribute("usedUsername", "Username is taken, try again");
			return("newUser");
		}
		model.addAttribute("username",username);
		model.addAttribute("email", email);
		model.addAttribute("password",password);
		return "newUserConf";
	}
	
	//SAVE NEW USER TO DATABASE
	@RequestMapping("/saveUser")
	public String saveUser(Model model, @RequestParam("username") String username,
						@RequestParam("password") String password,
						@RequestParam("email") String email) {
		User user = new User();
		user.setUsername(username);
		user.setEmail(email);
		String salt = BCrypt.gensalt(10);
		String hashed = BCrypt.hashpw(password, salt);
		user.setPassword(hashed);
		int result = userDao.saveUser(user);
		if(result > 0) {
			System.out.println("Success!");
		}
		user = userDao.findByUsername(username);
		model.addAttribute("user_id", Integer.toString(user.getUserId()));
		model.addAttribute("username", user.getUsername());
		return "homePage";
	}
	
	//GO TO HOME PAGE
	public String goToHome(Model model, User user) {
		List<Mood> moods = userDao.listOfMoods(user);
		model.addAttribute("moods", moods);
		model.addAttribute("firstName", user.getFirstName());
		model.addAttribute("middleName", user.getMiddleName());
		model.addAttribute("lastName", user.getLastName());
		model.addAttribute("username", user.getUsername());
		model.addAttribute("email", user.getEmail());
		model.addAttribute("password", user.getPassword());
		model.addAttribute("userId", user.getUserId());
		return "home";
	}
	
	//CHANGE USER DETAILS
	@RequestMapping("/updateUser")
	public String updateUser(Model model, @RequestParam("username") String username, @RequestParam("email") String email, 
								@RequestParam("firstName") String firstName, @RequestParam("middleName") String middleName,
								@RequestParam("lastName") String lastName, @RequestParam("newPass") String newPass, @RequestParam("userId") String userId,
								@RequestParam("oldPass") String oldPass) {
		user = userDao.findById(Integer.parseInt(userId));
		if(firstName.equals("")) {
			firstName = " ";
		}
		if(middleName.equals("")) {
			middleName = " ";
		}
		if(lastName.equals("")) {
			lastName = " ";
		}
		if(!username.equals(user.getUsername())) {
			if(userDao.findByUsername(username) != null) {
				model.addAttribute("error","Username already taken!");
				return goToHome(model, user);
			}
		}
		
		if(!email.equals(user.getEmail())) {
			System.out.println(email);
			System.out.println(user.getEmail());
			if(userDao.findByEmail(email) != null) {
				model.addAttribute("error","Email already taken!");
				return goToHome(model, user);
			}
		}
		
		if(!oldPass.equals("")) {
			if(!BCrypt.checkpw(oldPass, user.getPassword())) {
				model.addAttribute("error","Wrong Password!");
				return goToHome(model, user);
			}
		}
		if(newPass.equals("")) {
			newPass = user.getPassword();
		}else if(!BCrypt.checkpw(newPass, user.getPassword())){
			String salt = BCrypt.gensalt(10);
			String hashed = BCrypt.hashpw(newPass, salt);
			newPass = hashed;
		}
		
	
		int result = userDao.updateUser(firstName, middleName, lastName, username, email, Integer.parseInt(userId), newPass);
		if(result>0) {
			System.out.println("Updated!");
			user = userDao.findById(Integer.parseInt(userId));
		}
		
		return goToHome(model, user);
	}
	
	//SAVE USER MOOD TO DATABASE
	@RequestMapping("/saveMood")
	public String saveMood(Model model, @RequestParam("feeling") String feeling, @RequestParam("user_id") String user_id, @RequestParam String entry) {
		
		String[] ecstatic = new String[]{"Ecstatic", "Enthusiastic", "Loved", "Inspired"};
		String[] happy = new String[]{"Happy", "Positive", "Happy", "Hopeful"};
		String[] ok = new String[]{"OK", "Calm", "Good", "Calm"};
		String[] sad = new String[] {"Sad", "Lonely", "Hopeless", "Sad", "Tired"};
		String[] devastated = new String[] {"Devastated", "Angry", "Upset", "Anxious", "Stressed"};
		String[][] categories = new String[][]{ecstatic, happy, ok, sad, devastated};
		String mood = feeling;
		int flag = 0;
		for(String[] cat: categories) {
			for(String feel: cat) {
				if(feeling.equals(feel)) {
					mood = cat[0];
					flag = 1;
					break;
				}
				if(flag == 1) {
					break;
				}
			}
		}
		int result = userDao.saveMood(user_id, feeling, entry, mood);
		if(result > 0) {
			System.out.println("Success!");
		}
		user = userDao.findById(Integer.parseInt(user_id));
		return goToHome(model, user);
	}
	
	
}
