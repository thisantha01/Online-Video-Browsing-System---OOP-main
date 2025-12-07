package model;

public class Creator {

	private int profieID ;
	private String creator_name ;
	private String profile_name ;
	private String email ;
	private String bio ;
	private String gender ;
	
	// constructor
	public Creator() {
		
	}
	
	/*public Creator(String creator_name, String profile_name, String email, String bio, String gender) {
		
		this.creator_name = creator_name;
		this.profile_name = profile_name;
		this.email = email;
		this.bio = bio;
		this.gender = gender;
	}*/ 

	// all getters and setters
	
	public int getProfieID() {
		return profieID;
	}

	public void setProfieID(int profieID) {
		this.profieID = profieID;
	}

	public String getCreator_name() {
		return creator_name;
	}


	public void setCreator_name(String creator_name) {
		this.creator_name = creator_name;
	}


	public String getProfile_name() {
		return profile_name;
	}


	public void setProfile_name(String profile_name) {
		this.profile_name = profile_name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getBio() {
		return bio;
	}


	public void setBio(String bio) {
		this.bio = bio;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
	
}
