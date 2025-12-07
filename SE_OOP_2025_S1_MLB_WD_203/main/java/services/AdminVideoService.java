package services;

import dao.VideoDAO;
import model.AdminVideo;

import java.util.List;

public class AdminVideoService {
    private VideoDAO videoDAO;

    public AdminVideoService() {
    	
        this.videoDAO = new VideoDAO();
    }

    //  fetch all videos from DAO
    public List<AdminVideo> fetchAllVideos() throws ClassNotFoundException {
    	
        return videoDAO.getAllVideos();
    }
}
