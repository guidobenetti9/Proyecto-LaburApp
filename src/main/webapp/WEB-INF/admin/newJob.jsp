<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear oficio</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit-icons.min.js"></script>
</head>
<body>
<div class="uk-container">
		<nav class="uk-navbar-container uk-flex-inline uk-width-1-1">
			<div>
				<h2>ADMIN | LABURAPP</h2>
			</div>
			<div>
				<a class="uk-button uk-button-default" href="/logout">Cerrar sesión</a>
			</div>
		</nav>
		<div class="uk-padding">
			<form:form action="/createNewJob" method="post" modelAttribute="job">
				<h1>Nuevo oficio</h1>
				<div>
					<form:label path="jobName">Nombre del oficio:</form:label>
					<form:input path="jobName" class="uk-input"/>
					<form:errors path="jobName" />
				</div>
				<input type="submit"  value="submit" class="uk-button uk-button-secondary">
				<a href="/dashboard" class="uk-button uk-button-danger">cancel</a>
			</form:form>
		</div>
</div>
	

</body>
</html>