<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            background: rgb(33,33,33) !important;
			background: linear-gradient(0deg, rgba(33,33,33,1) 0%, rgba(28,28,28,1) 18%, rgba(19,19,19,1) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%) !important; /* Gradiente */			
        }
        .uk-navbar-nav> li > a {
            color: #fff !important; /* Color de texto blanco */
        }
        .uk-navbar-nav> li > a:hover {
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
            width: 700px; /* Ancho del contenedor de bï¿½squeda */
        }
        .uk-search-input {
            background-color: #fff !important; /* Fondo blanco */
            width: 100%; /* Ancho del campo de bï¿½squeda */
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
          	
    	.register-button{  	
    	list-style-type: none;  	
    	}
	    .btn-registrarse {
        border: 2px solid #dfb550; /* Color del borde igual al color del h5 en el footer */
        color: #dfb550; /* Color del texto igual al color del h5 en el footer */       
        text-decoration: none;/* Elimina el subrayado */
        border-radius: 4px; /* Bordes redondeados*/
        display: inline-block;
        box-sizing: border-box;
        min-width: 150px; /* Establece un ancho mínimo para el botón*/        
        line-height: 1.5; /* Ajusta la altura de línea para centrar el texto verticalmente */
        text-align: center; /* Centra el texto horizontalmente */
        transition: background-color 0.3s, color 0.3s; /* Añade transición suave para hover */
    	}
	
	    .btn-registrarse:hover {
	        background-color: #dfb550; /* Color de fondo cuando el cursor pasa sobre el boton */
	        color: #000000 !important; /* Color del texto cuando el ursor pasa sobre el boton */
	        text-decoration: none;
	        font-weight: bold; /* Texto en negrita*/
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
            width: 80%; /* Reducir el ancho de las lï¿½neas horizontales */
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
        
        /*AQUI COMIENZA EL FOOTER*/
       	footer {
            background: rgb(33,33,33);
			background: linear-gradient(180deg, rgba(33,33,33,1) 0%, rgba(28,28,28,1) 18%, rgba(19,19,19,1) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%);
            padding: 20px 0;
            margin-top: 70px;
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px 0;
        }

        .footer-column {
            flex: 1;
            padding: 0 20px;
        }
        
        .footer-column1 {
            align-items: center;
        }

        h5 {
            margin-bottom: 10px;
            color: #dfb550;
        }

        .footer-column ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-column ul li {
            margin-bottom: 10px;
            display: list-item;
            unicode-bidi: isolate;
            font-size: small;
        }

        .footer-column ul li a {
            color: rgb(119, 119, 119);
            text-decoration: none;
        }

        .footer-column ul li a:hover {
            color: white;
        }

        .footer-bottom {
            background: #181818;
            color: #e0e0e0;
            padding: 10px 20px; /* Ajustar padding para incluir espacio */
            font-size: 14px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .footer-bottom button{
            color: white !important;
        }

        .separator {
            width: 80%;
            margin: 10px auto;
            border-top: 1px solid #fff;
        }

        .social-icons {
            display: flex;
            justify-content: center;
        }

        .social-icons a {
            color: #fff;
            margin: 0 10px;
            font-size: 24px;
            text-decoration: none;
        }

        .social-icons a:hover {
            color: #ddd;
        }

        .footer-container > .footer-column {
            padding: 0 40px;
        }

        .footer-container + .separator {
            display: block;
        }
         .uk-button-default {
        border: 2px solid #dfb550; /* Color del borde*/
        color: #000000; /* Color del texto*/
        transition: background-color 0.3s, color 0.3s;
    	}

    	.uk-button-default:hover {
    	border: 2px solid #000000;
        background-color: #dfb550; /* Color de fondo cuando el cursor pasa sobre el boton */
        color: #000000 !important; /* Color del texto cuando el cursor pasa sobre el boton */
        font-weight: bold; /* Texto en negrita*/
    	}
    </style>
</head>
<body>
    <div class="content">
        <header>              
            <!-- Barra de Navegaciï¿½n -->
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
                            <li><a href="/login">Iniciar Sesión</a></li>                           
                            
                        </ul>
                        <ul class="register-button">
                        	<li ><a href="/register" class="btn-registrarse">REGISTRARSE</a></li>
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
        
        <div class="main-title">
            <h1>LaburApp</h1>
            <p class="description">Encuentra y publica servicios fácilmente. Conéctate con profesionales y clientes en un solo lugar.</p>
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
                        <li><a href="#">Más antiguos</a></li>
                        <li class="uk-nav-divider"></li>
                        <li><a href="#">Más recientes</a></li>
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
    
    <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h5>INFORMACIÓN</h5>
                <ul>
                    <li><a href="#">Sobre nosotros</a></li>
                    <li><a href="#">Oportunidades de empleo</a></li>
                    <li><a href="#">Blog</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h5>LEGAL</h5>
                <ul>
                    <li><a href="#">Terminos de uso</a></li>
                    <li><a href="#">Acuerdo de licencia</a></li>
                    <li><a href="#">Politica de privacidad</a></li>
                    <li><a href="#">Politica de cookies</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h5>SOPORTE</h5>
                <ul>
                    <li><a href="#">Contacto</a></li>
                    <li><a href="#">Ayuda</a></li>
                </ul>
            </div>
            <div class="footer-column1">
                <h5>REDES SOCIALES</h5>
                <div class="social-icons">
                    <a href="https://www.facebook.com" target="_blank" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://www.twitter.com" target="_blank" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com" target="_blank" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.linkedin.com" target="_blank" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        <div class="separator"></div>
        <div class="footer-bottom">           
            <p>LaburaApp 2024 | Todos los derechos reservados.</p>           
            <div class="uk-inline">
                <button class="uk-button uk-button-default" type="button" uk-toggle="target: #mode-dropdown">Modo Oscuro</button>
                <div id="mode-dropdown" uk-dropdown="mode: click" class="uk-dropdown">
                    <ul class="uk-nav uk-dropdown-nav">
                        <li><a href="#">Modo Claro</a></li>
                        <li><a href="#">Modo Oscuro</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.6.22/js/uikit.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.6.22/js/uikit-icons.min.js"></script>
</body>
</html>