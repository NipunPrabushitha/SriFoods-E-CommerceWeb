package lk.ijse.dao.custom.impl;

import lk.ijse.dao.custom.ProductDAO;
import lk.ijse.entity.Product;
import lk.ijse.util.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ProductDAOImpl implements ProductDAO {

    @Override
    public boolean save(Product product) {

        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = null;

        try {
            // Begin a transaction
            transaction = session.beginTransaction();

            // Save the category
            session.save(product);

            // Commit the transaction
            transaction.commit();

            // Redirect to success page or category list
            return true;

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); // Rollback in case of error
            }
            e.printStackTrace();
            return false;
        } finally {
            session.close(); // Close the session after use
        }
    }
}
