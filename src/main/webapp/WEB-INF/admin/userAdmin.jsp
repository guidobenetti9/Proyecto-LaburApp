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

<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
	<div class="uk-container">
		<nav class="uk-navbar-container">
			<div class="uk-flex-inline uk-flex-center">
				<h2>ADMIN | LABURAPP</h2>
				<div>
					<a class="uk-button uk-button-default" href="/logout">Cerrar sesión</a>
				</div>
			</div>
			<div>
				<ul class="uk-list uk-flex-inline uk-width-1-1">
					<li class="width-1-1"><a class="uk-button uk-button-default " href="/dashboard">Users</a></li>
					<li class="width-1-6"><a class="uk-button uk-button-default " href="/adminmessages">Messages</a></li>
					<li class="width-1-6"><a class="uk-button uk-button-default " href="/adminjobs">Jobs</a></li>
					<li class="width-1-6"><a class="uk-button uk-button-default " href="/adminposts">Posts</a></li>
					<li class="width-1-6"><a class="uk-button uk-button-default " href="/adminreviews">Reviews</a></li>
					<li class="width-1-6"><a class="uk-button uk-button-default " href="/adminworks">Works</a></li>
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
					<th>Es admin</th>
					<th>Created at</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allUsers}" var="user">
					<tr>
						<td>${user.id}</td>
						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td>${user.email}</td>
						<td>${user.birthDate}</td>
						<td>${user.nationality}</td>
						<td>${user.province}</td>
						<td>${user.city}</td>
						<td>${user.phone}</td>
						<td>${user.alternativePhone}</td>
						<td>${user.esAdmin}</td>
						<td>${user.createdAt}</td>
						<td>
							<form action="/user/delete/${user.id}" method="post">
								<input type="hidden" name="_method" value="DELETE">
								<input type="submit" value="Delete" class="uk-button uk-button-default">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>