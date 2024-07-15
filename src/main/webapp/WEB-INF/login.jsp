<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio de Sesion</title>
</head>
<body>
	<div>
		<div>
			<div>
				<h2>Registrarse</h2>
				<form:form action="#" method="POST" modelAttribute="#" >
					<div>
						<form:label path="firstName" >Nombre:</form:label>
						<form:input path="firstName"/>
						<form:errors path="firstName"/>
					</div>
					<div>
						<form:label path="lastName" >Apellido:</form:label>
						<form:input path="lastName"/>
						<form:errors path="lastName"/>
					</div>
					<div>
						<form:label path="email" >E-mail:</form:label>
						<form:input path="email"/>
						<form:errors path="email"/>
					</div>
					<div>
						<form:label path="password" >Contraseña:</form:label>
						<form:password path="password"/>
						<form:errors path="password"/>
					</div>
					<div>
						<form:label path="confirm" >Confirmar Contraseña</form:label>
						<form:password path="confirm"/>
						<form:errors path="confirm"/>
					</div>
					<input type="submit" value="Registrarse" >
				</form:form>
			</div>
			<div>
				<h2>Iniciar Sesion</h2>
				<p>${errorLogin}</p>
				<form action="#" method="POST">
					<div>
						<label>E-mail:</label>
						<input type="email" name="email" >
					</div>
					<div>
						<label>Contraseña:</label>
						<input type="password" name="password" >
					</div>
					<input type="submit" value="Ingresar" >
				</form>
			</div>
		</div>
	</div>
</body>
</html>