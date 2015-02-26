package com.cinema.persistence;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public final class EntityManagerFactoryProvider {

	private static final String PERSISTENCE_UNIT = "com.cinema.ticket.system";
	private static EntityManagerFactoryProvider instance = null;

	private final EntityManagerFactory entityManagerFactory;

	private EntityManagerFactoryProvider() {
		this.entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	}

	public synchronized static EntityManagerFactoryProvider getInstance() {
		if (null == instance) {
			instance = new EntityManagerFactoryProvider();
		}
		return instance;
	}

	public EntityManagerFactory getEntityManagerFactory() {
		return entityManagerFactory;
	}
}