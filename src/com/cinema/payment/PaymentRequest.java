package com.cinema.payment;

public class PaymentRequest {
	private Long reservationId;

	public PaymentRequest() {

	}

	public Long getReservationId() {
		return reservationId;
	}

	public void setReservationId(Long reservationId) {
		this.reservationId = reservationId;
	}
}
