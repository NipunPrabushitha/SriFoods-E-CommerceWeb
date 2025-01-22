package lk.ijse.dao.custom.impl;

import lk.ijse.dao.custom.UserDAO;
import lk.ijse.entity.User;
import lk.ijse.util.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserDAOImpl implements UserDAO {

    @Override
    public boolean cheackCredintials(String email, String password) {
        Transaction transaction = null;
        try (Session session = FactoryConfiguration.getInstance().getSession()) {
            // Start transaction
            transaction = session.beginTransaction();

            // HQL query to check email and password
            String hql = "FROM User WHERE email = :email AND password = :password";
            Query query = session.createQuery(hql);
            query.setParameter("email", email);
            query.setParameter("password", password);

            // Check if a result exists
            boolean isValid = query.uniqueResult() != null;

            // Commit the transaction
            transaction.commit();

            return isValid;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean save(User map) {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = session.beginTransaction();
        session.save(map);
        transaction.commit();
        session.close();
        return true;
    }
}
