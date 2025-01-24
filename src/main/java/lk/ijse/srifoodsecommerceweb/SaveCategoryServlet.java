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
import lk.ijse.model.CategoryDTO;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "saveCategoryServlet", value = "/saveCategory-servlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class SaveCategoryServlet extends HttpServlet {
    private final CategoryBO categoryBO = (CategoryBO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.CATEGORY);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve form data
            String categoryName = req.getParameter("category_name");
            String categoryDescription = req.getParameter("category_description");

            // Retrieve the file part
            Part imagePart = req.getPart("category_image");
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
            // Create a CategoryDTO and save the data
            CategoryDTO categoryDTO = new CategoryDTO(categoryName, categoryDescription, "http://localhost:8080/SriFoods_E_CommerceWeb_war_exploded/uploads/" + fileName);
            boolean isSaved = categoryBO.saveCategory(categoryDTO);

            // Redirect based on success or failure
            if (isSaved) {
                resp.sendRedirect("category.jsp?success=Category saved successfully");
            } else {
                resp.sendRedirect("category.jsp?error=Failed to save category");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("category.jsp?error=An unexpected error occurred");
        }
    }
}
