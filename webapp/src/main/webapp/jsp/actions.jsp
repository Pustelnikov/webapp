<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dev.pustelnikov.service.HomeDeviceService" %>
<%@ page import="dev.pustelnikov.model.HomeDevice" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Action</title>
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<%
			HomeDeviceService service = (HomeDeviceService) request.getAttribute("service");
			List<HomeDevice> devices = service.getDevices();
		%>
		<div class="main">
			<h2>Action</h2>
			<p>There are list of home devices below, you can choose the action</p>
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
				<h3>1 Sort devices by power:</h3>
				<button type="button" onclick='window.location.href="http://localhost:8080/webapp/sort"'>Sort</button>
			</div>
			<br>
			<div>
				<h3>2 Filter devices by power range:</h3>
				<form action="filt">
					<table>
						<tr>
							<td>From:</td>
							<td><input type="number"  name="from" required><br></td>
						</tr>
			            <tr>
							<td>To:</td>
							<td><input type="number"  name="to" required><br></td>
						</tr>
		            </table>
		            <button type="submit" value="Submit">Filter</button>
            	</form>
            </div>
            <br>
            <div>
            	<h3>3 Turn on some devices and calculate its power</h3>
	            <form action="calc">
	            	<table>
		            	<% 
		            		for (int i = 0; i < devices.size(); i++) {
		            		out.print("<tr>" + "<td>");
							out.print("<input type=\"checkbox\"");
							out.print(" name=\"checked\"" + "value=" + "\"" + i + "\"" + ">" + devices.get(i).getDescription());
							out.print("</td>" + "</tr>");
							}
		            	%>
	            	</table>
	            	<button type="submit" value="Submit">Calculate</button>
	            </form>
        	</div>
        	<br>
        	<div>
				<button type="button" onclick='window.location.href="http://localhost:8080/webapp/logout"'>Logout</button>
			</div>
		</div>
	</body>
</html>