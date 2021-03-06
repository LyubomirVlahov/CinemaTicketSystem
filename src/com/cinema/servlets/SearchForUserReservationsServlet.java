package com.cinema.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cinema.persistence.EntityManagerProviderImpl;
import com.cinema.persistence.dao.UserDAO;
import com.cinema.persistence.model.Reservation;
import com.cinema.persistence.model.User;

public class SearchForUserReservationsServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest aRequest, HttpServletResponse aResponse) throws IOException, ServletException {
		String userIdString = aRequest.getParameter("user");
		UserDAO userDAO = new UserDAO(EntityManagerProviderImpl.getInstance());
		User user = userDAO.getByUsername(userIdString);
		if (user != null) {
			List<Reservation> userReservations = new ArrayList<Reservation>();
			userReservations = user.getReservations();
			if (userReservations.size() != 0) {
				aRequest.setAttribute("userReservations", userReservations);
			}
		}
		aRequest.getRequestDispatcher("/employee/ShowUserTickets.jsp").forward(aRequest, aResponse);
	}

	@Override
	public void doPost(HttpServletRequest aRequest, HttpServletResponse aResponse) throws IOException, ServletException {
		doGet(aRequest, aResponse);
	}
}
