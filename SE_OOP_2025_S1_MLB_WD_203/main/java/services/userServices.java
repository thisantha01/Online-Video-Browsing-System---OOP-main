package services;

import java.sql.Statement;
import model.user;
import utils.DBConnect;
import java.sql.Connection;
import java.sql.ResultSet;

public class userServices {

	public void regUser(user usr) {
		try {

			// try insert values to table
			String query = "insert into user (email, username, password, confirm, phone, status) values ('" + usr.getEmail()
					+ "', '" + usr.getUsername() + "', '" + usr.getPassword() + "', '" + usr.getConfirm() + "','"
					+ usr.getPhone() + "','"+ usr.getStatus() + "')";

			// create connection
			Connection con = DBConnect.getConnection();

			// Create and execute statement
			Statement statement = con.createStatement();
			statement.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace(); // execute error
		}
	}

	///////// user login validation
	public boolean validation(user usr) {

		try {

			String query = "select * from user where email='" + usr.getEmail() + "'and password='" + usr.getPassword()
					+ "'";

			Statement statement = DBConnect.getConnection().createStatement();

			ResultSet rs = statement.executeQuery(query);

			if (rs.next()) {
				return true;
			}

		} catch (Exception e) {

			e.printStackTrace(); // validate error
		}

		return false;

	}

	///////// get user details (read)
	public user getone(user usr) {

		try {

			String query = "select * from user where email='" + usr.getEmail() + "'and password='" + usr.getPassword()
					+ "'";

			Statement statement = DBConnect.getConnection().createStatement();

			ResultSet rs = statement.executeQuery(query);

			if (rs.next()) {

				usr.setId(rs.getInt("id"));
				usr.setUsername(rs.getString("username"));
				usr.setEmail(rs.getString("email"));
				usr.setPassword(rs.getString("password"));
				usr.setPhone(rs.getString("phone"));
				usr.setStatus(rs.getString("status"));

				return usr;
			}

		} catch (Exception e) {

			e.printStackTrace(); // validate error
		}

		return null;

	}

	///// update method

	public void updateUser(user user) {
		try {

			String query = "UPDATE user SET email ='" + user.getEmail() + "', username ='" + user.getUsername()
					+ "', password ='" + user.getPassword() + "', confirm ='" + user.getPassword() + "', phone ='"
					+ user.getPhone() + "', status = '"+ user.getStatus()+"' WHERE email ='" + user.getEmail() + "'";

			// create connection
			Connection con = DBConnect.getConnection();

			// Create and execute statement
			Statement statement = con.createStatement();
			statement.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace();

		}

	}
	
	///delete user
	///
	public void deleteUserone(user usr) {
		
		try {
			
			String query = "delete from user where email='" + usr.getEmail() +"' and id='" + usr.getId()+ "'";
			
			// create connection
			Connection con = DBConnect.getConnection();

			// Create and execute statement
			Statement statement = con.createStatement();
			statement.executeUpdate(query);
			
			
		} catch (Exception e) {


			
		}
		
	}
	


}
