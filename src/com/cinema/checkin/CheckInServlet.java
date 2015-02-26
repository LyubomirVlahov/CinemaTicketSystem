package com.cinema.checkin;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cinema.booking.BadCheclnRequestException;
import com.cinema.booking.ReservationManager;
import com.cinema.persistence.EntityManagerProvider;
import com.cinema.persistence.EntityManagerProviderImpl;
import com.cinema.persistence.dao.ReservationDAO;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

public class CheckInServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final ReservationManager reservationManager;
	private final Gson gson;

	public CheckInServlet() {
		EntityManagerProvider emp = EntityManagerProviderImpl.getInstance();
		this.reservationManager = new ReservationManager(new ReservationDAO(emp));
		this.gson = new Gson();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CheckInRequest checkInRequest = null;
		try {
			checkInRequest = getPaymentRequest(request.getInputStream());
		} catch (JsonSyntaxException ex) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		if (null == checkInRequest.getReservationUUID() || checkInRequest.getReservationUUID().length() == 0) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		try {
			reservationManager.checkIn(checkInRequest.getReservationUUID());
		} catch (BadCheclnRequestException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
	}

	private CheckInRequest getPaymentRequest(ServletInputStream inputStream) throws JsonSyntaxException {
		return gson.fromJson(new InputStreamReader(inputStream), CheckInRequest.class);
	}
}
