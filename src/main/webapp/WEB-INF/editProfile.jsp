<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar perfil</title>
</head>
<body>
	<header>              
            <!-- Barra de Navegaciï¿½n -->
            <nav class="uk-navbar-container" uk-navbar>
                <div class="uk-navbar-left">
                    <div class="uk-width-logo">
                        <a href="/">
                            <img src="logo.png" class="uk-width-1-1 uk-margin-small-left">
                        </a>
                    </div>
                    <ul class="uk-navbar-nav">   
                        <li><a href="/contact">Contacto</a></li>                    
                        <li><a href="/help">Ayuda</a></li>                      
                    </ul>
                </div>
                <div class="uk-navbar-center">
                    <form class="uk-search uk-search-default" action="/findUsers" method="get">
                        <input class="uk-search-input" type="search" placeholder="Buscar Usuarios" name="search">
                        <button class="uk-search-icon-flip" uk-search-icon type="submit"></button>
                    </form>
                </div>
                <div class="uk-navbar-right uk-margin-medium-right">
                    <c:if test="${userInSession == null}">
                        <ul class="uk-navbar-nav">
                            <li><a href="/login">Iniciar Sesión</a></li>                                                      
                        </ul>
                        <ul class="register-button">
                        	<li ><a href="/register" class="btn-registrarse">REGISTRARSE</a></li>
                        </ul>
                    </c:if>
                    
                        <div class="uk-navbar-right">
				            <div class="uk-navbar-right">
							    <ul class="uk-navbar-nav">
							        <li><a href="/">${userInSession.firstName} ${userInSession.lastName}</a></li>
							        <li><a href="/" class="icon-config" uk-icon="icon: cog"></a></li>
							        <li><a href="/logout" class="icon-logout"><i class="fa fa-sign-out-alt"></i></a></li>
							    </ul>
							</div>          
			        	</div>
                                    
                </div>      
            </nav>
        </header>
        <div>
			<div class="cont_titulo">
            	<h2>Edita tu perfil</h2>
			</div>
				<form:form action="/editProfile" method="post" modelAttribute="newUser">
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
						<form:label path="username" >Nombre de Usuario:</form:label>
						<form:input path="username"/>
						<form:errors path="username"/>
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
					<div class="cajita">
						<form:label path="nationality" >Nacionalidad:</form:label>
						<form:input path="nationality"/>
						<form:errors path="nationality"/>
					</div>
					<div class="cajita">
						<form:label path="province" >Provincia:</form:label>
						<form:input path="province"/>
						<form:errors path="province"/>
					</div>
					<div class="cajita">
						<form:label path="city" >Ciudad:</form:label>
						<form:input path="city"/>
						<form:errors path="city"/>
					</div>
					<div class="cajita">
						<form:label path="phone" >Telefono:</form:label>
						<form:input path="phone"/>
						<form:errors path="phone"/>
					</div>
					<div class="cajita">
						<form:label path="alternativePhone" >Telefono alternativo:</form:label>
						<form:input path="alternativePhone"/>
						<form:errors path="alternativePhone"/>
					</div>
					<div class="cajita">
						<form:label path="facebook" >Facebook:</form:label>
						<form:input path="facebook"/>
						<form:errors path="facebook"/>
					</div>
					<div class="cajita">
						<form:label path="twitter" >Twitter:</form:label>
						<form:input path="twitter"/>
						<form:errors path="twitter"/>
					</div>
					<div class="cajita">
						<form:label path="instagram" >Instagram:</form:label>
						<form:input path="instagram"/>
						<form:errors path="instagram"/>
					</div>
					<div class="cajita">
						<form:label path="linkedin" >Linkedin:</form:label>
						<form:input path="linkedin"/>
						<form:errors path="linkedin"/>
					</div>
                    
                    <form:hidden path="id" value="${userInSession.id}"/>
                    <!--<form:hidden path="password" value="${user.password}"/>
                    <form:hidden path="confirm" value="${confirm}"/>-->
                    <input type="hidden" value="put" name="_method">
					<div class="cont_boton">
						<input type="submit" value="Editar" class="boton">
						<a href="/" class="">Cancelar</a>
					</div>
				</form:form>
        </div>
</body>
</html>