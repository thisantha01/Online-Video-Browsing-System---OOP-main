package model;




public class AdminVideo {
	
	
    private int id;
    private String title;
    private String uploader;
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

    
    public String getTitle()
    {
        return title;
    }

    
    public void setTitle(String title) 
    {
        this.title = title;
    }

    
    public String getUploader()
    {
        return uploader;
    }
    

    public void setUploader(String uploader) 
    {
        this.uploader = uploader;
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
