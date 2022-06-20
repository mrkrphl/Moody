package com.code.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.code.model.Mood;

public class MoodMapper implements RowMapper<Mood> {

	@Override
	public Mood mapRow(ResultSet rs, int rowNum) throws SQLException {
		Mood mood = new Mood();
		mood.setId(rs.getInt("id"));
		mood.setMood(rs.getString("mood"));
		mood.setDate(rs.getDate("date"));
		mood.setEntry(rs.getString("entry"));
		mood.setCategory(rs.getString("category"));
		mood.setUserId(rs.getInt("user_id"));
		return mood;
	}

}