package model;

public class user {
	private int id;
	private String username;
	private String email;
	private String password;
	private String confirm;
	private String phone;
	private byte[] photo;
	private String status;
	
	

	//Default constructor
	
	public user() {
		
	}
	
	//Overload constructor
	public user(int id, String username, String email, String password, String confirm, String phone, byte[] photo, String status) {
		
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.confirm = confirm;
		this.phone = phone;
		this.photo = photo;
		this.status = status;
	}




	//getters and setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	

}
