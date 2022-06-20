package com.code.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.code.model.User;
import com.code.model.Mood;
@Component
public interface UserDao {
	public User findByUsername(String username);
	
	public User findByEmail(String email);
	
	public User findById(int userId);
	
	public int saveUser(User user);

	public int saveMood(String user_id, String feeling, String entry, String category);

	public boolean checkedIn(User user);
	
	public List<Mood> listOfMoods(User user);
	
	public boolean findMoodByDate(String user_id, java.sql.Date date);
	
	public int deleteMood(String user_id, java.sql.Date date);

	public int updateUser(String firstName, String middleName, String lastName, String username, String email, int userId, String newPass);

	public int resetPassword(String email, String pass);

}
