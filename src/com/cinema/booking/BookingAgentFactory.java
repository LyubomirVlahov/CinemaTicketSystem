package com.cinema.booking;

import com.cinema.persistence.EntityManagerProvider;
import com.cinema.persistence.EntityManagerProviderImpl;
import com.cinema.persistence.dao.ProjectionDAO;
import com.cinema.persistence.dao.ReservationDAO;
import com.cinema.persistence.dao.SeatDAO;
import com.cinema.persistence.dao.UserDAO;

public final class BookingAgentFactory {

	private static BookingAgentFactory instance;

	private BookingAgentFactory() {
	}

	public static BookingAgentFactory getInstance() {
		if (null == instance) {
			instance = new BookingAgentFactory();
		}
		return instance;
	}

	public BookingAgent createBookingAgent() {
		EntityManagerProvider emp = EntityManagerProviderImpl.getInstance();
		return new BookingAgentImpl(new SeatDAO(emp), new UserDAO(emp), new ProjectionDAO(emp), new ReservationDAO(emp));
	}
}
