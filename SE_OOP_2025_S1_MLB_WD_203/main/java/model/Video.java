package model;

public class Video {

	
	private int profieID ; 
	private int videoID ;
	private String title ;
	private byte[] thumbnail;
	private byte[] video ;
	
	
	
	
	public Video() {
		
	}

	public Video(int profieID, int videoID, String title, byte[] thumbnail, byte[] video) {
		super();
		this.profieID = profieID;
		this.videoID = videoID;
		this.title = title;
		this.thumbnail = thumbnail;
		this.video = video;
	}

	public int getProfieID() {
		return profieID;
	}

	public void setProfieID(int profieID) {
		this.profieID = profieID;
	}

	public int getVideoID() {
		return videoID;
	}

	public void setVideoID(int videoID) {
		this.videoID = videoID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public byte[] getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(byte[] thumbnail) {
		this.thumbnail = thumbnail;
	}

	public byte[] getVideo() {
		return video;
	}

	public void setVideo(byte[] video) {
		this.video = video;
	}
	
	
	
}
