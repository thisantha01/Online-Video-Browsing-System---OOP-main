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



@WebServlet("/homeUser")
public class homeUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public homeUser() {
        super();
        // TODO Auto-generated constructor stub
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		user usr = new user();
		usr.setEmail(request.getParameter("email"));
		usr.setPassword(request.getParameter("password"));
		
		userServices service = new userServices();
		boolean status = service.validation(usr);
		
		if(status) {
			user logineduser = service.getone(usr);
			request.setAttribute("userget", logineduser);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
		//	request.setAttribute("msg", "Login succeeded!"); //java script alert box message(login success)
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("Userupdate.jsp");
			request.setAttribute("msg", "Login failed – please try again."); //java script alert box message(login failed)
			dispatcher.forward(request, response);
		}
		
	
		doGet(request, response);
		
	}

}
