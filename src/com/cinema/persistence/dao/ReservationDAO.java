package com.cinema.persistence.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.TypedQuery;

import com.cinema.persistence.EntityManagerProvider;
import com.cinema.persistence.model.DBQueries;
import com.cinema.persistence.model.Reservation;
import com.cinema.persistence.model.Seat;
import com.cinema.persistence.model.Status;

public class ReservationDAO extends BasicDAO<Reservation> {

	public ReservationDAO(EntityManagerProvider entityManagerProvider) {
		super(entityManagerProvider);
	}

	public void deleteById(Long reservationId) {
		EntityManager entityManager = entityManagerProvider.createEntityManager();
		Reservation reservation = getById(reservationId, entityManager);
		if (null == reservation) {
			throw new IllegalArgumentException("Missing reservation with id " + reservationId);
		}
		entityManager.getTransaction().begin();
		for (Seat seat : reservation.getSeats()) {
			seat.setStatus(Status.FREE);
			seat.setReservedUntil(0L);
			seat.setReservation(null);
		}
		entityManager.remove(reservation);
		entityManager.getTransaction().commit();
	}

	public Reservation getByUUID(String reservationUUID) {
		EntityManager em = entityManagerProvider.createEntityManager();
		try {
			final TypedQuery<Reservation> query = em.createNamedQuery(DBQueries.GET_RESERVATION_BY_UUID, Reservation.class);
			query.setParameter("UUID", reservationUUID); //$NON-NLS-1$
			Reservation reservation = query.getSingleResult();
			return reservation;
		} catch (NoResultException x) {
			System.out.println(String.format("Could not retrieve entity for UUID %s from table Reservations.", reservationUUID)); //$NON-NLS-1$ //$NON-NLS-2$
			return null;
		} catch (NonUniqueResultException ex) {
			throw new IllegalStateException(String.format("More than one entity for UUID %s from table Reservations.", reservationUUID), ex); //$NON-NLS-1$
		} finally {
			em.close();
		}
	}
}
