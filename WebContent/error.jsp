<%@page import="com.cinema.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Основна страница</title>
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/Style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/global.css" type="text/css" media="all" />
	<script src="javascript/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="/CinemaTicketSystem/javascript/jquery-func.js"></script>
	<script type="text/javascript" src="/CinemaTicketSystem/javascript/movies.js"></script>
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
			<% if(request.getAttribute(Constants.ERR_MSG_ATTR_NAME) != null){ %>
				<h1><%= request.getAttribute(Constants.ERR_MSG_ATTR_NAME) %></h1>
			<% } else { %>
				<h1>Възникна грешка на сървъра. Моля да ни извините за неудобството</h1>
			<% } %>
		</div>
		<!-- end Box -->
			
			<div class="cl">&nbsp;</div>
	</div>
	<!-- end Content -->
		
	<div class="cl">&nbsp;</div>
</div>


	<jsp:include page="footer.jsp" />
</div>
<!-- end Shell -->
</body>
</html>