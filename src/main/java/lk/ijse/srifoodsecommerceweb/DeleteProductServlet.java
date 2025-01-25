package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.ProductBO;

import java.io.IOException;


@WebServlet("/deleteProductServlet")
// Delete Product Servlet to delete a product from the database using its ID.
public class DeleteProductServlet extends HttpServlet {
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.PRODUCT);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        System.out.println(id);
        boolean isDeleted = productBO.deleteProduct(id);
        if (isDeleted) {
            resp.sendRedirect("allProducts-servlet?success=Category deleted successfully");
        }
        else {
            resp.sendRedirect("allProducts-servlet?error=Failed to delete category");
        }
    }
}
