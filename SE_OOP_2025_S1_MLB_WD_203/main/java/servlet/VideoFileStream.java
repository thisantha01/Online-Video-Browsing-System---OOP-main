package servlet;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Video;
import services.VideoServise;


@WebServlet("/VideoFileStream")
public class VideoFileStream extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public VideoFileStream() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int videoID = Integer.parseInt(request.getParameter("videoID"));
        VideoServise videoService = new VideoServise();
        Video video = videoService.getVideoByID(videoID);

        if (video != null && video.getVideo() != null) {
            response.setContentType("video/mp4");
            OutputStream out = response.getOutputStream();
            out.write(video.getVideo());
            out.flush();
            out.close();
        }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
