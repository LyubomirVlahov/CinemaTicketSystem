package com.cinema.persistence.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cinema.persistence.EntityManagerProvider;
import com.cinema.persistence.model.IDBEntity;

public class BasicDAO<T extends IDBEntity> {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	protected EntityManagerProvider entityManagerProvider;

	public BasicDAO(EntityManagerProvider entityManagerProvider) {
		this.entityManagerProvider = entityManagerProvider;
	}

	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		EntityManager entityManager = entityManagerProvider.createEntityManager();
		final List<T> result = new ArrayList<>();
		result.addAll((Collection<? extends T>) entityManager.createQuery("select t from " + getTableName() + " t", //$NON-NLS-1$ //$NON-NLS-2$
				this.getClass().getGenericSuperclass().getClass()).getResultList());
		entityManager.close();
		return result;
	}

	public T save(T entity) {
		EntityManager entityManager = entityManagerProvider.createEntityManager();
		entityManager.getTransaction().begin();

		final T merge = entityManager.merge(entity);

		entityManager.getTransaction().commit();
		entityManager.close();
		return merge;
	}

	public T saveNew(T entity) {
		EntityManager entityManager = entityManagerProvider.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.persist(entity);

		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}

	public void deleteAll() {
		final List<T> all = getAll();
		EntityManager entityManager = entityManagerProvider.createEntityManager();
		entityManager.getTransaction().begin();

		for (T t : all) {
			final T managedObject = getById(t.getId());
			entityManager.remove(managedObject);
		}

		entityManager.getTransaction().commit();
		entityManager.close();
	}

	public T getById(long id) {
		final EntityManager em = entityManagerProvider.createEntityManager();
		try {
			T entity = getById(id, em);
			return entity;
		} finally {
			em.close();
		}
	}

	@SuppressWarnings("unchecked")
	protected T getById(long id, EntityManager em) {
		T t = null;

		try {
			Query query = em.createQuery("select u from " + getTableName() + " u where u.id = :id"); //$NON-NLS-1$ //$NON-NLS-2$
			query.setParameter("id", id); //$NON-NLS-1$
			t = (T) query.getSingleResult();
		} catch (NoResultException e) {
			logger.error("Could not retrieve entity {} from table {}.", id, getTableName()); //$NON-NLS-1$
		} catch (NonUniqueResultException e) {
			throw new IllegalStateException(String.format("More than one entity %s from table %s.", id, getTableName())); //$NON-NLS-1$
		}

		return t;
	}

	private Type getActualType() {
		Type genericSuperclass = this.getClass().getGenericSuperclass();
		ParameterizedType pt = (ParameterizedType) genericSuperclass;
		Type type = pt.getActualTypeArguments()[0];

		return type;
	}

	private String getTableName() {
		String actualType = getActualType().toString();
		return actualType.substring(actualType.lastIndexOf('.') + 1);
	}

}
