package services;

import dao.UserDAO;

import model.Adminuser;

import java.util.List;



public class AdminuserService {
    private UserDAO userDAO;

    public AdminuserService()
    {
        userDAO = new UserDAO();
    }
    
    
    
	//method
    public List<Adminuser> fetchAllUsers() throws ClassNotFoundException {
    	
    	
    
        return userDAO.getAllUsers();
    }
    
    
}
