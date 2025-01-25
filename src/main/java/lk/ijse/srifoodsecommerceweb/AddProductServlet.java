/*
package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.CategoryBO;
import lk.ijse.bo.custom.ProductBO;
import lk.ijse.model.CategoryDTO;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/addProduct-servlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AddProductServlet extends HttpServlet {
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.PRODUCT);
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String name = req.getParameter("productName");
            String description = req.getParameter("description");
            Double price = Double.parseDouble(req.getParameter("basePrice"));
            int stock = Integer.parseInt(req.getParameter("stock"));
            Long categoryId = Long.parseLong(req.getParameter("category"));
            String imageLink = req.getParameter("thumbnail");

        System.out.println("Nmae "+name);
        System.out.println("Description "+description);
        System.out.println("Price "+price);
        System.out.println("Stock "+stock);
        System.out.println("Image Link "+imageLink);
        System.out.println("Category Id "+categoryId);

        System.out.println(categoryId);

            Part imagePart = req.getPart("thumbnail");
            String fileName = imagePart.getSubmittedFileName();

        // Validate file part
        if (imagePart == null || imagePart.getSize() == 0) {
            resp.sendRedirect("category.jsp?error=No file uploaded or file is empty");
            return;
        }

        // Define the upload directory
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        System.out.println("Upload Path: " + uploadPath);

        String filePath = uploadPath + File.separator + fileName;

        try (InputStream inputStream = imagePart.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
        System.out.println(fileName);

        CategoryDTO categoryDTO = categoryBO.getByID(categoryId);
        System.out.println(categoryDTO.getCategoryName());

            // Create a ProductBO and save the data
           */
/* boolean isSaved = productBO.saveProduct(name, description, price, stock, categoryId);

            // Redirect based on success or failure
            if (isSaved) {
                resp.sendRedirect("product-list?success=Product saved successfully");
            } else {
                resp.sendRedirect("product-list?error=Failed to save product");
            }*//*


    }
}
*/
package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.CategoryBO;
import lk.ijse.bo.custom.ProductBO;
import lk.ijse.model.CategoryDTO;
import lk.ijse.model.ProductDTO;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/addProduct-servlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddProductServlet extends HttpServlet {
    CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);
    ProductBO productBO = (ProductBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.PRODUCT);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the product details from the form
        String productName = request.getParameter("productName");
        Long categoryId = Long.parseLong(request.getParameter("category"));
        String description = request.getParameter("description");
        int stock = Integer.parseInt(request.getParameter("stock"));
        double basePrice = Double.parseDouble(request.getParameter("basePrice"));


        Part imagePart = request.getPart("thumbnail");
        String fileName = imagePart.getSubmittedFileName();

        if (imagePart == null || imagePart.getSize() == 0) {
            response.sendRedirect("addProduct.jsp?error=No file uploaded or file is empty");
            return;
        }

        // Define the upload directory
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        System.out.println("Upload Path: " + uploadPath);

        String filePath = uploadPath + File.separator + fileName;

        try (InputStream inputStream = imagePart.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
        System.out.println(fileName);
        CategoryDTO categoryDTO = categoryBO.getByID(categoryId);
        System.out.println(categoryDTO.getCategoryName());
        ProductDTO productDTO = new ProductDTO(productName, description, basePrice, stock, categoryDTO, "http://localhost:8080/SriFoods_E_CommerceWeb_war_exploded/uploads/" + fileName);

        boolean isSaved = productBO.saveProduct(productDTO);
        if (isSaved) {
            request.setAttribute("message", "Product added Successfully!");
            request.setAttribute("alertType", "success"); // or "error"
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Product added Unsuccessfully!");
            request.setAttribute("alertType", "error"); // or "error"
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }

    }

}
