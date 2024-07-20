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
                <form class="uk-search uk-search-default">
                    <input class="uk-search-input" type="search" placeholder="Buscar">
                    <button class="uk-search-icon-flip" uk-search-icon></button>
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
        		<h2>Publicaciones</h2>
        	</div>
        	<div class="uk-width-1-1">
	        	<c:forEach items="${allPosts}" var="post">
	        			<div class="uk-card uk-card-default uk-card-hover uk-margin-top">
							    <div class="uk-card-header">
							    	<p class="uk-text-meta uk-margin-remove-bottom"><time datetime="${post.createdAt}">${post.createdAt}</time></p>
							        <h3 class="uk-card-title uk-margin-remove-top">${post.postTittle}</h3>
							    </div>
							    <div class="uk-card-body">
							    	<p>${post.city}, ${post.province}</p>
							    </div>
							    <div class="uk-card-footer">
							    	<div class="uk-flex-inline">
							    		<span uk-icon="star"></span>
							    		<span uk-icon="star"></span>
							    		<span uk-icon="star"></span>
							    		<span uk-icon="star"></span>
							    		<span uk-icon="star"></span>
							    	</div>
							    	<a href="/post/${post.id}" class="uk-button uk-button-text">Ver</a>
							    </div>
						</div>
	        	</c:forEach>
        	</div>
        </div>
    </main>
</body>
</html>