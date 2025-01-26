package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.UserBO;

import java.io.IOException;

@WebServlet("/updateUserStatusServlet")
public class UpdateUserStatusServlet extends HttpServlet {
    UserBO userBO  = (UserBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.USER);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        boolean status = Boolean.parseBoolean(req.getParameter("status"));

        // Update user status in the database
        boolean isUpdated = userBO.updateUserStatus(userId, status);

        if (isUpdated) {
            resp.sendRedirect("allUsers-Servlet?success=User status updated successfully");
        } else {
            resp.sendRedirect("allUsers-Servlet?error=Failed to update user status");
        }
    }
}
