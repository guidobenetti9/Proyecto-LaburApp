<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicación de Servicio</title>
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.16.22/dist/css/uikit.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    
    <style>
        body {
            background-image: url("https://fotografias.lasexta.com/clipping/cmsimages01/2020/05/08/E3BC9A26-F5D7-4B1D-9497-72A52CE9CB79/98.jpg?crop=1300,731,x0,y19&width=1900&height=1069&optimize=high&format=webply");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            display: flex;
            align-items: flex-start; /* Alinear elementos al inicio (margen superior) */
        }

        /* Navegador */
        .uk-navbar-container {
            background: linear-gradient(0deg, rgba(33,33,33,0.9) 0%, rgba(28,28,28,0.9) 18%, rgba(19,19,19,0.93) 45%, rgba(15,15,15,0.95) 63%, rgba(4,4,4,1) 100%) !important;
            height: 55px;
            display: flex;
            align-items: center;
            width: 50%;
        }

        .logo-box {
            width: 108px;
            height: 100px;
            
            display: flex;
            justify-content: center;
            align-items: flex-start;
            border-radius: 0 0 50% 50%;
            background: linear-gradient(0deg, rgba(33,33,33,0.6) 0%, rgba(28,28,28,0.8) 18%, rgba(19,19,19,0.85) 45%, rgba(15,15,15,0.85) 63%, rgba(4,4,4,9) 100%) !important;

        }

        .logo-container {
            width: 90%;
            height: 90%;
            border-radius: 50%;
            background: rgb(213,193,57);
            background: linear-gradient(0deg, rgba(213,193,57,1) 0%, rgba(230,210,76,1) 20%, rgba(247,222,88,1) 40%, rgba(246,227,102,1) 60%, rgba(230,210,76,1) 80%, rgba(213,193,57,1) 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra opcional */
            margin-top: 5px;
        }

        .logo-inner {
            width: 90%;
            height: 90%;
            
            border-radius: 50%;
            background: #ddd;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo-inner img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
        }

        .uk-navbar-left,
        .uk-navbar-right {
            display: flex;
            align-items: center;
        }



        .uk-navbar-right {
            margin-right: 80px;
        }

        .uk-navbar-left {
            margin-left: 80px;
        }

        .uk-navbar-nav>li {
            margin-left: 10px;
            margin-right: 10px;
            
        }
        .uk-navbar-nav > li > a {
            color: white;
            transition: color 0.3s ease, transform 0.4s ease !important;
            
        }
        .uk-navbar-nav > li > a:hover {
            color: #ffcc00 !important;
            transform: scale(1.3);
        }

        /* Estilo para el icono de cofiguracion */
		.icon-config {	    
		    transition: color 0.3s ease, transform 0.4s ease !important;
		}	
		.icon-config:hover {
		    transform: scale(1.3);
		}

		/* Estilo para el ícono de cerrar sesión */
		.icon-logout i {
			transition: color 0.3s ease, transform 0.3s ease;
		}		
		
		.icon-logout:hover i {
		    color: rgb(255,122,122);
            color: linear-gradient(90deg, rgba(255,122,122,1) 0%, rgba(255,89,89,1) 26%, rgba(255,70,70,1) 57%, rgba(255,0,0,1) 100%); /* Color al pasar el cursor sobre el ícono de cerrar sesión */
		    transform: scale(1.5); /* Agrandar el ícono de cerrar sesión */
		}


        .custom-container {
            background-color: rgba(0, 0, 0, 0.7);
            border: 1px solid #dfb550;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            max-width: 1200px;
            margin: auto;
            display: flex;
            flex-direction: column;
        }

        .uk-heading-divider {
            color: #dfb550;
        }
        
        .uk-heading-divider a{
            text-decoration: none;
            color:#dfb550
        }

        .uk-card {
            background-color: rgba(255, 255, 255, 0.4);
            padding: 15px;
            color: #ffffff;
        }

        .uk-card-body {
            padding: 15px;
        }

        .uk-textarea {
            background-color: rgba(255, 255, 255, 0.7);
            color: #000000;
        }

        .uk-button-primary {
            background-color: gold;
            color: #000000;
        }

        .uk-button-primary:hover {
            background-color: #dfb550;
        }

        /* Barra de busqueda */
        .uk-center {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .uk-search {
            margin-top: 60px;
            margin-bottom: 50px;
            display: flex;
            width: 200px;
            /* Ancho del contenedor de busqueda */
            transition: all 0.7s ease;
        }

        .uk-search:hover {
            width: 600px;
            /* Ajusta este valor según sea necesario */
        }

        .uk-search-input {
            background-color: #fff !important;
            /* Fondo blanco */
            width: 700px;
            /* Ancho del campo de búsqueda */
            padding-right: 40px;
            /* Espacio para el icono de la lupa */
            color: #000 !important;
            /* Color del texto */
            border-color: #000 !important;
        }

        .uk-search-icon-flip {
            position: absolute;
            right: 10px;
            top: 50%;
            color: #000 !important;
            /* Color del icono */
        }

        .uk-search-input:focus {
            border-color: #ffcc00 !important;
            /* Color del borde al hacer clic */
        }

        /*AQUI COMIENZA EL FOOTER*/
        footer {
            background: rgb(33,33,33);
			background: linear-gradient(180deg, rgba(33,33,33,0.9) 0%, rgba(28,28,28,0.9) 18%, rgba(19,19,19,0.95) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%) !important;
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
            color: #dfb550;
        }

        .footer-container > .footer-column {
            padding: 0 40px;
        }

        .footer-container + .separator {
            display: block;
        }
        .uk-button-default {
	        border: 2px solid #ffffff; /* Color del borde*/
	        color: #000000; /* Color del texto*/
	        transition: background-color 0.3s, color 0.3s;
    	}

    	.uk-button-default:hover {
	    	border: 2px solid #000000;
	        background: rgb(213,193,57);
            background: linear-gradient(0deg, rgba(213,193,57,1) 0%, rgba(230,210,76,1) 20%, rgba(247,222,88,1) 40%, rgba(246,227,102,1) 60%, rgba(230,210,76,1) 80%, rgba(213,193,57,1) 100%); /* Color de fondo cuando el cursor pasa sobre el boton */
	        color: #000000 !important; /* Color del texto cuando el cursor pasa sobre el boton */
	        font-weight: bold; /* Texto en negrita*/
    	}
    	.map-ubication{
	    	height:200px;
	    	widht:200px;
    	}
        
    </style>
</head>

<body>

    <!-- Navegador -->
    <header>
        <nav class="uk-navbar-container uk-navbar-transparent" uk-navbar>
            <div class="uk-navbar-right">
                <ul class="uk-navbar-nav">
                    <li><a href="/">Inicio</a></li>
                    <li><a href="/help">Ayuda</a></li>
                    <li><a href="#">Noticias</a></li>
                </ul>
            </div>
        </nav>
        <div class="logo-box">
            <div class="logo-container">
                <div class="logo-inner">
                    <a href="/"><img src="/logo.png"></a>
                </div>
            </div>
        </div>
        <nav class="uk-navbar-container uk-navbar-transparent" uk-navbar>         
             <div class="uk-navbar-left">
                 <ul class="uk-navbar-nav">
                     <li><a href="/">${userInSession.firstName} ${userInSession.lastName}</a></li>
                     <li><a href="/" class="icon-config" uk-icon="icon: cog"></a></li>
                     <li><a href="/logout" class="icon-logout"><i class="fa fa-sign-out-alt"></i></a></li>
                 </ul>
             </div>                     
        </nav>
    </header>

    <!-- Barra de búsqueda -->
    <div class="uk-center">
        <form class="uk-search uk-search-default" action="/findUsers" method="get">
            <input class="uk-search-input" type="search" placeholder="Buscar Usuarios" name="search">
            <button class="uk-search-icon-flip" uk-search-icon type="submit"></button>
        </form>
    </div>

    <!-- Contenedor Principal -->
    <div class="uk-container custom-container">
        <!-- Layout Principal -->
        <div class="uk-grid-divider uk-child-width-expand@s" uk-grid>
            <!-- Columna Izquierda: Información del Servicio -->
            <div>
                <div class="uk-card uk-card-body">
                    <h1 class="uk-heading-divider uk-text-capitalize">
                        <a href="/userProfile">
                            ${post.creatorPost.firstName} ${post.creatorPost.lastName} - ${post.jobsInPost.jobName}
                        </a>
                    </h1>
                    <p>${post.municipio}, ${post.localidad}, ${post.province}</p>
                    <c:if test="${userInSession.id != post.creatorPost.id }">
                    	<a href="/favoritePost/add/${post.id}" class="uk-button uk-button-primary">Agregar a favoritos</a>
                    </c:if>
                </div>

                <div class="uk-card uk-card-body uk-margin-top">
                    <h3 class="uk-heading-divider">${post.jobsInPost.jobName}</h3>
                    <p>Descripción: ${post.postDescription}</p>
                </div>

                <div class="uk-card uk-card-body uk-margin-top">
                    <h3 class="uk-heading-divider">Contacto</h3>
                    <p>Teléfono: ${post.creatorPost.phone}</p>
                    <p>Email: ${post.creatorPost.email}</p>
                </div>

                <div class="uk-card uk-card-body uk-margin-top">
                    <h3 class="uk-heading-divider">Disponibilidad</h3>
                    <p>${post.availableDays} - ${post.availableHours}</p>                   
                </div>
                <div class="uk-card uk-card-body uk-margin-top">
                    <c:if test="${userInSession.id == post.creatorPost.id}">
                        <div class="uk-flex-inline">
                            <a href="/post/edit/${post.id}" class="uk-button uk-button-danger">Editar Post</a>
                            <form action="/post/delete/${post.id}" method="post">
                                <input type="hidden" name="_method" value="DELETE">
                                <input type="submit" value="Borrar Post" class="uk-button uk-button-default uk-margin-left">
                            </form>
                        </div>
                    </c:if>                    
                </div>
            </div>

            <!-- Columna Derecha: Mapa y Comentarios -->
            <div class="uk-width-1-3@s">
                <div class="uk-card uk-card-body">
                    <h3 class="uk-heading-divider">Mapa de Ubicación</h3>
    				<div class="map-ubication">
    					<div id="map"></div>
    				</div>           
                </div>
                <!-- Sección de Comentarios -->
                <div class="uk-card uk-card-body uk-margin-top">
                    <h3 class="uk-heading-divider">Comentarios y Reseñas</h3>
                    <c:forEach items="${reviews}" var="review">
                        <div class="uk-card uk-card-body uk-margin-top">
                            <div class="uk-card-header">
                                <p>${review.senderReview.firstName} ${review.senderReview.lastName}</p>
                                
                                <p>${review.createdAt}</p>
                            </div>
                            <div class="uk-card-body">
                                <p>${review.comment}</p>
                            </div>
                            <div class="uk-card-footer">
                            <c:choose>
                                <c:when test="${review.stars == 1}">
                                    <span uk-icon="star"></span>
                                </c:when>
                                <c:when test="${review.stars == 2}">
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                </c:when>
                                <c:when test="${review.stars == 3}">
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                </c:when>
                                <c:when test="${review.stars == 4}">
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                </c:when>
                                <c:when test="${review.stars == 5}">
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                    <span uk-icon="star"></span>
                                </c:when>
                                <c:otherwise>
                                    <p>Sin puntuaciones</p>
                                </c:otherwise>
                            </c:choose>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="cont_creareview">
                    <form:form action="/review/create/${post.id}" method="POST" modelAttribute="newReview" >
                        <div class="cajita">
                            <form:textarea path="comment" class="uk-textarea" placeholder="Deja tu reseña"/>
                        </div>
                        <div class="cajita">
                            <form:label path="stars" >Estrellas:</form:label>
                            <div class="star-rating">
                              <input type="radio" id="5-stars" name="stars" value="1"/>
                              <label for="5-stars" uk-icon="icon: star">1</label>
                              <input type="radio" id="4-stars" name="stars" value="2"/>
                              <label for="4-stars" uk-icon="icon: star">2</label>
                              <input type="radio" id="3-stars" name="stars" value="3"/>
                              <label for="3-stars" uk-icon="icon: star">3</label>
                              <input type="radio" id="2-stars" name="stars" value="4"/>
                              <label for="2-stars" uk-icon="icon: star">4</label>
                              <input type="radio" id="1-star" name="stars" value="5"/>
                              <label for="1-star" uk-icon="icon: star">5</label>
                            </div>           
                        </div>
                  
                        <div class="cont_boton">
                            <form:hidden path="postReview" value="${post.id}" />
                            <form:hidden path="senderReview" value="${userInSession.id}" />
                            <input type="submit" class="uk-button uk-button-secondary" value="Enviar" >
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
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

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.22/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.22/dist/js/uikit-icons.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin="">
    </script>

</body>

</html>
