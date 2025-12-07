package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import model.Creator;
import services.CreatorService;


@WebServlet("/ProfileCreate")
public class ProfileCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProfileCreate() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Creator ctr = new Creator();
		
		ctr.setCreator_name(request.getParameter("creator_name"));
		ctr.setProfile_name(request.getParameter("profile_name"));
		ctr.setEmail(request.getParameter("email"));
		ctr.setBio(request.getParameter("bio"));
		ctr.setGender(request.getParameter("gender"));
		
		CreatorService ser = new CreatorService();
		ser.regCreator(ctr);
		
		RequestDispatcher dis = request.getRequestDispatcher("AfterCreateProfileintoProfile");
		
		dis.forward(request, response);
		
		
	}

}
