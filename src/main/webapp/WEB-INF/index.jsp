<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit-icons.min.js"></script>
    <script src="uikit/dist/js/uikit-icons.min.js"></script>
    <link rel="stylesheet" href="/css/index.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
        body {
            display: flex;
            flex-direction: column;
        }
        .content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .uk-navbar-container {
            background: rgb(32,32,32) !important;
            background: linear-gradient(0deg, rgba(32,32,32,1) 0%, rgba(32,32,32,1) 0%, rgba(40,40,40,1) 50%, rgba(43,43,43,1) 100%) !important; /* Gradiente */
        }
        .uk-navbar-nav > li > a {
            color: #fff !important; /* Color de texto blanco */
        }
        .uk-navbar-nav > li > a:hover {
            color: #ffcc00 !important; /* Color de texto al pasar el mouse */
        }
        .uk-width-logo{
            height: 50px;
            width: 50px;
        }
        .uk-navbar-center {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }
        .uk-search {
            position: relative;
            display: flex;
            width: 700px; /* Ancho del contenedor de busqueda */
        }
        .uk-search-input {
            background-color: #fff !important; /* Fondo blanco */
            width: 100%; /* Ancho del campo de b�squeda */
            padding-right: 40px; /* Espacio para el icono de la lupa */
            color: #000 !important; /* Color del texto */
        }
        .uk-search-icon-flip {
            position: absolute;
            right: 10px;
            top: 50%;            
            color: #000 !important; /* Color del icono */
        }
        .uk-search-input:focus {
            border-color: #ffcc00 !important; /* Color del borde al hacer clic */
        }
    </style>
</head>
<body>
    <div class="content">
        <header>              
            <!-- Barra de Navegacion-->
            <nav class="uk-navbar-container" uk-navbar>
                <div class="uk-navbar-left">
                    <div class="uk-width-logo">
                        <a href="#">
                            <img src="logonuevo.png" class="uk-width-1-1 uk-margin-left">
                        </a>
                    </div>
                    <ul class="uk-navbar-nav">
                        <li><a href="#">Inicio</a></li>
                        <li><a href="#">Ayuda</a></li>
                        <li><a href="#">Contacto</a></li>
                    </ul>
                </div>
                <div class="uk-navbar-center">
                    <form class="uk-search uk-search-default">
                        <input class="uk-search-input" type="search" placeholder="Buscar">
                        <button class="uk-search-icon-flip" uk-search-icon></button>
                    </form>
                </div>
                <div class="uk-navbar-right uk-margin-medium-right">
                    <c:if test="${userInSession == null}">
                        <ul class="uk-navbar-nav">
                            <li><a href="/login">Iniciar Sesion</a></li>
                            <li><a href="/register">Registrarse</a></li>
                        </ul>
                    </c:if>
                    <c:if test="${userInSession != null}">
                        <div class="uk-flex-inline">
                            <div class="cont_botones">
                                <p>${userInSession.firstName} ${userInSession.lastName}</p>
                                <a href="#" class="uk-link-muted">Ver perfil</a>
                            </div>
                            <div>
                            	<a href="/logout" class="uk-button uk-button-danger">Cerrar sesión</a>
                            </div>
                        </div>
                    </c:if>
                </div>                       
            </nav>
        </header>
        <main class="uk-flex-inline uk-width-1-1">
            <div class="cont_filtros">
                <button class="uk-button uk-button-default" type="button">Rubro</button>
                <div uk-dropdown="animation: reveal-left; animate-out: true; duration: 700">
                    <ul class="uk-nav uk-dropdown-nav">
                        <c:forEach items="${allJobs}" var="job">
                        	<li><a href="#">${job.jobName}</a></li>
                        	<li class="uk-nav-divider"></li>
                        </c:forEach>
                    </ul>
                </div>
                <button class="uk-button uk-button-default" type="button">Zona</button>
                <div uk-dropdown="animation: reveal-left; animate-out: true; duration: 700">
                    <ul class="uk-nav uk-dropdown-nav uk-panel-scrollable">
                        <c:forEach items="${provinces}" var="province">
                        	<li><a href="#">${province}</a></li>
                        	<li class="uk-nav-divider"></li>
                        </c:forEach>
                    </ul>
                </div>
                <button class="uk-button uk-button-default" type="button">Fecha</button>
                <div uk-dropdown="animation: reveal-left; animate-out: true; duration: 700">
                    <ul class="uk-nav uk-dropdown-nav">
                        <li><a href="#">Mas antiguos</span></a></li>
                        <li class="uk-nav-divider"></li>
                        <li><a href="#">Mas recientes</a></li>
                    </ul>
                </div>
            </div>
            <div>
                <div class="cont_titulo">
                    <h2>Publicaciones</h2>
                    <c:if test="${userInSession != null}">
                    	<div class="cont_publi">
                    		<a href="/newPost" class="uk-button uk-button-secondary">Crear nueva publicación</a>
                    	</div>
                    </c:if>
                </div>
                <div class="uk-width-1-1">
                    <c:forEach items="${allPosts}" var="post">
                        <div class="uk-card uk-card-default uk-card-hover uk-margin-top">
                            <div class="uk-card-header">
                                <p class="uk-text-meta uk-margin-remove-bottom"><time datetime="${post.createdAt}">${post.createdAt}</time></p>
                                <h3 class="uk-card-title uk-margin-remove-top">${post.creatorPost.firstName} ${post.creatorPost.lastName} - ${post.jobsInPost.jobName}</h3>
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
    </div>
    <footer class="uk-section uk-section-small uk-section-muted">
        <div class="uk-container">
            <div class="uk-grid-small" uk-grid>
                <div class="uk-width-expand@s">
                    <p class="uk-text-small">© 2024 LaburApp. Todos los derechos reservados.</p>
                </div>
                
                <div class="uk-width-auto@s">
                    <ul class="uk-iconnav">
                        <li><a href="#" uk-icon="icon: facebook"></a></li>
                        <li><a href="#" uk-icon="icon: twitter"></a></li>
                        <li><a href="#" uk-icon="icon: instagram"></a></li>
                        <li><a href="#" uk-icon="icon: linkedin"></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.6.22/js/uikit.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.6.22/js/uikit-icons.min.js"></script>
</body>
</html>