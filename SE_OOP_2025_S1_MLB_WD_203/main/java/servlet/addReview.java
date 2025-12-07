package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.review;
import services.reviewService;


@WebServlet("/addReview")
public class addReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addReview() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		review rev = new review();
		//rev.setVideoNumber(Integer.parseInt(request.getParameter("videoNumber")));
		
		String videoNumStr = request.getParameter("videoNumber");

		if (videoNumStr == null || videoNumStr.trim().isEmpty()) {
		    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Video number is missing.");
		    return;
		}

		rev.setVideoNumber(Integer.parseInt(videoNumStr));

	
		
		reviewService service = new reviewService();
		//service.reviewvideo(rev);
		
		review revi = service.getOne(rev);
	
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("showReviewdVideos.jsp");
		request.setAttribute("review", revi);
		
		dispatcher.forward(request, response);
	}

}

