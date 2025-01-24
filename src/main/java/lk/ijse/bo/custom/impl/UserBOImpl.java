package lk.ijse.bo.custom.impl;

import lk.ijse.bo.custom.UserBO;
import lk.ijse.dao.DAOFactory;
import lk.ijse.dao.custom.UserDAO;
import lk.ijse.entity.User;
import lk.ijse.model.UserDTO;
import org.modelmapper.ModelMapper;

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
}
