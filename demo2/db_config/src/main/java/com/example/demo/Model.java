package com.example.demo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Model {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	private int number;

	public void setNumber(int number) {
		this.number = number;
	}

	public int getNumber() {
		return number;
	}

}
