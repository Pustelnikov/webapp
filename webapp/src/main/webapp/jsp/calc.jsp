<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dev.pustelnikov.service.HomeDeviceService" %>
    <%@ page import="dev.pustelnikov.model.HomeDevice" %>
	<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Result</title>
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<%
			HomeDeviceService service = (HomeDeviceService) request.getAttribute("service"); 
			Integer sumPower = (Integer) request.getAttribute("sumPower");
			List<HomeDevice> devices = service.getDevices();
		%>
		<div class="main">
			<h2>Calculating result</h2>
			<p>Calculated power consumption of turned on devices</p>
			<br>
			<div>
				<table>
					<%
						for (HomeDevice device : devices) {
							if (device.isStatus()) {
								out.println("<tr>" + "<td>" + device.toString() + "</td>" + "</tr>");
							}
						}
					%>
				</table>
			</div>
			<br>
			<div>
				<% out.println("Total power consumption: " + sumPower); %>
			</div>
			<br>
			<div>
				<button type="button" onclick='window.location.href="http://localhost:8080/webapp/start"'>Return</button>
			</div>
		</div>
	</body>
</html>