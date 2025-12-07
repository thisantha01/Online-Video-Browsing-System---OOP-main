package servlet;



import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Video;
import services.UploadMedia;


@WebServlet("/DisplayVideo")
public class DisplayVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DisplayVideo() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		Integer profieID = (Integer) session.getAttribute("profieID");
		
		
		
		
	    if (profieID == null) {
	        request.setAttribute("errorMessage", "Profile ID is missing or invalid.");	        
	        return;
	    }
		
		List<Video> videoList = UploadMedia.getVideoByProfileID(profieID);
		request.setAttribute("videoList", videoList);
		RequestDispatcher dis = request.getRequestDispatcher("Video.jsp");
		dis.forward(request, response);
		 
		
	}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
