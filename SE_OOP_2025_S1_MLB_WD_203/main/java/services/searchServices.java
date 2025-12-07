package services;


import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import model.Film;
import utils.DBConnect;

public class searchServices {
	

	
	public ArrayList<Film> getAllfilm(Film f1){
	    ArrayList<Film> listfilm = new ArrayList<>();
	    try {
	        String query = "SELECT * FROM film WHERE FilmName LIKE ?";
	        PreparedStatement ps = DBConnect.getConnection().prepareStatement(query);
	        ps.setString(1, f1.getFilmname() + "%");
	        ResultSet rs = ps.executeQuery();
	    	
	    	/*String query = "SELECT * FROM film"; // no WHERE clause
	    	PreparedStatement ps = DBconnect.getconnection().prepareStatement(query);
	    	ResultSet rs = ps.executeQuery();*/


	      

	        while(rs.next()) {
	            Film f2 = new Film(); // Always create a new object per row
	            f2.setId(rs.getInt("FilmId"));
	            f2.setFilmname(rs.getString("FilmName"));
	            f2.setDescription(rs.getString("FilmDescription"));
	            f2.setThumbnail(rs.getBytes("Thumbnail"));
	            listfilm.add(f2);
	        }

	    } catch (Exception e) {
	        e.printStackTrace(); // else the error
	        return null;
	    }

	    return listfilm;
	}

		
		
		
	}

	
	
	
	


