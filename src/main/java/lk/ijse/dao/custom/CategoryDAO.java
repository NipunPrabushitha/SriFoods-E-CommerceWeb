package lk.ijse.dao.custom;

import lk.ijse.dao.SuperDAO;
import lk.ijse.entity.Category;
import lk.ijse.model.CategoryDTO;

import java.util.List;

public interface CategoryDAO extends SuperDAO {
    boolean save(Category map);

    List<Category> getAll();

    boolean update(Category map);
}
