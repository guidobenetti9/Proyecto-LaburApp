<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registro</title>
	<link rel="stylesheet" href="/css/logreg.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Chakra+Petch:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
</head>
<body>
	<div class="contenedor">
        <div class="cont_loguito">
           <a href="/"><img src="logonuevo.png" class="loguito"></a>
        </div>
        <div>
			<div class="cont_titulo">
            	<h2>¡Registrate!</h2>
			</div>
				<form:form action="/register" method="POST" modelAttribute="newUser">
					<div class="cajita">
						<form:label path="firstName" >Nombre:</form:label>
						<form:input path="firstName"/>
						<form:errors path="firstName"/>
					</div>
					<div class="cajita">
						<form:label path="lastName" >Apellido:</form:label>
						<form:input path="lastName"/>
						<form:errors path="lastName"/>
					</div>
					<div class="cajita">
						<form:label path="email" >E-mail:</form:label>
						<form:input path="email"/>
						<form:errors path="email"/>
					</div>
					<div class="cajita">
						<form:label path="password" >Contraseña:</form:label>
						<form:password path="password"/>
						<form:errors path="password"/>
					</div>
					<div class="cajita">
						<form:label path="confirm" >Conf. Contraseña:</form:label>
						<form:password path="confirm"/>
						<form:errors path="confirm"/>
					</div>
                    <div class="cajita">
						<form:label path="birthDate" >Fecha de nacimiento:</form:label>
						<form:input type="date" path="birthDate"/>
						<form:errors path="birthDate"/>
					</div>
                    <form:hidden path="esAdmin" value="0"/>
					<div class="cont_boton">
						<input type="submit" value="Registrarse" class="boton">
					</div>
				</form:form>
        </div>
    </div>
</body>
</html>