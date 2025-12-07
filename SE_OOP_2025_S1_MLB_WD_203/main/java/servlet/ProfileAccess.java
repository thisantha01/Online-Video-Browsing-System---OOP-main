package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Creator;
import services.CreatorService;


@WebServlet("/ProfileAccess")
public class ProfileAccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProfileAccess() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Creator cre = new Creator();
		
		Integer profieID = Integer.parseInt(request.getParameter("profile_id")) ;
		
		cre.setProfieID(profieID);
		cre.setProfile_name(request.getParameter("profile_name"));
		
		// Store profileID in session if authentication is successful
        HttpSession session = request.getSession();
        session.setAttribute("profieID", String.valueOf(profieID));
		
		CreatorService cs = new CreatorService();
		boolean status = cs.validate(cre);
		
		if(status) {
			Creator logincreator = cs.getone(cre);
			request.setAttribute("creator",logincreator);
			RequestDispatcher dispature = request.getRequestDispatcher("Profile.jsp");
			dispature.forward(request, response);
			request.setAttribute("creator",logincreator);
		}else {
			RequestDispatcher dispature = request.getRequestDispatcher("ProfileAccess.jsp");
			dispature.forward(request, response);
		}
		
		//doGet(request, response);
	}

}
