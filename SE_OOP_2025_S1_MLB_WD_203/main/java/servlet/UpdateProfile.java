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



@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UpdateProfile() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Creator cre = new Creator();
		
		cre.setCreator_name(request.getParameter("creator_name"));
		cre.setProfile_name(request.getParameter("profile_name"));
		cre.setProfieID(Integer.parseInt(request.getParameter("profieID")) );
		cre.setEmail(request.getParameter("email"));
		cre.setBio(request.getParameter("bio"));
		cre.setGender(request.getParameter("gender"));
		
		CreatorService service = new CreatorService();
		service.UpdateProfile(cre);
		
		RequestDispatcher dis = request.getRequestDispatcher("AfterCreateProfileintoProfile");
		dis.forward(request, response);
	}

}
