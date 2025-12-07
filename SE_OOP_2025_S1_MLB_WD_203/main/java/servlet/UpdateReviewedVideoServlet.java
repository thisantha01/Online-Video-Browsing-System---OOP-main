package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.review;
import services.reviewService;


public class UpdateReviewedVideoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Get parameters from form
            int videoNumber = Integer.parseInt(request.getParameter("videoNumber"));
            String status = request.getParameter("status");
            String issue = request.getParameter("issue");
            
            // Create review object with updated data
            review updatedReview = new review();
            updatedReview.setVideoNumber(videoNumber);
            updatedReview.setVidStatus(status);
            updatedReview.setVideoIssue(issue);
            
            // Update in database
            reviewService service = new reviewService();
            boolean updated = service.updateReviewedVideo(updatedReview);
            
            if (updated) {
                request.setAttribute("message", "Video #" + videoNumber + " updated successfully");
                // Re-fetch the updated record
                request.setAttribute("review", service.getOne(updatedReview));
            } else {
                request.setAttribute("error", "Failed to update video #" + videoNumber);
            }
            
            // Forward back to JSP
            request.getRequestDispatcher("showReviewdVideos.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid video number format");
            request.getRequestDispatcher("showReviewdVideos.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error updating video: " + e.getMessage());
            request.getRequestDispatcher("showReviewdVideos.jsp").forward(request, response);
        }
    }
}