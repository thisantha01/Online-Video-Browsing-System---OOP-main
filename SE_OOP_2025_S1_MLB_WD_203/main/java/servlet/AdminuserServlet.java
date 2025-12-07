package servlet;

import model.Adminuser;
import services.AdminuserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/userList")



public class AdminuserServlet extends HttpServlet {
    private AdminuserService userService;
    
    
    

    @Override
    public void init() throws ServletException {
        userService = new AdminuserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Adminuser> users = null;
        
		try {
			users = userService.fetchAllUsers();
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		
        request.setAttribute("users", users);
        request.getRequestDispatcher("user.jsp").forward(request, response);
        
        
    }
    
    

    
}
