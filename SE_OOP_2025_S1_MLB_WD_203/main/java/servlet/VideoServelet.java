package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Video;
import services.VideoServise;


@WebServlet("/VideoServelet")
public class VideoServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public VideoServelet() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// create object in service class
		VideoServise videoservise = new VideoServise();
		List<Video> videoList = videoservise.getAllVideos();
		request.setAttribute("videoList", videoList);
		RequestDispatcher dis = request.getRequestDispatcher("Home.jsp");
		dis.forward(request, response);
		
		
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
