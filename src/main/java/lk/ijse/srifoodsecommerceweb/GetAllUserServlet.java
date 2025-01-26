package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.UserBO;
import lk.ijse.model.ProductDTO;
import lk.ijse.model.UserDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "gwtAllUserServlet", value = "/allUsers-Servlet")
public class GetAllUserServlet extends HttpServlet {
    UserBO userBO  = (UserBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.USER);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the list of categories from the business logic layer (BO)
            List<UserDTO> userList = userBO.getAllUsers();

            // Set the categories list as a request attribute
            req.setAttribute("users", userList);
            // Forward the request to the JSP for rendering
            req.getRequestDispatcher("manageCustomer.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("allProduct.jsp?error=An error occurred while fetching the products");
        }
    }
}
