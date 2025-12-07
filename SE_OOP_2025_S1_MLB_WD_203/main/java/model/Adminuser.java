package model;

public class Adminuser {
	
	
    private int id;
    private String email;
    private String username;
    private String password;
    private String confirm;
    private String phone;
    private String status;

    // Getters and Setters
    public int getId()
    { 
    	
    	return id; 
    	
    }
    
    
    public void setId(int id) 
    {
    	
    	this.id = id; 
    	
    }

    public String getEmail() 
    { 
    	
    	return email; 
    	
    }
    
    public void setEmail(String email) 
    {
    	
    	this.email = email;
    	
    }

    public String getUsername() 
    {
    	return username;
    	
    	
    }
    
    public void setUsername(String username) 
    { 
    	
    	this.username = username;
    	
    }

    public String getPassword() 
    {
    	return password; 
    	
    }
    
    public void setPassword(String password) 
    {
    	this.password = password; 
    	
    }

    public String getConfirm() 
    {
    	return confirm; 
    	
    	
    }
    
    
    public void setConfirm(String confirm) 
    {
    	
    	this.confirm = confirm;
    	
    }

    public String getPhone() 
    { 
    	return phone; 
    	
    }
    
    public void setPhone(String phone) 
    {
    	
    	this.phone = phone;
    	
    }

    public String getStatus() 
    {
    	return status;
    	
    }
    
    public void setStatus(String status) 
    { 
    	this.status = status; 
    	
    }
    
}
