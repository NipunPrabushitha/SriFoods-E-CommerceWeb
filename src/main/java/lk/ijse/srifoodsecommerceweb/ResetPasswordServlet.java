package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.UserBO;

import java.io.IOException;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    UserBO userBO  = (UserBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.USER);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if (password.equals(confirmPassword)) {
           userBO.resetPassword(email,password);
            System.out.println("Password updated successfully!");
            response.sendRedirect("customerDashboard.jsp");
        } else {
            // Passwords do not match
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        }
    }
}
