package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.UserBO;

import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HelloServlet{
    UserBO userBO  = (UserBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.USER);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        boolean isExist = userBO.cheackCredintials(email, password);
        // Redirect based on the result
        if (isExist) {
            resp.sendRedirect("customerDashboard.jsp");
        } else {
            resp.sendRedirect("login.jsp?error=Invalid Credentials");
        }
    }
}
