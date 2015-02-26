package com.cinema.booking;

import com.cinema.persistence.model.Reservation;

public interface BookingAgent {

	Reservation book(BookRequest bookRequest, String username) throws BookingException;

}
