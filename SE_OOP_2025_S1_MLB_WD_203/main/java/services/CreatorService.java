package services;

import java.sql.ResultSet;
import java.sql.Statement;

import model.Creator;
import utils.DBConnect;

public class CreatorService {

	
	public void regCreator(Creator cre) {
		
		try {
			
			String query = "INSERT INTO profile VALUES (NULL,'"+cre.getCreator_name()+"','"+cre.getProfile_name()+"','"+cre.getEmail()+"','"+cre.getBio()+"','"+cre.getGender()+"')";
			Statement stmt = DBConnect.getConnection().createStatement();
			stmt.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean validate(Creator cre) {
		
		try {
			
			String query = "SELECT *FROM profile WHERE profile_id = '"+cre.getProfieID()+"' AND profile_name = '"+cre.getProfile_name()+"' ";
			Statement stmt = DBConnect.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				
				return true ;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false ;
		
	}
	
	public Creator getone(Creator cre) {
		
		try {
			
			String query = "SELECT *FROM profile WHERE profile_id = '"+cre.getProfieID()+"' AND profile_name = '"+cre.getProfile_name()+"' ";
			Statement stmt = DBConnect.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			
			
			if(rs.next()) {
				cre.setProfieID(rs.getInt("profile_id"));
				cre.setCreator_name(rs.getString("creator_name"));
				cre.setProfile_name(rs.getString("profile_name"));
				cre.setEmail(rs.getString("email"));
				cre.setBio(rs.getString("bio"));
				cre.setGender(rs.getString("gender"));
				return cre ;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null ;
		
	}
	
	
	public void UpdateProfile(Creator cre) {
		
		try {
			
			String query = "UPDATE profile SET creator_name = '"+cre.getCreator_name()+"' , profile_name = '"+cre.getProfile_name()+"' ,"
							+ " email = '"+cre.getEmail()+"' , bio = '"+cre.getBio()+"' , gender = '"+cre.getGender()+"' WHERE  email = '"+cre.getEmail()+"' ; ";
			
			Statement stmt = DBConnect.getConnection().createStatement();
			stmt.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public Creator AfterCreateProfileintoProfile(Creator cre) {
		
		try {
			
			String query = "SELECT *FROM profile WHERE email = '"+cre.getEmail()+"' ";
			Statement stmt = DBConnect.getConnection().createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			
			
			if(rs.next()) {
				cre.setProfieID(rs.getInt("profile_id"));
				cre.setCreator_name(rs.getString("creator_name"));
				cre.setProfile_name(rs.getString("profile_name"));
				cre.setEmail(rs.getString("email"));
				cre.setBio(rs.getString("bio"));
				cre.setGender(rs.getString("gender"));
				return cre ;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null ;
		
	}

	public void deleteProfile(Creator cre) {
		
		try {
			
			String query = "DELETE FROM profile WHERE profile_id = '"+cre.getProfieID()+"'";
			Statement stmt = DBConnect.getConnection().createStatement();
			stmt.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
