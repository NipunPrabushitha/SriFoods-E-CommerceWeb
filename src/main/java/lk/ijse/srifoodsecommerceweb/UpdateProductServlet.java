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

@WebServlet("/updateProduct-servlet")
public class UpdateProductServlet extends HttpServlet {
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.PRODUCT);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("awaaaa");

        Long productId = (long) Integer.parseInt(req.getParameter("product_id"));
        String productName = req.getParameter("product_name");
        double productPrice = Double.parseDouble(req.getParameter("product_price"));
        int productQuantity = Integer.parseInt(req.getParameter("product_stock"));
        String productDescription = req.getParameter("product_description");
        String productCategory = req.getParameter("product_category");
        String productImage = req.getParameter("image_link");

        CategoryDTO categoryDTO = categoryBO.getByName(productCategory);
        ProductDTO productDTO = new ProductDTO(productId, productName, productDescription, productPrice, productQuantity, categoryDTO, productImage);
        boolean isUpdated = productBO.updateProduct(productDTO);

        if (isUpdated) {
            resp.sendRedirect("allProducts-servlet?success=Product updated successfully");
        } else {
            resp.sendRedirect("allProducts-servlet?error=Failed to update product");
        }

    }
}
