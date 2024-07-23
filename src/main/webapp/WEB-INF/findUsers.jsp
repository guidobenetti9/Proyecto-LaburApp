<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="css/index.css">
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit-icons.min.js"></script>
    <script src="uikit/dist/js/uikit-icons.min.js"></script>
</head>
<body>
    <header class="uk-section uk-section-secondary uk-padding-small">
        <div class="uk-container uk-margin-medium-left">
            <nav class="uk-navbar-container uk-navbar-transparent uk-flex-inline uk-width-1-1">
                <div class="uk-navbar-left">
                    <a href="#">
                        <img src="logonuevo.png" class="uk-width-1-6">
                    </a>
                </div>
                <div class="uk-navbar-right uk-margin-medium-right">
                    <h2>LaburApp: agarrá la pala</h2>
                </div>
            </nav>
        </div>
        <nav class="uk-navbar-container uk-navbar-transparent uk-flex-inline uk-width-1-1 uk-margin-top">
            <div class="uk-navbar-left">
                <form class="uk-search uk-search-default" action="/findUsers" method="get">
                    <input class="uk-search-input" type="search" placeholder="Buscar" name="search">
                    <button class="uk-search-icon-flip" uk-search-icon type="submit"></button>
                </form>
            </div>
            <div class="uk-navbar-right">
                <c:if test="${userInSession == null}">
			        <a href="/register" class="uk-button uk-button-default">Registrarse</a>
			        <a href="/login" class="uk-button uk-button-default">Iniciar sesión</a>
		        </c:if>
		        <c:if test="${userInSession != null}">
                    <div class="uk-flex-inline">
                        <div>
                        	<a href="/newPost" class="uk-button uk-button-default">Crear nueva publicación</a>
                            <p>${userInSession.firstName} ${userInSession.lastName}</p>
                            <a href="#">Ver perfil</a>
                        </div>
			            <a href="/logout" class="uk-button uk-button-default">Cerrar sesión</a>
                    </div>
		        </c:if>
            </div>
        </nav>
    </header>
    <main class="uk-flex-inline uk-width-1-1">
        <div>
        	<button class="uk-button uk-button-default" type="button">Filtrar</button>
        	<div uk-dropdown="animation: slide-bottom; animate-out: true">
		    	<ul class="uk-nav uk-dropdown-nav">
			        <li>
				        <form action="/filterDataProvince" method="get">
	          					<button type="submit" name="filter" value="Catamarca">Provincia</button>
	        			</form>
        			</li>
        			<li>
				        <form action="/filterDataJob" method="get">
	          					<button type="submit" name="filter" value="3">Rubro</button>
	        			</form>
        			</li>
        			<li>
				        <form action="/filterDataDateAsc" method="get">
	          					<button type="submit" name="filter">Mas Antiguos</button>
	        			</form>
        			</li>
        			<li>
				        <form action="filterDataDateDesc" method="get">
	          					<button type="submit" name="filter">Mas Recientes</button>
	        			</form>
        			</li>
        			<li class="uk-nav-divider"></li>
			        <li><a href="#">Rubro <span uk-icon="triangle-right"></span></a></li>
			        <li class="uk-nav-divider"></li>
			        <li><a href="#">Zona <span uk-icon="triangle-right"></span></a></li>
			        <li class="uk-nav-divider"></li>
			        <li><a href="#">Fecha <span uk-icon="triangle-right"></span></a></li>
    			</ul>
			</div>
        </div>
        <div>
        	<div>
        		<h2>Usuarios encontrados</h2>
        	</div>
        	<div class="uk-width-1-1">
	        	<c:forEach items="${users}" var="user">
	        			<div class="uk-card uk-card-default uk-card-hover uk-margin-top">
							    <div class="uk-card-header">
							    	<p class="uk-text-meta uk-margin-remove-bottom">Miembro desde: <time datetime="${user.createdAt}">${user.createdAt}</time></p>
							        <h3 class="uk-card-title uk-margin-remove-top">${user.firstName} ${user.lastName}</h3>
							        <h5 class="uk-card-title uk-margin-remove-top">@${user.username}</h5>
							        
							    </div>
							    <div class="uk-card-body">
							    	<p>${user.city}, ${user.province}</p>
							    </div>
							    <div class="uk-card-footer">
							    	<a href="#" class="uk-button uk-button-text">Ver</a>
							    </div>
						</div>
	        	</c:forEach>
        	</div>
        </div>
    </main>
</body>
</html>