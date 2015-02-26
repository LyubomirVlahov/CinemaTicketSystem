package com.cinema.persistence.dao;

import java.util.ArrayList;
import java.util.List;

import com.cinema.persistence.EntityManagerProvider;
import com.cinema.persistence.model.Seat;

public class SeatDAO extends BasicDAO<Seat> {

	public SeatDAO(EntityManagerProvider entityManagerProvider) {
		super(entityManagerProvider);
	}

	public List<Seat> getAll(List<Long> seatIds) {
		List<Seat> seats = new ArrayList<Seat>(seatIds.size());
		for (long seatId : seatIds) {
			seats.add(getById(seatId));
		}
		return seats;
	}
}
