<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear Trabajo</title>

</head>
<body>
<h2>Nuevo Trabajo</h2>
				<div>
				<form:form action="/job/create" method="POST" modelAttribute="newJob" >
					<div>
						<form:label path="jobName" >Trabajo:</form:label>
						<form:input path="jobName"/>
						<form:errors path="jobName"/>
					</div>
					<input type="submit" value="Guardar" >
				</form:form>
				</div>
</body>
</html>