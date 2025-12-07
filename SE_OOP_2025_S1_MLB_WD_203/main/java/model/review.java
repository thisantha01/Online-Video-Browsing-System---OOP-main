 package model;


import java.sql.Blob;

public class review {

    private int videoNumber;
    private String title;
   private Blob thumbnail;
   private Blob video;
    private String vidStatus;
    private String videoIssue;
    private String thumbnailBase64;
    private String videoBase64;
   //private InputStream thumbnail;
   //private InputStream video;

    

    public review() {
        // Default constructor
    }

    // Getters and Setters

    public int getVideoNumber() {
        return videoNumber;
    }

    public void setVideoNumber(int videoNumber) {
        this.videoNumber = videoNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Blob getThumbnail() {
       return thumbnail;
  }

    public void setThumbnail(Blob thumbnail) {
        this.thumbnail = thumbnail;
   }

    public Blob getVideo() {
      return video;
    }

    public void setVideo(Blob video) {
       this.video = video;
    }

    public String getVidStatus() {
        return vidStatus;
    }

    public void setVidStatus(String vidStatus) {
        this.vidStatus = vidStatus;
    }

    public String getVideoIssue() {
        return videoIssue;
    }

    public void setVideoIssue(String videoIssue) {
        this.videoIssue = videoIssue;
    }
    
    public String getThumbnailBase64() {
        return thumbnailBase64;
    }

    public void setThumbnailBase64(String thumbnailBase64) {
        this.thumbnailBase64 = thumbnailBase64;
    }

    public String getVideoBase64() {
        return videoBase64;
    }

    public void setVideoBase64(String videoBase64) {
        this.videoBase64 = videoBase64;
    }
    
   /*public InputStream getThumbnail() {
      return thumbnail;
    }

    public void setThumbnail(InputStream thumbnail) {
       this.thumbnail = thumbnail;
    }

    public InputStream getVideo() {
      return video;
    }

   public void setVideo(InputStream video) {
       this.video = video;
    }*/
   
    
}