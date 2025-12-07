package servlet;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.modprofile;

import services.profileService;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int modid = Integer.parseInt(request.getParameter("modid"));
            String password = request.getParameter("password");
            
            profileService service = new profileService();
            modprofile prof = service.loginModerator(modid, password);
            
            if(prof != null) {
                HttpSession session = request.getSession();
                session.setAttribute("moderator", prof);
                response.sendRedirect("review.jsp");
            } else {
                response.sendRedirect("index.jsp?error=invalid");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("index.jsp?error=invalid");
        }
    }
}