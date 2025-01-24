package lk.ijse.dao.custom;

import lk.ijse.dao.CrudDAO;
import lk.ijse.dao.SuperDAO;
import lk.ijse.entity.User;

public interface UserDAO extends CrudDAO {

    boolean cheackCredintials(String email, String password);

    boolean save(User map);

    boolean resetPassword(String email,String password);

    Object[] getNameAndRole(String email);
}
