<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard-Posts</title>
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
				<ul class="uk-list uk-flex-inline uk-width-1-6">
					<li><a class="uk-button uk-button-default" href="/dashboard">Users</a></li>
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
					<th>Title</th>
					<th>Province</th>
					<th>City</th>
					<th>Creator</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allPosts}" var="post">
					<tr>
						<td>${post.id}</td>
						<td>${post.postTittle}</td>
						<td>${post.province}</td>
						<td>${post.city}</td>
						<td>${post.creatorPost.firstName}</td>
						<td>
							<form action="/post/delete/${post.id}" method="post">
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