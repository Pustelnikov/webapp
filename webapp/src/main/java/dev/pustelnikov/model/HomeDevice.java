package dev.pustelnikov.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class HomeDevice {
	
	private String description;
	private int power;
	private boolean status;
	
	private String printStatus() {
		if (status) {
			return "Switched On";
		} else {
			return "Switched OFF";
		}
	}
	
	@Override
	public String toString() {
		return description + ", " + power + " Watt, " + this.printStatus();
	}
}