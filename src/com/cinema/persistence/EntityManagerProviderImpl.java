package com.cinema.persistence;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

public class EntityManagerProviderImpl implements EntityManagerProvider {

	private static EntityManagerProviderImpl instance;

	private final EntityManagerFactory emf;

	private EntityManagerProviderImpl() {
		this.emf = EntityManagerFactoryProvider.getInstance().getEntityManagerFactory();
	}

	public static EntityManagerProviderImpl getInstance() {
		if (null == instance) {
			instance = new EntityManagerProviderImpl();
		}
		return instance;
	}

	@Override
	public EntityManager createEntityManager() {
		return emf.createEntityManager();
	}

}
