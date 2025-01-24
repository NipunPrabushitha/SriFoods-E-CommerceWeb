package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.UserBO;

import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HelloServlet{
    UserBO userBO  = (UserBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.USER);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        boolean isExist = userBO.cheackCredintials(email, password);
        Object[] nameAndRole = userBO.getNameAndRole(email);

        if (isExist && nameAndRole != null) {
            // Extract name and role from the Object array
            String username = (String) nameAndRole[0];
            String role = (String) nameAndRole[1];

            // Set username and role in the session
            session.setAttribute("userName", username);
            session.setAttribute("userRole", role);

            // Redirect to the customer dashboard
            resp.sendRedirect("customerDashboard.jsp");
        } else {
            // Redirect to login page with an error message
            resp.sendRedirect("login.jsp?error=Invalid Credentials");
        }
    }
}
