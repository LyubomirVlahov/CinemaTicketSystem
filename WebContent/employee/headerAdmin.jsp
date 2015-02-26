<!DOCTYPE>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Основна страница</title>
<body>
<!-- Header -->
	<div id="header">
		<h1 id="logo"><a href="administration.jsp">TU Cinema</a></h1>
		<div class="social">
			
		</div>
		<!-- Navigation -->
		<div id="navigation">
			<ul>		
				<li style="font-size:14px; font-weight: bold; color: #00CC00;"> Добре дошъл, <%= request.getUserPrincipal().getName()%> </li>
			    <li><a href="/CinemaTicketSystem/employee/administration.jsp">Начало</a></li>
			    <li><a href="/CinemaTicketSystem/employee/CheckReservation.jsp">Чекиране</a></li> 
			    <li><a href="/CinemaTicketSystem/employee/ShowUserTickets.jsp">Търси</a></li> 
			    <li><a href="/CinemaTicketSystem/Logout.jsp">Изход</a></li> 
			</ul>
		</div>
		<!-- end Navigation -->
		
		<!-- Sub-menu -->
		<div id="sub-navigation">
			
		</div>
		<!-- end Sub-Menu -->
		
	</div>
	<!-- end Header -->
</body>
</html>