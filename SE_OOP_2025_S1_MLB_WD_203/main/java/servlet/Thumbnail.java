package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.UploadMedia;


@WebServlet("/Thumbnail")
public class Thumbnail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Thumbnail() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int videoID = Integer.parseInt(request.getParameter("videoID"));
		
		try {
			byte[] thumnail = UploadMedia.getThumbnailByVideoID(videoID);
			
			if (thumnail != null && thumnail.length > 0) {
                response.setContentType("image/jpeg");
                response.setContentLength(thumnail.length);
                response.getOutputStream().write(thumnail);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Thumbnail not found");
            }
			
		} catch (NumberFormatException  e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid videoID");
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
