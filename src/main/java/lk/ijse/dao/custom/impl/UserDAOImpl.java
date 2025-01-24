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
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = null;
        try {
            // Start transaction
            transaction = session.beginTransaction();
            System.out.println("in the DAO"+password);
            // HQL query to check email and password
            String hql = "FROM User WHERE email = :email AND password = :password";
            Query query = session.createQuery(hql,User.class);
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

    @Override
    public boolean resetPassword(String email,String password) {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = null;
        try {

            transaction = session.beginTransaction();

            // Fetch the user by email
            User user = session.createQuery("FROM User WHERE email = :email", User.class)
                    .setParameter("email", email)
                    .uniqueResult();

            if (user != null) {
                // Update the password
                user.setPassword(password);
                session.update(user);

                // Commit the transaction
                transaction.commit();
                return true; // Password updated successfully
            } else {
                return false; // User not found
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false; // Error occurred
        }
    }

    @Override
    public Object[] getNameAndRole(String email) {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = null;
        Object[] nameAndRole = null;

        try {
            // Start a transaction
            transaction = session.beginTransaction();

            // HQL query to fetch name and role based on email
            String hql = "SELECT u.name, u.role FROM User u WHERE u.email = :email";
            Query<Object[]> query = session.createQuery(hql, Object[].class);
            query.setParameter("email", email);

            // Fetch the single result (name and role)
            nameAndRole = query.uniqueResult();

            // Commit the transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

        return nameAndRole; // Returns null if no user is found
    }
}
