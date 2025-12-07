package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;

import services.searchServices;



@WebServlet("/searchVideo")
public class searchVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	
    public searchVideo() {
        super();
       
    }

	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		Film f1 = new Film();
		f1.setFilmname(request.getParameter("search"));
		
		response.getWriter().println("Searching for: " + f1.getFilmname());


		searchServices service = new searchServices();
		//service.getAllfilm(f1);
		ArrayList<Film> listfilm =service.getAllfilm(f1);
		
		if (listfilm == null || listfilm.isEmpty()) {
			response.getWriter().println("Search unsuccessful!");
		} else {
			response.getWriter().println("Search successful!");
		}

		


		
		
		
		request.setAttribute("listfilm", listfilm);
		

			RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
		
			dispatcher.forward(request, response);
	}

}
