package lk.ijse.bo;

import lk.ijse.bo.custom.impl.UserBOImpl;

public class BOFactory {
    private static BOFactory boFactory;

    public BOFactory() {
    }

    public static BOFactory getBoFactory() {
        return (boFactory == null)? boFactory = new BOFactory() : boFactory;
    }

    public enum BOTypes {
        USER
    }
    public SuperBO getBO(BOTypes types) {
        switch (types){
            case USER:
                return new UserBOImpl();
            default:
                return null;
        }
    }
}
