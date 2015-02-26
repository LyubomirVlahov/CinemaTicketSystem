package com.cinema.persistence.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.TypedQuery;

import com.cinema.persistence.EntityManagerProvider;
import com.cinema.persistence.model.DBQueries;
import com.cinema.persistence.model.User;

public class UserDAO extends BasicDAO<User> {

	public UserDAO(EntityManagerProvider entityManagerProvider) {
		super(entityManagerProvider);
	}

	public User getByUsername(String username) {
		EntityManager em = entityManagerProvider.createEntityManager();
		try {
			final TypedQuery<User> query = em.createNamedQuery(DBQueries.GET_USER_BY_USERNAME, User.class);
			query.setParameter("username", username); //$NON-NLS-1$
			User user = query.getSingleResult();
			return user;
		} catch (NoResultException x) {
			System.out.println(String.format("Could not retrieve entity for username %s from table Users.", username)); //$NON-NLS-1$ //$NON-NLS-2$
			return null;
		} catch (NonUniqueResultException ex) {
			throw new IllegalStateException(String.format("More than one entity for username %s from table User.", username), ex); //$NON-NLS-1$
		} finally {
			em.close();
		}
	}

}
