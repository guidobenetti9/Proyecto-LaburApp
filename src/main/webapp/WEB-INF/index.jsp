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
    <link rel="stylesheet" href="/css/index.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
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
        .uk-width-logo {
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
            width: 700px; /* Ancho del contenedor de b�squeda */
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
        .main-title {
            text-align: center;
            margin-top: 20px;
        }
        .description {
            text-align: center;
            margin-bottom: 20px;
        }
        .button-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }
        .button-container div {
            text-align: center;
        }
        .filter-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .uk-card {
            margin-top: 20px;
            width: auto; /* Ajustable al contenido */
        }
        .divider {
            border-top: 1px solid #ccc;
            margin: 20px auto;
            width: 80%; /* Reducir el ancho de las l�neas horizontales */
        }
        .vertical-divider {
            border-left: 1px solid #ccc;
            height: 100%;
            position: absolute;
            left: 50%;
            top: 0;
        }
        .button-container {
            position: relative;
        }
    </style>
</head>
<body>
    <div class="content">
        <header>              
            <!-- Barra de Navegaci�n -->
            <nav class="uk-navbar-container" uk-navbar>
                <div class="uk-navbar-left">
                    <div class="uk-width-logo">
                        <a href="#">
                            <img src="logonuevo.png" class="uk-width-1-1 uk-margin-small-left">
                        </a>
                    </div>
                    <ul class="uk-navbar-nav">   
                        <li><a href="#">Contacto</a></li>                    
                        <li><a href="#">Ayuda</a></li>                      
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
                            <li><a href="/login">Iniciar Sesi�n</a></li>
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
                                <a href="/logout" class="uk-button uk-button-danger">Cerrar sesi�n</a>
                            </div>
                        </div>
                    </c:if>
                </div>                       
            </nav>
        </header>
        
        <div class="main-title">
            <h1>LaburApp</h1>
            <p class="description">Encuentra y publica servicios f�cilmente. Con�ctate con profesionales y clientes en un solo lugar.</p>
        </div>

        <div class="divider"></div>

        <div class="filter-container">
            <button class="uk-button uk-button-primary" type="button">Filtros</button>
            <div uk-dropdown="animation: reveal-left; animate-out: true; duration: 700">
                <button class="uk-button uk-button-default" type="button">Rubro</button>
                <div uk-dropdown="animation: reveal-left; animate-out: true; duration: 700">
                    <ul class="uk-nav uk-dropdown-nav uk-panel-scrollable">
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
                        <li><a href="#">M�s antiguos</a></li>
                        <li class="uk-nav-divider"></li>
                        <li><a href="#">M�s recientes</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="divider"></div>

        <div class="button-container">
            <div>
                <h3>Publicar un nuevo servicio</h3>
                <p>Publica tu servicio para que otros puedan encontrarlo y contratarte.</p>
                <a href="/newPost" class="uk-button uk-button-secondary">Publicar servicio</a>
                <div class="uk-width-1-1">
                    <c:forEach items="${allPosts}" var="post">
                        <div class="uk-card uk-card-default uk-card-hover">
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

            <div class="vertical-divider"></div>

            <div>
                <h3>Crear solicitud de servicio</h3>
                <p>Solicita un servicio y encuentra a los mejores profesionales que puedan ayudarte.</p>
                <a href="/newRequest" class="uk-button uk-button-primary">Crear solicitud</a>
                <div class="uk-width-1-1">
                    <c:forEach items="${allRequests}" var="request">
                        <div class="uk-card uk-card-default uk-card-hover">
                            <div class="uk-card-header">
                                <p class="uk-text-meta uk-margin-remove-bottom"><time datetime="${request.createdAt}">${request.createdAt}</time></p>
                                <h3 class="uk-card-title uk-margin-remove-top">Solicitud de Servicio - Detalle</h3>
                            </div>
                            <div class="uk-card-body">
                                <p>${request.city}, ${request.province}</p>
                            </div>
                            <div class="uk-card-footer">
                                <div class="uk-flex-inline">
                                    <span uk-icon="clock"></span>
                                    <span uk-icon="clock"></span>
                                    <span uk-icon="clock"></span>
                                    <span uk-icon="clock"></span>
                                    <span uk-icon="clock"></span>
                                </div>
                                <a href="/request/${request.id}" class="uk-button uk-button-text">Ver</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    
    <footer class="uk-section uk-section-small uk-section-muted">
        <div class="uk-container">
            <div class="uk-grid-small" uk-grid>
                <div class="uk-width-expand@s">
                    <p class="uk-text-small">� 2024 LaburApp. Todos los derechos reservados.</p>
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