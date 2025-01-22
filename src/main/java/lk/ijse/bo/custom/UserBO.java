package lk.ijse.bo.custom;

import lk.ijse.bo.CrudBO;
import lk.ijse.model.UserDTO;

public interface UserBO extends CrudBO {
    boolean cheackCredintials(String email, String password);

    boolean saveCustomer(UserDTO userDTO);
}
