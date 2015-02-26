<%@page import="com.cinema.persistence.model.Projection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cinema.persistence.model.Reservation"%>
<%@page import="com.cinema.persistence.model.User"%>
<%@page import="com.cinema.persistence.dao.UserDAO"%>
<%@page import="com.cinema.persistence.model.Ticket"%>
<%@page import="java.util.List"%>
<%@page import="com.cinema.persistence.EntityManagerProviderImpl"%>
<%@page import="com.cinema.persistence.EntityManagerProvider"%>
<%@page import="com.cinema.persistence.dao.TicketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="styles/visStyles.css" type="text/css" rel="stylesheet" />
<link href="styles/visStylesUser.css" type="text/css" rel="stylesheet" />
<link href="styles/global.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="styles/Style.css" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Профил</title>
</head>
<body>
<!-- Shell -->
<div id="shell">
<jsp:include page="header.jsp" />

<!-- Main -->
<div id="main">
	<!-- Content -->
	<div id="content">
	
		<!-- Box -->
		<div class="box">
		
		<% 
			UserDAO userDAO = new UserDAO(EntityManagerProviderImpl.getInstance());
			User user = userDAO.getByUsername(request.getUserPrincipal().getName());
		
			Projection userProjection= new Projection();
			
			List<Reservation> reservations = user.getReservations();		
			List<Ticket> userTickets= new ArrayList<Ticket>();
				
			
			for(Reservation reservation : reservations){
				userTickets.addAll(reservation.getTickets());
			}					
		%>
		
		<h1>Списък със закупени билети: </h1>
		
		<% for(Ticket ticket : userTickets){ 				
			userProjection=ticket.getReservation().getProjection(); %>	
				
			<div class="ticketInfo" >
				<h4>Филм: </h4> <%= userProjection.getMovie().getTitle() %> </br>
				<h4>Дата: </h4> <%= userProjection.getStartDate() %> </br>
				<h4>Място: </h4> ред: <%= ticket.getSeat().getRow() %>, място <%= ticket.getSeat().getColumn() %> </br>
				<h4>Цена: </h4> <%= userProjection.getPrice() %> </br>
				<h4>Код на резервацията: </h4> <%= ticket.getReservation().getUUID() %>
			</div>
		<%} %>
		
		</div>
		<!-- end Box -->
			
		<div class="cl">&nbsp;</div>
	</div>
	<!-- end Content -->
		
	<div class="cl">&nbsp;</div>
</div>
<!-- end Main -->
</div>
<!-- end Shell -->
<jsp:include page="footer.jsp" />
</body>
</html>