<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Collection"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Регистрация</title>
	<link rel="stylesheet" href="styles/Register.css" type="text/css">
</head>

<body>
	<div class="container">
		<section id="content">
			<form id="form" method="POST" action="register" accept-charset="UTF-8">
				<h2>Създаване на потребител</h2>

				<div>
					<%if(request.getAttribute("errorUser") != null) { %>
					<span class="registerError"><%=request.getAttribute("errorUser") %></span>
					<% }%>
					<input type="text" placeholder="Потребител" name="user"
						id="username" autofocus required/>
				</div>

				<div>
					<%if(request.getAttribute("errorPass") != null) { %>
					<span class="registerError"><%=request.getAttribute("errorPass") %></span>
					<% }%>

					<input type="password" placeholder="Парола" name="pass"
						id="password" required/>
				</div>

				<div>
					<%if(request.getAttribute("errorConfirmPass") != null) { %>
					<span class="registerError"><%=request.getAttribute("errorConfirmPass") %></span>
					<% }%>

					<input type="password" placeholder="Повтори паролата"
						name="confirmPass" id="password" required/>
				</div>

				<div>
					<%if(request.getAttribute("errorFirstName") != null) { %>
					<span class="registerError"><%=request.getAttribute("errorFirstName") %></span>
					<% }%>

					<input type="text" placeholder="Име" name="firstName" id="username" required/>
				</div>

				<div>
					<%if(request.getAttribute("errorLastName") != null) { %>
					<span class="registerError"><%=request.getAttribute("errorLastName") %></span>
					<% }%>
					<input type="text" placeholder="Фамилия" name="lastName"
						id="username" required/>

				</div>

				<div>
					<%if(request.getAttribute("errorEmail") != null) { %>
					<span class="registerError"><%=request.getAttribute("errorEmail") %></span>
					<% }%>
					<input type="text" placeholder="Имейл" name="email" id="username" required/>
				</div>

				<div>
					<input type="submit" value="Създай профил" name="createProfile" />
					<a id="cancelUserCreation" href="Login.jsp">Отказ</a>
				</div>
			</form>
		</section>
	</div>
</body>
</html>