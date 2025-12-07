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



@WebServlet("/DeleteProfile")
public class DeleteProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteProfile() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Creator cre = new Creator() ;
		
		cre.setProfieID(Integer.parseInt(request.getParameter("profieID")));
		
		CreatorService cs = new CreatorService();
		cs.deleteProfile(cre);
		
		RequestDispatcher dis = request.getRequestDispatcher("ProfileAccess.jsp");
		
		dis.forward(request, response);
	}

}
