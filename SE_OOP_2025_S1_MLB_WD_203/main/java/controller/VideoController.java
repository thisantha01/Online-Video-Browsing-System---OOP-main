package controller;

import services.AdminVideoService;
import model.AdminVideo;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/videos")


public class VideoController extends HttpServlet {
    private AdminVideoService videoService;

    @Override
    public void init() {
    	
    	videoService  = new AdminVideoService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	// Fetch all videos
        List<AdminVideo> videos = null;
        
		try {
			
			videos = videoService.fetchAllVideos();
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
        
        // Set the data 
        request.setAttribute("videos", videos);
        
     
        RequestDispatcher dispatcher = request.getRequestDispatcher("videomanagment.jsp");
        dispatcher.forward(request, response);
    }
    
    
}
