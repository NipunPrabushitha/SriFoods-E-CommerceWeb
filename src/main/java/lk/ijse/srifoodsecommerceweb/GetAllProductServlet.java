package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.CategoryBO;
import lk.ijse.bo.custom.ProductBO;
import lk.ijse.model.CategoryDTO;
import lk.ijse.model.ProductDTO;

import java.io.IOException;
import java.util.List;

@WebServlet(name ="allProductServlet" , value = "/allProducts-servlet")
public class GetAllProductServlet extends HttpServlet {
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.PRODUCT);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get the list of categories from the business logic layer (BO)
            List<ProductDTO> productList = productBO.getAllCategories();

            // Set the categories list as a request attribute
            req.setAttribute("products", productList);
            // Forward the request to the JSP for rendering
            req.getRequestDispatcher("allProducts.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category.jsp?error=An error occurred while fetching the categories");
        }
    }
}
