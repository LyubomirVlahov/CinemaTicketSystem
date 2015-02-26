<%@page import="com.cinema.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Успешно закупени билети!</title>
	<link rel="stylesheet" href="styles/Style.css" type="text/css" media="all" />
	<link href="styles/visStyles.css" type="text/css" rel="stylesheet" />
	<link href="styles/visStylesUser.css" type="text/css" rel="stylesheet" />
	<link href="styles/global.css" type="text/css" rel="stylesheet" />
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
			if(request.getParameter("UUID") == null){
            	   request.setAttribute(Constants.ERR_MSG_ATTR_NAME, "Липсва параметър в заявката с име 'UUID'");
            	   request.getRequestDispatcher("error.jsp").forward(request, response);
            	   return;
               }
		 %>
			<h1>Вашите билети бяха закупени успешно.</h1><br><br>
			<h2>Уникалният номер на вашата резервация е:</h2><br>
			<h2 style="color: green;"><%= request.getParameter("UUID") %></h2><br>
			<h2>Моля представете го на касата, за да получите своите билети.</h2>
			<br>
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