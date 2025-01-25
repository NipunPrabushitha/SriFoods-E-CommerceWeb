package lk.ijse.bo.custom;

import lk.ijse.bo.SuperBO;
import lk.ijse.model.ProductDTO;

import java.util.List;

public interface ProductBO extends SuperBO {

    boolean saveProduct(ProductDTO productDTO);

    List<ProductDTO> getAllCategories();

    boolean updateProduct(ProductDTO productDTO);
}
