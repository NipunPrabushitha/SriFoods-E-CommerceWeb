package lk.ijse.bo;

import lk.ijse.bo.custom.impl.CategoryBOImpl;
import lk.ijse.bo.custom.impl.ProductBOImpl;
import lk.ijse.bo.custom.impl.UserBOImpl;
import lk.ijse.dao.custom.impl.UserDAOImpl;

public class BOFactory {
    private static BOFactory boFactory;

    public BOFactory() {
    }

    public static BOFactory getBoFactory() {
        return (boFactory == null)? boFactory = new BOFactory() : boFactory;
    }

    public enum BOTypes {
        USER,CATEGORY,PRODUCT
    }
    public SuperBO getBO(BOTypes types) {
        switch (types){
            case USER:
                return new UserBOImpl();
            case CATEGORY:
                return new CategoryBOImpl();
            case PRODUCT:
                return new ProductBOImpl();
            default:
                return null;
        }
    }
}
