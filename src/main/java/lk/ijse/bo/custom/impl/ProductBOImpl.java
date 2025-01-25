package lk.ijse.bo.custom.impl;

import lk.ijse.bo.BOFactory;
import lk.ijse.bo.custom.ProductBO;
import lk.ijse.dao.custom.ProductDAO;

public class ProductBOImpl implements ProductBO {
    ProductDAO productDAO = (ProductDAO) BOFactory.getBoFactory().getBO(BOFactory.BOTypes.PRODUCT);
}
