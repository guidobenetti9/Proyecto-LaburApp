<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard-Users</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/css/uikit.min.css" />

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit-icons.min.js"></script>
</head>
<body>
	<div class="uk-container">
		<nav class="uk-navbar-container">
			<div class="uk-flex-inline uk-flex-center">
				<h2>ADMIN | LABURAPP</h2>
				<a class="uk-button uk-button-default" href="">Cerrar sesión</a>
			</div>
			<div>
				<ul class="uk-list uk-flex-inline uk-width-1-6">
					<li><a class="uk-button uk-button-default" href="/adminusers">Users</a></li>
					<li><a class="uk-button uk-button-default" href="/adminmessages">Messages</a></li>
					<li><a class="uk-button uk-button-default" href="/adminjobs">Jobs</a></li>
					<li><a class="uk-button uk-button-default" href="/adminposts">Posts</a></li>
					<li><a class="uk-button uk-button-default" href="/adminreviews">Reviews</a></li>
					<li><a class="uk-button uk-button-default" href="/adminworks">Works</a></li>
				</ul>
			</div>
		</nav>
		<table class="uk-table uk-table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>First name</th>
					<th>Last name</th>
					<th>Email</th>
					<th>Birth date</th>
					<th>Nationality</th>
					<th>Province</th>
					<th>City</th>
					<th>Phone</th>
					<th>Alternative phone</th>
					<th>Jobs assigned</th>
					<th>Created at</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allUsers}" var="user">
					<tr>
						<td>${message.id}</td>
						<td>${message.firstName}</td>
						<td>${message.lastName}</td>
						<td>${message.email}</td>
						<td>${message.birthDate}</td>
						<td>${message.nationality}</td>
						<td>${message.province}</td>
						<td>${message.city}</td>
						<td>${message.phone}</td>
						<td>${message.alternativePhone}</td>
						<td>${message.jobsAssigned}</td>
						<td>${message.createdAt}</td>
						<td><a class="uk-button uk-button-default">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>