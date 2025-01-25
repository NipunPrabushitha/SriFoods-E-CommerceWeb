package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.CategoryBO;

import java.io.IOException;

@WebServlet(name = "deleteCategoryServlet", value = "/deleteCategory-servlet")
public class DeleteCategoryServlet extends HttpServlet {
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);
   /* @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }*/

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        boolean isDeleted = categoryBO.deleteCategory(id);
        if (isDeleted) {
            resp.sendRedirect("category-list?success=Category deleted successfully");
        }
        else {
            resp.sendRedirect("category-list?error=Failed to delete category");
        }
    }
}
