package servlet;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.modprofile;



public class addPofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public addPofile() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		modprofile prof = new modprofile();	
		prof.setModid(Integer.parseInt(request.getParameter("modid")));
		prof.setFullname(request.getParameter("fullname"));
		prof.setUsername(request.getParameter("username"));
		prof.setEmail(request.getParameter("email"));
		prof.setPassword(request.getParameter("passowrd"));
		doGet(request, response);
	}

}
