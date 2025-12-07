package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Video;
import services.VideoServise;


@WebServlet("/PlayVideoServlet")
public class PlayVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PlayVideoServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int videoID = Integer.parseInt(request.getParameter("videoID"));
        VideoServise videoService = new VideoServise();
        Video video = videoService.getVideoByID(videoID);

        request.setAttribute("video", video);
        RequestDispatcher dispatcher = request.getRequestDispatcher("playvideo.jsp");
        dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
