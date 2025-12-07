package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.modprofile;
import model.modprofile;
import services.profileService;


public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        modprofile prof = new modprofile();
        prof.setModid(Integer.parseInt(request.getParameter("modid")));
        prof.setFullname(request.getParameter("fullname"));
        prof.setUsername(request.getParameter("username"));
        prof.setEmail(request.getParameter("email"));
        prof.setPassword(request.getParameter("password"));
        
        profileService service = new profileService();
        boolean isRegistered = service.registerModerator(prof);
        
        if(isRegistered) {
            response.sendRedirect("index.jsp?registration=success");
        } else {
            response.sendRedirect("register.jsp?error=id_exists");
        }
    }
}