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



@WebServlet("/addUser")
public class addUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public addUser() {
        super();
   
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		user usr = new user();
		
		usr.setUsername(request.getParameter("username"));
		usr.setEmail(request.getParameter("email"));
		usr.setPassword(request.getParameter("password"));
		usr.setConfirm(request.getParameter("confirm"));
		usr.setPhone(request.getParameter("phone"));
		usr.setStatus(request.getParameter("status"));
		
	//	Part filePart = request.getPart("photo");
    //    InputStream photoStream = filePart.getInputStream(); // Binary data
		
		userServices service = new userServices();
		try {
			service.regUser(usr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");

		
		dispatcher.forward(request, response);
	}

}
