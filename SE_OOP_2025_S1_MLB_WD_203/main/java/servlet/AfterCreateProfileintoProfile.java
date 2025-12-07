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


@WebServlet("/AfterCreateProfileintoProfile")
public class AfterCreateProfileintoProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AfterCreateProfileintoProfile() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		Creator ctr = new Creator();
		
		/*ctr.setCreator_name(request.getParameter("creator_name"));
		ctr.setProfile_name(request.getParameter("profile_name"));
		ctr.setBio(request.getParameter("bio"));
		ctr.setGender(request.getParameter("gender"));*/
		ctr.setEmail(request.getParameter("email"));
		
		
		CreatorService cs = new  CreatorService();
		cs.AfterCreateProfileintoProfile(ctr);
		
		RequestDispatcher dis = request.getRequestDispatcher("Profile.jsp");
		request.setAttribute("creator",ctr);
		
		dis.forward(request, response);
	}

}
