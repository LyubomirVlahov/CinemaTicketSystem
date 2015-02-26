<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Check-In</title>
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/Style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="/CinemaTicketSystem/styles/global.css" type="text/css" media="all" />
	<script src="/CinemaTicketSystem/javascript/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="/CinemaTicketSystem/javascript/checkIn.js"></script>
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
			
				<h1 style="display: inline; margin-top: 20px;">Въведете кода на резервацията: </h1>
				<input id="uuidInput" type="text" name="UUID" size="35" autofocus/>	
					
				<div style="text-align: right;" onclick="checkIn()">
             		<a class="btn">Отметни</a>
             	</div>
			
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