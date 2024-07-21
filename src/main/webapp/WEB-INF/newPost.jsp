<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear Publicacion</title>
</head>
<body>
<h2>Nueva Publicacion</h2>
				<!-- Generar una instancia -->
				<form:form action="/post/create" method="POST" modelAttribute="newPost" >
					<div>
						<form:label path="postTittle" >Titulo de Publicacion:</form:label>
						<form:input path="postTittle" class="form-control" />
						<form:errors path="postTittle" class="text-danger" />
					</div>
					<div>
						<form:label path="postDescription" >Descripcion:</form:label>
						<form:input path="postDescription" class="form-control" />
						<form:errors path="postDescription" class="text-danger" />
					</div>
					<div>
						<form:label path="availableDays" >Dias Disponibles:</form:label>
						<form:checkboxes path="availableDays" items="${days}"/><br>
						<form:errors path="availableDays" class="text-danger" />
					</div>
					<div>
						<form:label path="availableHours" >Horas Disponibles:</form:label>
						<form:input path="availableHours" class="form-control" />
						<form:errors path="availableHours" class="text-danger" />
					</div>
					<div>
						<form:label path="province" >Provincia:</form:label>
				        <form:select path="province">
          					<form:options items="${provinces}" />
      					</form:select>
						<form:errors path="province" class="text-danger" />
					</div>
					<div>
						<form:label path="city" >Localidad:</form:label>
						<form:input path="city" class="form-control" />
						<form:errors path="city" class="text-danger" />
					</div>
					<div>
						<form:label path="jobsInPost" >Rubro:</form:label>
						<form:select path="jobsInPost">
          					<form:options items="${jobs}" itemValue="id" itemLabel="jobName" />
      					</form:select>
						<form:errors path="jobsInPost" class="text-danger" />
					</div>
					<form:hidden path="creatorPost" value="${userInSession.id}" />
					<input type="submit" class="btn btn-primary" value="Register" >
				</form:form>
</body>
</html>