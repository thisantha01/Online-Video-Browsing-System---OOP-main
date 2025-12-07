package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.AdminDAO;
import model.Admin;

@SuppressWarnings("serial")
@WebServlet("/adminlogincontroller")

public class AdminLoginController extends HttpServlet {
    private AdminDAO adminDAO;

    public void init() 
    {
        adminDAO = new AdminDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String email = request.getParameter("mail");
        String password = request.getParameter("pwd");

        Admin admin = null;
        
		try {
			admin = adminDAO.getAdminByCredentials(email, password);
			
		} 
		
		catch (ClassNotFoundException e)
		{
			
			e.printStackTrace();
		}

        if (admin != null) {
            request.getSession().setAttribute("admin", admin);
            response.sendRedirect("admin.jsp");
            
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("Adminlogin.jsp").forward(request, response);
        }
    }
    
    
    
}