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

@WebServlet("/UpdateCategoryServlet")
public class UpdateCategoryServlet extends HttpServlet {
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("category_id");
        String categoryName = req.getParameter("category_name");
        String categoryDescription = req.getParameter("category_description");
        String imageLink = req.getParameter("image_link");
        System.out.println(imageLink);
        CategoryDTO categoryDTO = new CategoryDTO(Integer.parseInt(id), categoryName, categoryDescription, imageLink);
        boolean isUpdated = categoryBO.updateCategory(categoryDTO);

        if(isUpdated){
            resp.sendRedirect("category-list?success=Category updated successfully");
        }else{
            resp.sendRedirect("category-list?error=Failed to update category");
        }
    }
}
