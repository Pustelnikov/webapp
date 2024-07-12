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
			List<HomeDevice> devices = (List<HomeDevice>) request.getAttribute("filteredList");
			String from = request.getParameter("from");
			String to = request.getParameter("to");
		%>
		<div class="main">
			<h2>Filtering result</h2>
			<p> Filtered devices by power range <% out.println("from " + from + " to " + to); %></p>
			<br>
			<div>
				<table>
					<%
						for (HomeDevice device : devices) {
						out.println("<tr>" + "<td>" + device.toString() + "</td>" + "</tr>");
						}
					%>
				</table>
			</div>
			<br>
			<div>
				<button type="button" onclick='window.location.href="http://localhost:8080/webapp/start"'>Return</button>
			</div>
		</div>
	</body>
</html>