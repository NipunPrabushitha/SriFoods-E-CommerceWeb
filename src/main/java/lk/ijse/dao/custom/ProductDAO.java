package lk.ijse.dao.custom;

import lk.ijse.bo.SuperBO;
import lk.ijse.dao.CrudDAO;
import lk.ijse.dao.SuperDAO;
import lk.ijse.entity.Product;

import java.util.List;

public interface ProductDAO extends CrudDAO {

    boolean save(Product product);

    List<Product> getAll();

    boolean update(Product product);

    boolean delete(String id);
}
