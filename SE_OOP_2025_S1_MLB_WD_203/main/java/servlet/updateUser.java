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



@WebServlet("/updateUser")
public class updateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public updateUser() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int userId = Integer.parseInt("id");
		
		user usr = new user();
		
		usr.setEmail(request.getParameter("email"));
		usr.setUsername(request.getParameter("username"));
		usr.setPassword(request.getParameter("password"));
		usr.setConfirm(request.getParameter("confirm"));
		usr.setPhone(request.getParameter("phone"));
		usr.setStatus(request.getParameter("status"));
		
		
		//add photo
		
		//model object
		userServices service = new userServices();
		
		service.updateUser(usr);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Userupdate.jsp");
		
		
		
		
		dispatcher.forward(request, response);
	}

}
