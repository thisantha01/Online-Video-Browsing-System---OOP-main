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


public class RetrieveVideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            String videoNumStr = request.getParameter("videoNumber");
            if (videoNumStr == null || videoNumStr.trim().isEmpty()) {
                request.setAttribute("error", "Please enter a video number");
                forwardToJSP(request, response);
                return;
            }

            int videoNumber = Integer.parseInt(videoNumStr);
            reviewService service = new reviewService();
            review rev = new review();
            rev.setVideoNumber(videoNumber);

            // Retrieve from new_videos table
            review videoData = service.getVideoFromNewVideos(rev);
            
            if (videoData == null) {
                request.setAttribute("error", "Video not found in new_videos table");
            } else {
                request.setAttribute("review1", videoData);
            }

            forwardToJSP(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid video number format");
            forwardToJSP(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving video");
            forwardToJSP(request, response);
        }
    }

    private void forwardToJSP(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("review.jsp");
        dispatcher.forward(request, response);
    }
}