<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fare Information</title>
</head>
<body>
<jsp:include page="index.jsp" />
	<div class="menuHead col-md-offset-3">Fare Information</div>

	<div class="subBody">
		<form class="form-horizontal" action="FareInfoServlet" method="post">
			<div class="form-group">
				<label for="inputFlighCode"
					class="col-sm-2 col-md-offset-2 control-label">Enter Flight
					Number</label>
				<div class="col-sm-3">
					<input type="text" required class="form-control" id="inputFlightCode" name="inputFlightCode"
						placeholder="E.g. E1215">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-10">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</div>
			</form>
			
			<div class="col-md-7 col-md-offset-2">
			<%
				if (request.getAttribute("Result") != "Invalid"
						&& request.getAttribute("Result") != null) {
					ResultSet rs = (ResultSet) request.getAttribute("Result");
			%>

			<h4>Fare Information for given Flight</h4>
			<table class="table table-hover">

				<tr>
					<th>Flight_number</th>
					<th>Fare_code</th>
					<th>Amount</th>
					<th>Restrictions</th>
				</tr>
				<%
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
				</tr>

				<%
					}
				%>
			</table>
			<%
				} else if (request.getAttribute("Result") == "Invalid")  {
			%>
			<h4>Sorry no result found for your request..!!</h4>
			<%
				}
			%>

		</div>
			
	</div>
</body>
</html>