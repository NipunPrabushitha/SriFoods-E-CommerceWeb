package lk.ijse.bo.custom.impl;

import lk.ijse.bo.custom.UserBO;
import lk.ijse.dao.custom.UserDAO;
import lk.ijse.entity.User;
import org.modelmapper.ModelMapper;

public class UserBOImpl implements UserBO {
    public void test(UserDAO userDAO) {
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.map(userDAO, User.class);
    }
}
