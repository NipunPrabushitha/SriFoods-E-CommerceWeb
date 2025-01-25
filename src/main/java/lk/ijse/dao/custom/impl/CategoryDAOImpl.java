package lk.ijse.dao.custom.impl;

import lk.ijse.dao.custom.CategoryDAO;
import lk.ijse.entity.Category;
import lk.ijse.model.CategoryDTO;
import lk.ijse.util.FactoryConfiguration;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {

    @Override
    public boolean save(Category category) {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = null;

        try {
            // Begin a transaction
            transaction = session.beginTransaction();

            // Save the category
            session.save(category);

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

    @Override
    public List<Category> getAll() {
        Session session = FactoryConfiguration.getInstance().getSession();

            // Create a transaction
            Transaction transaction = session.beginTransaction();

            // Fetch all categories
            List<Category> categories = session.createQuery("FROM Category", Category.class).list();

            // Commit transaction
            transaction.commit();

            return categories;
    }

    @Override
    public boolean update(Category map) {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = session.beginTransaction();
        session.update(map);
        transaction.commit();
        session.close();
        return true;
    }

    @Override
    public boolean delete(String id) {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = session.beginTransaction();
        Category category = session.load(Category.class, id);
        session.delete(category);
        transaction.commit();
        session.close();
        return true;
    }

    @Override
    public Category getByID(Long categoryId) {
        Session session = FactoryConfiguration.getInstance().getSession();
        Transaction transaction = null;
        Category category = null;

        try {
            transaction = session.beginTransaction();
            // find student
            String hql = "FROM Category WHERE id = :id";
            Query<Category> query = session.createQuery(hql, Category.class);
            query.setParameter("id", categoryId);
            category = query.uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return category;
    }

}
