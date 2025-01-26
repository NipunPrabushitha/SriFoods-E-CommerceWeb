package lk.ijse.bo.custom;

import lk.ijse.bo.SuperBO;
import lk.ijse.model.UserDTO;

import java.util.List;

public interface UserBO extends SuperBO {
    boolean cheackCredintials(String email, String password);

    boolean saveCustomer(UserDTO userDTO);

    boolean resetPassword(String email,String password);

    Object[] getNameAndRole(String email);

    boolean updateUserStatus(int userId, boolean status);

    List<UserDTO> getAllUsers();
}
