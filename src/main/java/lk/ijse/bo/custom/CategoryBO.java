package lk.ijse.bo.custom;

import lk.ijse.bo.SuperBO;
import lk.ijse.model.CategoryDTO;

import java.util.List;

public interface CategoryBO extends SuperBO {
    boolean saveCategory(CategoryDTO categoryDTO);

    List<CategoryDTO> getAllCategories();

    boolean updateCategory(CategoryDTO categoryDTO);
}
