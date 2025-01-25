package lk.ijse.dao;

import lk.ijse.bo.custom.impl.CategoryBOImpl;
import lk.ijse.dao.custom.impl.CategoryDAOImpl;
import lk.ijse.dao.custom.impl.ProductDAOImpl;
import lk.ijse.dao.custom.impl.UserDAOImpl;

public class DAOFactory {
    private static DAOFactory daoFactory;
    private DAOFactory() {
    }
    public static DAOFactory getDAOFactory() {
        return (daoFactory == null)? daoFactory = new DAOFactory() : daoFactory;
    }
    public enum DAOType {
        USER,CATEGORY,PRODUCT
    }
    public SuperDAO getDAO(DAOType types) {
        switch (types){
            case USER:
                return new UserDAOImpl();
            case CATEGORY:
                return new CategoryDAOImpl();
            case PRODUCT:
                return new ProductDAOImpl();
            default:
                return null;
        }
    }
}
