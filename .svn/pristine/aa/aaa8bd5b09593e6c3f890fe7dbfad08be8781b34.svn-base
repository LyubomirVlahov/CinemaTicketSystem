package com.cinema.booking;

import java.util.List;

import com.cinema.persistence.dao.ReservationDAO;
import com.cinema.persistence.model.Reservation;
import com.cinema.persistence.model.Ticket;

public class ReservationManager {

	private final ReservationDAO reservationDAO;

	public ReservationManager(ReservationDAO reservationDAO) {
		this.reservationDAO = reservationDAO;
	}

	public void deleteReservation(Long reservationId) {
		Reservation reservation = reservationDAO.getById(reservationId);
		if (null == reservation) {
			System.err.println("There is no reservation with id " + reservationId);
		} else {
			reservationDAO.deleteById(reservationId);
		}
	}

	public void checkIn(String reservationUUID) throws BadCheclnRequestException {
		Reservation reservation = reservationDAO.getByUUID(reservationUUID);
		if (null == reservation) {
			throw new BadCheclnRequestException("There is no reservation with UUID " + reservationUUID);
		}
		List<Ticket> tickets = reservation.getTickets();
		for (Ticket ticket : tickets) {
			ticket.setChecked(true);
		}
		reservationDAO.save(reservation);
	}
}
