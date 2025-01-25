package lk.ijse.bo.custom.impl;

import lk.ijse.bo.custom.CategoryBO;
import lk.ijse.dao.DAOFactory;
import lk.ijse.dao.custom.CategoryDAO;
import lk.ijse.dao.custom.UserDAO;
import lk.ijse.entity.Category;
import lk.ijse.model.CategoryDTO;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class CategoryBOImpl implements CategoryBO {
    ModelMapper modelMapper = new ModelMapper();
    CategoryDAO categoryDAO = (CategoryDAO) DAOFactory.getDAOFactory().getDAO(DAOFactory.DAOType.CATEGORY);


    @Override
    public boolean saveCategory(CategoryDTO categoryDTO) {
        return categoryDAO.save(new Category(categoryDTO.getCategoryName(), categoryDTO.getDescription(),categoryDTO.getFilepath()));
    }

    @Override
    public List<CategoryDTO> getAllCategories() {
        List<Category> categories = categoryDAO.getAll();

        // Create an ArrayList to hold the CategoryDTOs
        ArrayList<CategoryDTO> categoryDTOList = new ArrayList<>();

        // Iterate over the Category entities and convert them into CategoryDTOs
        for (Category category : categories) {
            // Create a new CategoryDTO for each Category entity and add it to the list
            categoryDTOList.add(new CategoryDTO(
                    category.getId(),
                    category.getCategoryName(),
                    category.getDescription(),
                    category.getFile()
            ));
        }

        // Return the list of CategoryDTOs
        return categoryDTOList;
    }

    @Override
    public boolean updateCategory(CategoryDTO categoryDTO) {
        return categoryDAO.update(new Category(categoryDTO.getId(), categoryDTO.getCategoryName(),categoryDTO.getDescription(), categoryDTO.getFilepath()));
    }

    @Override
    public boolean deleteCategory(String id) {
        return categoryDAO.delete(id);
    }

    @Override
    public CategoryDTO getByID(Long categoryId) {
         Category category = categoryDAO.getByID(categoryId);
         return new CategoryDTO(category.getId(), category.getCategoryName(), category.getDescription(), category.getFile());
    }

    @Override
    public CategoryDTO getByName(String productCategory) {
        Category category = categoryDAO.getByName(productCategory);
        return new CategoryDTO(category.getId(), category.getCategoryName(), category.getDescription(), category.getFile());
    }
}
