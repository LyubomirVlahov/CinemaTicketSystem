package com.cinema.persistence.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "HALLS")
public class Hall implements IDBEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	private Long id;

	@Column(name = "ROWS_COUNT")
	private byte rowsCount;

	@Column(name = "COLUMNS_COUNT")
	private byte columnsCount;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "hall", fetch = FetchType.EAGER, targetEntity = Seat.class)
	private List<Seat> seats;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "hall", fetch = FetchType.EAGER, targetEntity = Projection.class)
	private List<Projection> projections;

	public Hall() {
	}

	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public byte getRowsCount() {
		return rowsCount;
	}

	public void setRowsCount(byte rowsCount) {
		this.rowsCount = rowsCount;
	}

	public byte getColumnsCount() {
		return columnsCount;
	}

	public void setColumnsCount(byte columnsCount) {
		this.columnsCount = columnsCount;
	}

	public List<Seat> getSeats() {
		if (seats == null) {
			seats = new ArrayList<>();
		}
		return seats;
	}

	public void setSeats(List<Seat> seats) {
		this.seats = seats;
	}

	public void addSeat(Seat seat) {
		getSeats().add(seat);
		if (seat.getHall() != this) {
			seat.setHall(this);
		}
	}

	public List<Projection> getProjections() {
		if (projections == null) {
			projections = new ArrayList<>();
		}
		return projections;
	}

	public void setProjections(List<Projection> projections) {
		this.projections = projections;
	}

	public void addProjection(Projection projection) {
		getProjections().add(projection);
		if (projection.getHall() != this) {
			projection.setHall(this);
		}
	}
}