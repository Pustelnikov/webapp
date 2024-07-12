package dev.pustelnikov.controller;

import java.io.IOException;
import dev.pustelnikov.service.HomeDeviceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class CalculatingServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HomeDeviceService service = new HomeDeviceService();
		String[] checked = request.getParameterValues("checked");
		if (checked == null) {
			request.getRequestDispatcher("/jsp/start.jsp").forward(request, response);
		} else {
			for (int i = 0; i < checked.length; i++) {
				int index = Integer.parseInt(checked[i]);
				service.getDevices().get(index).setStatus(true);
		}
		Integer sumPowerOfTurnedOnDevices = service.calculatePowerOfTurnedOnDevices();
		request.setAttribute("service", service);
		request.setAttribute("sumPower", sumPowerOfTurnedOnDevices);
		request.getRequestDispatcher("/jsp/calc.jsp").forward(request, response);
		}
	}
}
