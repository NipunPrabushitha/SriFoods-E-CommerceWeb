package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.UserBO;
import lk.ijse.model.UserDTO;

import java.io.IOException;

@WebServlet(name = "loginDetailSaveServlet", value = "/loginDataSave-servlet")
public class UserLoginSaveServlet extends HttpServlet {
    UserBO userBO  = (UserBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.USER);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = 0;
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String role = "customer";

        if (!password.equals(confirmPassword)) {
            resp.sendRedirect("registration.jsp?error=Passwords do not match");

        }else {
            boolean isSaved = userBO.saveCustomer(new UserDTO(id,name, email, password,role));
            if (isSaved) {
                resp.sendRedirect("login.jsp?success=Registration Successful");
            } else {
                resp.sendRedirect("registration.jsp?error=Registration Failed");
            }
        }
    }
}
