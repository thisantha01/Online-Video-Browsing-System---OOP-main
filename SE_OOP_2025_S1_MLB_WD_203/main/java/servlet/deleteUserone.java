package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user;
import services.userServices;



@WebServlet("/deleteUserone")
public class deleteUserone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
    public deleteUserone() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		user usr =new user();
		
		usr.setEmail(request.getParameter("email"));
		usr.setId(Integer.parseInt(request.getParameter("id")));
		
		userServices service = new userServices();
		service.deleteUserone(usr);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
		
		
		dispatcher.forward(request, response);
	}

}
