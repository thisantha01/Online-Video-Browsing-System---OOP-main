package servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Video;
import services.UploadMedia;


@WebServlet("/Upload")
@MultipartConfig
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public Upload() {
        super();
            }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String title = request.getParameter("title");
		int profieID = Integer.parseInt(request.getParameter("profieID"));
		
		// Store profileID in session if authentication is successful
        HttpSession session = request.getSession();
        session.setAttribute("profieID", profieID); 

		
		// Get the photo input stream
        Part photoPart = request.getPart("photo");
        byte[] photoBytes = null;
        if (photoPart != null && photoPart.getSize() > 0) {
            InputStream photoStream = photoPart.getInputStream();
            photoBytes = photoStream.readAllBytes();
        }

        // Get the video input stream
        Part videoPart = request.getPart("video");
        byte[] videoBytes = null;
        if (videoPart != null && videoPart.getSize() > 0) {
            InputStream videoStream = videoPart.getInputStream();
            videoBytes = videoStream.readAllBytes();
        }
		
        //create the model object
        Video vi = new Video();
		
        vi.setProfieID(profieID);
        vi.setTitle(title);
        vi.setThumbnail(photoBytes);
        vi.setVideo(videoBytes);
        
        // pass model in servlet
        boolean success = UploadMedia.insertVideo(vi);
        
        if(success) {
        	response.getWriter().println("Upload successful!");
    		RequestDispatcher dis = request.getRequestDispatcher("DisplayVideo");
    		dis.forward(request, response);
        } else {
            response.getWriter().println("Upload failed!");
        }

        
		
		
		doGet(request, response);
	}

}
