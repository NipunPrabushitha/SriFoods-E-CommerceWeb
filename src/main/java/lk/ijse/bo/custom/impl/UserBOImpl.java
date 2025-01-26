package lk.ijse.bo.custom.impl;

import lk.ijse.bo.custom.UserBO;
import lk.ijse.dao.DAOFactory;
import lk.ijse.dao.custom.UserDAO;
import lk.ijse.entity.Category;
import lk.ijse.entity.User;
import lk.ijse.model.CategoryDTO;
import lk.ijse.model.UserDTO;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.List;

public class UserBOImpl implements UserBO {
    UserDAO userDAO = (UserDAO) DAOFactory.getDAOFactory().getDAO(DAOFactory.DAOType.USER);
    /*public void test(UserDAO userDAO) {
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.map(userDAO, User.class);
    }*/

    @Override
    public boolean cheackCredintials(String email, String password) {
        return userDAO.cheackCredintials(email, password);
    }

    @Override
    public boolean saveCustomer(UserDTO userDTO) {
        ModelMapper modelMapper = new ModelMapper();
        return userDAO.save(modelMapper.map(userDTO, User.class));
    }

    @Override
    public boolean resetPassword(String email,String password) {
        return userDAO.resetPassword(email,password);
    }

    @Override
    public Object[] getNameAndRole(String email) {
        return userDAO.getNameAndRole(email);
    }

    @Override
    public boolean updateUserStatus(int userId, boolean status) {
        return userDAO.updateUserStatus(userId, status);
    }

    @Override
    public List<UserDTO> getAllUsers() {
        List<User> users = userDAO.getAll();

        // Create an ArrayList to hold the CategoryDTOs
        ArrayList<UserDTO> userDTOS = new ArrayList<>();

        // Iterate over the Category entities and convert them into CategoryDTOs
        for (User user : users) {
            // Create a new CategoryDTO for each Category entity and add it to the list
            userDTOS.add(new UserDTO(
                    user.getId(),
                    user.getName(),
                    user.getEmail(),
                    user.getPassword(),
                    user.getRole(),
                    user.getStatus()
            ));
        }

        // Return the list of CategoryDTOs
        return userDTOS;
    }
}
