
<%@page import="com.cinema.persistence.model.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cinema.persistence.model.Reservation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Check-In</title>
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/Style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/global.css" type="text/css" media="all" />
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/visStyles.css" type="text/css"/>
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/visStylesUser.css" type="text/css"/>
</head>
<body>
<!-- Shell -->
<div id="shell">
<jsp:include page="headerAdmin.jsp" />
<!-- Main -->
<div id="main">
	<!-- Content -->
	<div id="content">

		<!-- Box -->
		<div class="box">
			<div class="head"> </div>
			<form id="form" method="POST" action="/CinemaTicketSystem/employee/searchForUser.do">
				<h1 style="display: inline; margin-top: 20px; color: #ccc;">Потребител: </h1>
				<input id="user" type="text" name="user" size="35" autofocus/>	
					
				<div style="text-align: right;">
             		<input class="btn" type="submit" value="Търси"/>
             	</div>
             </form>
			
		</div>
		<!-- end Box -->
		
		<% 
			List<Ticket> userTickets= new ArrayList<Ticket>();
			
		    List<Reservation> searchingUserReservations = (List<Reservation>)request.getAttribute("userReservations");
		    List<Reservation> reservations = new ArrayList<Reservation>();
			if(searchingUserReservations != null) {
				for(int i = 0; i < searchingUserReservations.size(); i++) {
					Reservation reservation  = searchingUserReservations.get(i);
					reservations.add(reservation);
					userTickets.addAll(reservation.getTickets());
				}
							
				if(reservations.size() != 0) { %>
					<h1>Списък със закупени билети: </h1>
						
						<% for(Reservation reservation: reservations){ 				
							for(Ticket ticket : reservation.getTickets()){%>	
								
							<div class="ticketInfo" >
								<h4>Филм: </h4> <%= reservation.getProjection().getMovie().getTitle() %> 
								<h4 style="margin-left: 1rem;">Дата: </h4> <%= reservation.getProjection().getStartDate() %>
								<h4 style="margin-left: 1rem;">Място: </h4> ред: <%= ticket.getSeat().getRow() %>, място <%= ticket.getSeat().getColumn() %>
								<br>
								<h4>Цена: </h4> <%= reservation.getProjection().getPrice() %>
								<h4 style="margin-left: 1rem;">Потребител: </h4><%=ticket.getReservation().getUser().getUsername()%>
								<h4 style="margin-left: 1rem;">Дошъл: </h4>
								<% if(ticket.isChecked()){
										out.append("Да");
									}
									else{ out.append("Не");
									}%>
							</div>
						<%}} %>
					<%} else { %>
						<h1>Няма закупени билети за този филм! </h1>
					<%} %>
		  <%} %>
		
		
			
			<div class="cl">&nbsp;</div>
	</div>
	<!-- end Content -->
		
	<div class="cl">&nbsp;</div>
</div>
<!-- end Main -->
	
</div>
<!-- end Shell -->
<jsp:include page="footerAdmin.jsp" />
</body>
</html>