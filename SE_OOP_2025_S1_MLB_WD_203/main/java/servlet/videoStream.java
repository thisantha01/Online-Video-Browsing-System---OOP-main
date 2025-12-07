package servlet;

import java.io.IOException;

import java.io.OutputStream;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import utils.DBConnect;

@WebServlet("/videoStream")
public class videoStream extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String type = request.getParameter("type");
        String vidNum = request.getParameter("vid");

        if (type == null || vidNum == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                 "SELECT " + type + " FROM new_videos WHERE vid_num = ?")) {
            
            stmt.setInt(1, Integer.parseInt(vidNum));
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Blob blob = rs.getBlob(type);
                    if (blob != null) {
                        response.setContentType(
                            "thumbnail".equals(type) ? "image/jpeg" : "video/mp4");
                        
                        try (OutputStream out = response.getOutputStream()) {
                            out.write(blob.getBytes(1, (int) blob.length()));
                        }
                        return;
                    }
                }
            }
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
    
    
}