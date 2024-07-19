<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
		<form:form action="/createNewJob" method="post" modelAttribute="job">
			<h1>Create Job</h1>
			<div>
				<form:label path="jobName">Job Name:</form:label>
				<form:input path="jobName" />
				<form:errors path="jobName" />
			</div>
			<input type="submit"  value="submit">
			<a href="/dashboard" >cancel</a>
		</form:form>
	</div>

</body>
</html>