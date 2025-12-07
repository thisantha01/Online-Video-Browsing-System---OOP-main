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


@WebServlet("/AllThumnailInHome")
public class AllThumnailInHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AllThumnailInHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int videoID = Integer.parseInt(request.getParameter("videoID"));
		VideoServise vidservice = new VideoServise();
		Video video = vidservice.getVideoByID(videoID);
		
		
		if(video != null && video.getThumbnail() != null) {
			response.setContentType("image/jpeg");
			OutputStream out = response.getOutputStream();
			out.write(video.getThumbnail());
			out.close();
		}
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
