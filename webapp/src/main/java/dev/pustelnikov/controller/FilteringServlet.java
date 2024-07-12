package dev.pustelnikov.controller;

import java.io.IOException;
import java.util.List;
import dev.pustelnikov.model.HomeDevice;
import dev.pustelnikov.service.HomeDeviceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class FilteringServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int from = Integer.parseInt(request.getParameter("from"));
		int to = Integer.parseInt(request.getParameter("to"));
		HomeDeviceService service = new HomeDeviceService();
		service.sortByPower();
		List<HomeDevice> filteredList = service.filterByPowerRange(from, to);
		request.setAttribute("filteredList", filteredList);
		request.getRequestDispatcher("/jsp/filt.jsp").forward(request, response);
	}
}
