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
	<link rel="stylesheet" href="styles/Style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="styles/global.css" type="text/css" media="all" />
	<script src="javascript/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="javascript/jquery-func.js"></script>
	<script type="text/javascript" src="javascript/movies.js"></script>
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
			<div class="head"> </div>
				
			
			<% MovieDAO movieDAO = new MovieDAO(EntityManagerProviderImpl.getInstance());
			List<Movie> movies = movieDAO.getAll();
				for(Movie movie : movies){ %>
					<div class="movie">
						<div class="movie-image">	
							<a href="#" onClick="unhide(document.getElementById('<%= movie.getId() %>').id);"><span class="play"><span class="name"><%= movie.getTitle() %></span></span><img src="<%= movie.getPosterURL() %>" alt="movie" /></a>	
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

	<% for(Movie movie : movies){ %>
		<div style="display: none; margin-top: 2rem;" id="<%= movie.getId() %>" class="movieDescr">
			<h1><%= movie.getTitle() %> </h1>
			<h3>Жанр: <%= movie.getType() %></h3> 
			 <h3>Продължителност: <%=movie.getDuration()/60 %> минути</h3> 
			 </br>
			 
			<p>Описание: <%= movie.getDescription() %> </p>
			</br></br>
			
			<h4>Следваща прожекция: 
			<% Date nextDate=movie.getProjection().getStartDate();
			SimpleDateFormat formatter = new SimpleDateFormat("H:mm dd/M/yyyy");
			%> <%=formatter.format(nextDate) %> </h4> 
			
              <div style="text-align: right;" onclick="javascript:window.location='Reservation.jsp?projectionId=<%=movie.getProjection().getId()%>';" >
              	<a class="btn">Резервирай</a>
              </div>
		</div>
	<%}%>
		
		
	
	<jsp:include page="footer.jsp" />
</div>
<!-- end Shell -->
</body>
</html>