package lk.ijse.bo.custom.impl;

import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.ProductBO;
import lk.ijse.dao.DAOFactory;
import lk.ijse.dao.custom.CategoryDAO;
import lk.ijse.dao.custom.ProductDAO;
import lk.ijse.entity.Category;
import lk.ijse.entity.Product;
import lk.ijse.model.ProductDTO;

public class ProductBOImpl implements ProductBO {
    ProductDAO productDAO = (ProductDAO) DAOFactory.getDAOFactory().getDAO(DAOFactory.DAOType.PRODUCT);

    @Override
    public boolean saveProduct(ProductDTO productDTO) {
        Category category = new Category(productDTO.getCategory().getId(), productDTO.getCategory().getCategoryName(), productDTO.getDescription(), productDTO.getCategory().getFilepath());
        return productDAO.save(new Product(productDTO.getName(), productDTO.getDescription(), productDTO.getPrice(), productDTO.getStock(), category,productDTO.getImagePath()));
    }
}
