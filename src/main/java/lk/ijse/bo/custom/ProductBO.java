package lk.ijse.bo.custom;

import lk.ijse.bo.SuperBO;
import lk.ijse.model.ProductDTO;

public interface ProductBO extends SuperBO {

    boolean saveProduct(ProductDTO productDTO);

}
