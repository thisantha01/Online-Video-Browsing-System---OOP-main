package model;

import java.util.Base64;

public class Film {
	
	//film attributes
	private int id;
	private String filmname;
	private String description;
	private byte[] thumbnail;
	
	
	//default constructor
	public Film() {
		
	}

	//overload constructor
	public Film(int id, String filmname, String description, byte[] thumbnail) {
		super();
		this.id = id;
		this.filmname = filmname;
		this.description = description;
		this.thumbnail = thumbnail;
	}

	
	
	//getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFilmname() {
		return filmname;
	}

	public void setFilmname(String filmname) {
		this.filmname = filmname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(byte[] thumbnail) {
		this.thumbnail = thumbnail;
	}
	
    public String getBase64Thumbnail() {
        if (thumbnail != null && thumbnail.length > 0) {
            return Base64.getEncoder().encodeToString(thumbnail);
        }
        return "";
    }
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
}


