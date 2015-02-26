package com.cinema.persistence.dao;

import com.cinema.persistence.EntityManagerProvider;
import com.cinema.persistence.model.Hall;

public class HallDAO extends BasicDAO<Hall> {

	public HallDAO(EntityManagerProvider entityManagerProvider) {
		super(entityManagerProvider);
	}
}
