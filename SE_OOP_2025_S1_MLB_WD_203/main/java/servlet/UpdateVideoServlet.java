package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.review;
import services.reviewService;

@WebServlet("/UpdateVideoServlet")
public class UpdateVideoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int videoNumber = Integer.parseInt(request.getParameter("videoNumber"));
            String status = request.getParameter("status");
            String issue = request.getParameter("issue");
            
            reviewService service = new reviewService();
            review rev = new review();
            rev.setVideoNumber(videoNumber);
            
            // Get original video data from new_videos
            review originalData = service.getVideoFromNewVideos(rev);
            
            if (originalData != null) {
                originalData.setVidStatus(status);
                originalData.setVideoIssue(issue);
                
                // Save to uploaded_videos
                service.saveToUploadedVideos(originalData);
                
                // Set success attributes
                request.setAttribute("review1", originalData);
                request.setAttribute("message", "Video updated successfully");
            } else {
                request.setAttribute("error", "Original video data not found");
            }
            
            request.getRequestDispatcher("review.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error updating video: " + e.getMessage());
            request.getRequestDispatcher("review.jsp").forward(request, response);
        }
    }
}