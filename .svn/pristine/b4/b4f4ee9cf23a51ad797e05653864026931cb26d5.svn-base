package com.cinema.booking;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cinema.persistence.EntityManagerProvider;
import com.cinema.persistence.EntityManagerProviderImpl;
import com.cinema.persistence.dao.ReservationDAO;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

public class DeleteReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final Gson gson;
	private final ReservationManager reservationManager;

	public DeleteReservationServlet() {
		this.gson = new Gson();
		EntityManagerProvider emp = EntityManagerProviderImpl.getInstance();
		this.reservationManager = new ReservationManager(new ReservationDAO(emp));
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeleteReservationRequest deleteReservationReq = null;
		try {
			deleteReservationReq = getDeleteReservationRequest(request.getInputStream());
		} catch (JsonSyntaxException ex) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		if (null == deleteReservationReq || null == deleteReservationReq.getReservationId()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		reservationManager.deleteReservation(deleteReservationReq.getReservationId());
	}

	private DeleteReservationRequest getDeleteReservationRequest(ServletInputStream inputStream) throws JsonSyntaxException {
		return gson.fromJson(new InputStreamReader(inputStream), DeleteReservationRequest.class);
	}
}