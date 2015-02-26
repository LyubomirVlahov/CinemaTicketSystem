package com.cinema.booking;

public class BadBookingRequestException extends BookingException {

	private static final long serialVersionUID = 1L;

	public BadBookingRequestException(String message) {
		super(message);
	}
}
