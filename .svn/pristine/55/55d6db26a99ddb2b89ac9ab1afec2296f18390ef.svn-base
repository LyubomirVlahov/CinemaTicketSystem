<%@page import="com.cinema.Constants"%>
<%@page import="com.cinema.persistence.dao.ProjectionDAO"%>
<%@page import="com.cinema.persistence.model.Movie"%>
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
<link rel="stylesheet" href="/CinemaTicketSystem/styles/Style.css" type="text/css" media="all" />
<link rel="stylesheet" href="/CinemaTicketSystem/styles/global.css" type="text/css" media="all" />
<link rel="stylesheet" href="/CinemaTicketSystem/styles/visStyles.css" type="text/css"/>
<link rel="stylesheet" href="/CinemaTicketSystem/styles/visStylesUser.css" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Профил</title>
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
		
		<% 
			String projectionIdString = request.getParameter("projectionId");
			if(null==projectionIdString){
	           request.setAttribute(Constants.ERR_MSG_ATTR_NAME, "Липсва параметър в заявката с име 'projectionId'");
	      	   request.getRequestDispatcher("/error.jsp").forward(request, response);
	      	   return;
	        }
			long projectionId = Long.valueOf(projectionIdString);
			ProjectionDAO projectionDAO = new ProjectionDAO(EntityManagerProviderImpl.getInstance());
			Projection projection= projectionDAO.getById(projectionId);
			if(null==projection){
		           request.setAttribute(Constants.ERR_MSG_ATTR_NAME, "Не съществува прожекция с ID " + projectionId);
		      	   request.getRequestDispatcher("/error.jsp").forward(request, response);
		      	   return;
			}
			List<Reservation> reservations = projection.getReservations();
		%>
		<%if(reservations.size() != 0) { %>
		<h1>Списък със закупени билети: </h1>
			
			<% for(Reservation reservation: reservations){ 				
				for(Ticket ticket : reservation.getTickets()){%>	
					
				<div class="ticketInfo" >
					<h4>Филм: </h4> <%= projection.getMovie().getTitle() %> 
					<h4 style="margin-left: 1rem;">Дата: </h4> <%= projection.getStartDate() %>
					<h4 style="margin-left: 1rem;">Място: </h4> ред: <%= ticket.getSeat().getRow() %>, място <%= ticket.getSeat().getColumn() %>
					<br>
					<h4>Цена: </h4> <%= projection.getPrice() %>
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
<jsp:include page="footerAdmin.jsp" />
</body>
</html>