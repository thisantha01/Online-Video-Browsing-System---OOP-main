package model;

public class Feedback 
{
	
	
    private int id;
    private String username;
    private String email;
    private String message;
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

    
    public String getUsername()
    {
        return username;
    }
    

    public void setUsername(String username) 
    {
        this.username = username;
    }
    

    public String getEmail() 
    {
        return email;
    }

    
    public void setEmail(String email) 
    {
        this.email = email;
    }

    
    public String getMessage() 
    {
        return message;
    }
    

    public void setMessage(String message) 
    {
        this.message = message;
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
