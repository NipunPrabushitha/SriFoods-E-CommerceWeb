package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.CategoryBO;
import lk.ijse.model.CategoryDTO;

import java.io.IOException;
import java.util.List;

@WebServlet("/allDataInDashboard")
public class LoadAllDataServlet extends HttpServlet {
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the list of categories from the business logic layer (BO)
            List<CategoryDTO> categoryList = categoryBO.getAllCategories();

            // Set the categories list as a request attribute
            req.setAttribute("categoriesInDashBoard", categoryList);
            // Forward the request to the JSP for rendering
            req.getRequestDispatcher("customerDashboard.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("customerDashboard.jsp?error=An error occurred while fetching the categories");
        }
    }
}
