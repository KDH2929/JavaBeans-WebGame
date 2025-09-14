package com.Donghwan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.Donghwan.model.User;
import com.Donghwan.util.DbUtil;		// 아래 기능들을 활용하여 기능구현

public class UserDao {

	private Connection connection;

	public UserDao() {
		connection = DbUtil.getConnection();
	}
	
	
	
	public boolean check(String id, String password)
	{
		List<User> user=getAllUsers();
		
		for(int i=0;i<user.size();i++)
		{
			String x=user.get(i).getId();
			String y=user.get(i).getPassword();
			if(id.equalsIgnoreCase(x) && password.equalsIgnoreCase(y))
			{
				return true;
			}
		}
		
		return false;
	}
	
	public String find_name(String id)
	{
		List<User> user=getAllUsers();
		
		for(int i=0;i<user.size();i++)
		{
			String x=user.get(i).getId();
			String name=user.get(i).getName();
			
			if(id.equalsIgnoreCase(x))
			{
				return name;
			}
		}
		
		return "-1";
	}
	
	public void addScore(String id, int score)
	{
			try {
			String query="update users set score=" + "'" + score + "'"+"where id=" +"'" + id + "'" ;
			connection.createStatement().executeUpdate(query);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addUser(User user) {
		
		try {
			
			PreparedStatement preparedStatement = connection
					.prepareStatement("insert into users(id,password,name,email,date,score) values (?, ?, ?, ?, ?, ?)");
			// Parameters start with 1
			preparedStatement.setString(1, user.getId());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getName());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getDate());
			preparedStatement.setInt(6, 0);

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteUser(String userId) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from users where id=?");
			// Parameters start with 1
			preparedStatement.setString(1, userId);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void modify(User user) {
		try {
			String query="update users set password=?, name=?, email=?, date=?, score=?"+" where id=?";
	PreparedStatement preparedStatement = connection.prepareStatement(query);
			// Parameters start with 1
			preparedStatement.setString(1, user.getPassword());
			preparedStatement.setString(2, user.getName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getDate());
			preparedStatement.setInt(5, user.getScore());
			preparedStatement.setString(6, user.getId());
			

			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	

	
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<User>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from users");
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getString("id"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setDate(rs.getString("date"));
				user.setScore(rs.getInt("score"));
				users.add(user);		// 배열에 삽입 // 유저들의 목록
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}
	
}