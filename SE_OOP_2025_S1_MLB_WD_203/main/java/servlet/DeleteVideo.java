package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.UploadMedia;


@WebServlet("/DeleteVideo")
public class DeleteVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteVideo() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int videoID = Integer.parseInt(request.getParameter("videoID"));
			boolean success = UploadMedia.deleteVideobyID(videoID);
			
			if(success) {
				response.sendRedirect("DisplayVideo");
			}else {
				
				 request.setAttribute("errorMessage", "Failed to delete video.");
				request.getRequestDispatcher("DisplayVideo").forward(request, response);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		doGet(request, response);
	}

}
