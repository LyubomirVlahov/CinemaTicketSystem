<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.cinema.persistence.model.Movie"%>
<%@page import="com.cinema.persistence.EntityManagerProviderImpl"%>
<%@page import="com.cinema.persistence.dao.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Основна страница</title>
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/Style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/global.css" type="text/css" media="all" />
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
			
			<% MovieDAO movieDAO = new MovieDAO(EntityManagerProviderImpl.getInstance());
			List<Movie> movies = movieDAO.getAll();
				for(Movie movie : movies){ %>
					<div class="movie">
						<div class="movie-image">	
							<a href="#" onclick="javascript:window.location='ShowTickets.jsp?projectionId=<%=movie.getProjection().getId()%>';"><span class="play"><span class="name"><%= movie.getTitle() %></span></span><img src="<%= movie.getPosterURL() %>" alt="movie" /></a>	
						</div>
					</div>			
				<%		
				}
			%>	
			
		</div>
		<!-- end Box -->
			
			<div class="cl">&nbsp;</div>
	</div>
	<!-- end Content -->
		
	<div class="cl">&nbsp;</div>
</div>
<!-- end Main -->
	
	<jsp:include page="footerAdmin.jsp" />
</div>
<!-- end Shell -->
</body>
</html>