package dev.pustelnikov.service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import dev.pustelnikov.model.HomeDevice;

public class HomeDeviceService {
	
	private List<HomeDevice> devices;
	
	public HomeDeviceService() {
		HomeDevice ceilingChandelier = new HomeDevice("Ceiling Chandelier", 300, false);
		HomeDevice computer = new HomeDevice("Computer", 100, false);
		HomeDevice fridge = new HomeDevice("Fridge", 200, false);
		HomeDevice kettle = new HomeDevice("Kettle", 1500, false);
		HomeDevice microwave = new HomeDevice("Microwave", 2000, false);
		HomeDevice tableLamp = new HomeDevice("Table lamp", 10, false);
		HomeDevice tv = new HomeDevice("TV", 150, false);
		devices = new ArrayList<>();
		devices.add(ceilingChandelier);
		devices.add(computer);
		devices.add(fridge);
		devices.add(kettle);
		devices.add(microwave);
		devices.add(tableLamp);
		devices.add(tv);
	}
	
	public List<HomeDevice> getDevices() {
		return devices;
	}

	public void sortByPower() {
		devices.sort(Comparator.comparing(d -> d.getPower()));
	}
	
	public List<HomeDevice> filterByPowerRange(int fromPower, int toPower) {
		List<HomeDevice> filteredByPowerDevices = devices.stream()
				.filter(d -> d.getPower() >= fromPower && d.getPower() <= toPower)
				.collect(Collectors.toCollection(ArrayList::new));
		return filteredByPowerDevices;
	}
	
	public int calculatePowerOfTurnedOnDevices() {
		int sum = devices.stream()
				.filter(d -> d.isStatus() == true)
				.mapToInt(d -> d.getPower())
				.sum();
		return sum;
	}
}
