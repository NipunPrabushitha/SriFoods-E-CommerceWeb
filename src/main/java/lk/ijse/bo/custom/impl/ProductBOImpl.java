package lk.ijse.bo.custom.impl;

import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.ProductBO;
import lk.ijse.dao.DAOFactory;
import lk.ijse.dao.custom.CategoryDAO;
import lk.ijse.dao.custom.ProductDAO;
import lk.ijse.entity.Category;
import lk.ijse.entity.Product;
import lk.ijse.model.CategoryDTO;
import lk.ijse.model.ProductDTO;

import java.util.ArrayList;
import java.util.List;

public class ProductBOImpl implements ProductBO {
    ProductDAO productDAO = (ProductDAO) DAOFactory.getDAOFactory().getDAO(DAOFactory.DAOType.PRODUCT);

    @Override
    public boolean saveProduct(ProductDTO productDTO) {
        Category category = new Category(productDTO.getCategory().getId(), productDTO.getCategory().getCategoryName(), productDTO.getDescription(), productDTO.getCategory().getFilepath());
        return productDAO.save(new Product(productDTO.getName(), productDTO.getDescription(), productDTO.getPrice(), productDTO.getStock(), category,productDTO.getImagePath()));
    }

    @Override
    public List<ProductDTO> getAllCategories() {
        List<Product> products = productDAO.getAll();

        // Create an ArrayList to hold the CategoryDTOs
        ArrayList<ProductDTO> productDTOList = new ArrayList<>();

        // Iterate over the Category entities and convert them into CategoryDTOs
        for (Product product : products) {
            // Create a new CategoryDTO for each Category entity and add it to the list
            productDTOList.add(new ProductDTO(
                    product.getProductId(),
                    product.getName(),
                    product.getDescription(),
                    product.getPrice(),
                    product.getStock(),
                    new CategoryDTO(
                            product.getCategory().getId(),
                            product.getCategory().getCategoryName(),
                            product.getCategory().getDescription(),
                            product.getCategory().getFile()
                    ),
                    product.getImagepath()
            ));
        }

        // Return the list of CategoryDTOs
        return productDTOList;
    }

    @Override
    public boolean updateProduct(ProductDTO productDTO) {
        Category category = new Category(productDTO.getCategory().getId(), productDTO.getCategory().getCategoryName(), productDTO.getCategory().getDescription(), productDTO.getCategory().getFilepath());
        return productDAO.update(new Product(productDTO.getId(), productDTO.getName(), productDTO.getDescription(), productDTO.getPrice(), productDTO.getStock(), category, productDTO.getImagePath()));

    }
}
