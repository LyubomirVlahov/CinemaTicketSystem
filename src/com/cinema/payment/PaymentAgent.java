package com.cinema.payment;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.cinema.persistence.dao.ReservationDAO;
import com.cinema.persistence.dao.SeatDAO;
import com.cinema.persistence.model.Reservation;
import com.cinema.persistence.model.Seat;
import com.cinema.persistence.model.Ticket;

public class PaymentAgent {

	private final ReservationDAO reservationDAO;
	private final SeatDAO seatDAO;

	public PaymentAgent(ReservationDAO reservationDAO, SeatDAO seatDAO) {
		this.reservationDAO = reservationDAO;
		this.seatDAO = seatDAO;
	}

	public Reservation pay(Long reservationId) {
		Reservation reservation = reservationDAO.getById(reservationId);
		if (null == reservation) {
			throw new IllegalArgumentException("There is no reservation with id " + reservationId);
		}
		List<Seat> seats = reservation.getSeats();
		List<Ticket> tickets = new ArrayList<Ticket>(seats.size());
		for (Seat seat : seats) {
			updateSeat(seat);

			Ticket ticket = new Ticket();
			ticket.setReservation(reservation);
			ticket.setSeat(seat);
			tickets.add(ticket);
		}
		reservation.setTickets(tickets);
		reservation.setUUID(UUID.randomUUID().toString());
		return reservationDAO.save(reservation);
	}

	private void updateSeat(Seat seat) {
		seat.setStatus(com.cinema.persistence.model.Status.PAID);
		seat.setReservedUntil(0L);
		seatDAO.save(seat);
	}
}
