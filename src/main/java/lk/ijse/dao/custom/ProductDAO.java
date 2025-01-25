package lk.ijse.dao.custom;

import lk.ijse.bo.SuperBO;
import lk.ijse.dao.CrudDAO;
import lk.ijse.dao.SuperDAO;
import lk.ijse.entity.Product;

public interface ProductDAO extends CrudDAO {

    boolean save(Product product);
}
