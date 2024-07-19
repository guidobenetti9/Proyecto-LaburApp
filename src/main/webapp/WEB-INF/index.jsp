<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit-icons.min.js"></script>
</head>
<body>
	<div>
		<c:if test="${userInSession == null}">
			<a href="/register" class="uk-button uk-button-default">Registro</a>
			<a href="/login" class="uk-button uk-button-default">Iniciar sesión</a>
		</c:if>
		<c:if test="${userInSession != null}">
			<a href="/logout" class="uk-button uk-button-default">Cerrar sesión</a>
		</c:if>
	</div>
</body>
</html>