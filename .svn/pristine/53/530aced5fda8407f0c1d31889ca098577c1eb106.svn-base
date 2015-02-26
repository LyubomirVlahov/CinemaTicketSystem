package com.cinema.persistence.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "MOVIES")
public class Movie implements IDBEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(name = "TITLE")
	private String title;

	@Column(name = "description", length = 10000)
	private String description;

	@Column(name = "TYPE")
	private String type;

	@Column(name = "POSTER_URL")
	private String posterURL;

	@Column(name = "DURATION_IN_SECONDS")
	private long duration;

	@OneToOne(cascade = CascadeType.ALL)
	private Projection projection;

	public Movie() {
	}

	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public long getDuration() {
		return duration;
	}

	public void setDuration(long duration) {
		this.duration = duration;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPosterURL() {
		return posterURL;
	}

	public void setPosterURL(String posterURL) {
		this.posterURL = posterURL;
	}

	public Projection getProjection() {
		return projection;
	}

	public void setProjection(Projection param) {
		this.projection = param;
	}
}