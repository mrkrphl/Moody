package com.code.dao;

import java.sql.Date;
import java.sql.ResultSet;
import com.code.model.Mood;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.code.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public User findByUsername(String username) {
		String sql = "SELECT * FROM users WHERE username = '" + username + "'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<User>(){
			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
					User user = new User();
					user.setUsername(rs.getString("username"));
					user.setFirstName(rs.getString("firstName"));
					user.setMiddleName(rs.getString("middleName"));
					user.setLastName(rs.getString("lastName"));
					user.setPassword(rs.getString("password"));
					user.setUserId(rs.getInt("userId"));
					user.setEmail(rs.getString("email"));
					return user;
				}
				return null;
			}
		});
	}

	@Override
	public int saveUser(User user) {
		String sql = "INSERT INTO users(username, password, email) VALUES('" + user.getUsername() +"', '"
				+ user.getPassword() +"', '"+user.getEmail()+"')";
		System.out.println(sql);
		
		return jdbcTemplate.update(sql);
	}

	@Override
	public int saveMood(String user_id, String feeling, String entry, String category) {
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		boolean saved = findMoodByDate(user_id, date);
		if(saved) {
			deleteMood(user_id, date);
		}
		if (entry.contains("\'")) {
			entry = entry.replace("\'","\\\'");
		}
		String sql = "INSERT INTO moods(mood, date, entry, category, user_id) VALUES('" + feeling +"', '"
				+ date +"', '"+entry+"', '"+category+"', '"+user_id+"')";
		System.out.println(sql);
		return jdbcTemplate.update(sql);
	}

	@Override
	public boolean checkedIn(User user) {
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		String sql = "SELECT id from moods WHERE date = '"+date+"' AND user_id = '" +user.getUserId()+"'";
		System.out.print(sql);
		return jdbcTemplate.query(sql, new ResultSetExtractor<Boolean>() {
			    @Override
			    public Boolean extractData(ResultSet rs) throws SQLException,
			                                                   DataAccessException {
			        if (rs.next()) {
			        	System.out.print(rs.getInt("id"));
			        	return true;
			        }
			        return false;
			    }
			});
	}

	@Override
	public User findById(int userId) {
		String sql = "SELECT * FROM users WHERE userId = '" + userId + "'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<User>(){
			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
					User user = new User();
					user.setUsername(rs.getString("username"));
					user.setFirstName(rs.getString("firstName"));
					user.setMiddleName(rs.getString("middleName"));
					user.setLastName(rs.getString("lastName"));
					user.setPassword(rs.getString("password"));
					user.setUserId(rs.getInt("userId"));
					user.setEmail(rs.getString("email"));
					return user;
				}
				return null;
			}
		});
	}
	
	public List<Mood> listOfMoods(User user){
		String sql = "SELECT * FROM moods WHERE user_id = '" +user.getUserId()+"' ORDER BY date ASC";
		System.out.print(sql);
		return jdbcTemplate.query(sql, new MoodMapper());
	}

	@Override
	public boolean findMoodByDate(String user_id, java.sql.Date date) {
		String sql = "SELECT * FROM moods WHERE user_id = '"+user_id+"' AND date = '"+date+"'";
		
		return jdbcTemplate.query(sql, new ResultSetExtractor<Boolean>(){
			@Override
			public Boolean extractData(ResultSet rs) throws SQLException, DataAccessException{
				if(rs.next()) {
					return true;
				}
				return false;
			}
		});
	}

	@Override
	public int deleteMood(String user_id, Date date) {
		String sql = "DELETE FROM moods WHERE user_id = '"+user_id+"' AND date = '"+date+"'";
		return jdbcTemplate.update(sql);
	}

	@Override
	public User findByEmail(String email) {
		String sql = "SELECT * FROM users WHERE email = '" + email + "'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<User>(){
			@Override
			public User extractData(ResultSet rs) throws SQLException, DataAccessException {
				if(rs.next()) {
					User user = new User();
					user.setUsername(rs.getString("username"));
					user.setFirstName(rs.getString("firstName"));
					user.setMiddleName(rs.getString("middleName"));
					user.setLastName(rs.getString("lastName"));
					user.setPassword(rs.getString("password"));
					user.setUserId(rs.getInt("userId"));
					user.setEmail(rs.getString("email"));
					return user;
				}
				return null;
			}
		});
	}

	@Override
	public int updateUser(String firstName, String middleName, String lastName, String username, String email,
			int userId, String newPass) {
		String sql = "UPDATE users SET firstName = '"+firstName+"', middleName = '"+middleName+"', lastName = '"+lastName+"', "
				+ "username = '"+username+"', email = '"+email+"', password = '"+newPass+"'"
				+ "WHERE userId = '"+userId+"'";
		System.out.println(sql);
		return jdbcTemplate.update(sql);
	}

	@Override
	public int resetPassword(String email, String pass) {
		String sql = "UPDATE users SET password = '"+pass+"' WHERE email = '"+email+"'";
		System.out.println(sql);
		return jdbcTemplate.update(sql);
	}
}
