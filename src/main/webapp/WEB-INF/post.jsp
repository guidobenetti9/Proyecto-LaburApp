<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${post.jobsInPost.jobName}</title>
</head>
<body>
<h3>${post.postTittle}</h3>
<h4>${post.creatorPost.firstName} ${post.creatorPost.lastName}</h4>
<p>Descripcion: ${post.postDescription}</p>
<p>Dias Disponibles: ${post.availableDays}</p>
<p>Horario: ${post.availableHours}</p>
<p>Ubicacion: ${post.province}, ${post.city}</p>
<br>
<br>
<h4>Reseñas</h4>
<c:forEach items="${reviews}" var="review">
	<p>${review.senderReview.firstName} ${review.senderReview.lastName}</p>
	<p>${review.createdAt}</p>
	<p>${review.comment}</p>
	<p>${review.stars}</p>
</c:forEach>
<h4>Mandar un comentario</h4>
<form:form action="/review/create/${post.id}" method="POST" modelAttribute="newReview" >
					<div>
						<form:textarea path="comment" class="form-control" />
						<form:errors path="comment" class="text-danger" />
					</div>
					<div>
						<form:label path="stars" >Estrellas:</form:label>
						<form:input path="stars" type="number" class="form-control" />
						<form:errors path="stars" class="text-danger" />
					</div>
					<form:hidden path="postReview" value="${post.id}" />
					<form:hidden path="senderReview" value="${userInSession.id}" />
					<input type="submit" class="btn btn-primary" value="Register" >
				</form:form>
</body>
</html>