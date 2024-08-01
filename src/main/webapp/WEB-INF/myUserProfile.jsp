<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario - LaburApp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.6.22/css/uikit.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    
    <style>
        header {
            display: flex;
            align-items: flex-start;
            position: absolute;
            width: 100%;
            z-index: 10;
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
            border:1px solid #dfb550;
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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

        .uk-navbar-nav>li>a {
            color: white;
            transition: color 0.3s ease, transform 0.4s ease !important;
        }

        .uk-navbar-nav>li>a:hover {
            color: #ffcc00 !important;
            transform: scale(1.3);
        }
        
        /*Perfil de Usuario*/      
        .profile-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            padding-top:90px;
            
            border-bottom: 1px solid #dfb550;
            color: white;   
            width: 98%;
            margin: auto;
            margin-bottom: 20px; 
            background-image: url("https://img.freepik.com/foto-gratis/pintura-lago-montana-montana-al-fondo_188544-9126.jpg");
            background-size: cover;
            box-shadow:0 20px 20px rgba(0,0,0,0.3);    
        }

        h1{
            color: white;
        }
        .profile-header img {
            border-radius: 50%;
        }
        .profile-header .info {
            flex: 1;
            margin-left: 20px;
            color: white !important;
        }
        .profile-header .info h2{
            margin: 0;
            color: white;
        }
        
        .profile-header .info h3{
            margin: 0;
            color: white;
        }
        .profile-header .info p {
            margin: 5px 0;
        }
             
        .center-title {
            text-align: center;
            margin-bottom: 20px;
        }
        .section-container {
            margin-bottom: 20px;
        }
        .activity-feed, .certifications, .gallery, .recommendations, .requests {
            margin-top: 10px;
        }
        .activity-item, .certification-item, .recommendation-item, .request-item {
            margin-bottom: 10px;
        }
        .gallery {
        display: flex;
        gap: 10px;
        justify-content: center;
        align-items: center;
        
        }

        .thumbnail {
            width: 150px;
            transition: transform 0.3s ease;
            border: solid 1px #000000;
        }

        .thumbnail:hover {
            transform: scale(1.9);
        }
        footer {
            background: rgb(33,33,33);
            background: linear-gradient(180deg, rgba(33,33,33,1) 0%, rgba(28,28,28,1) 18%, rgba(19,19,19,1) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%);
            padding: 20px 0;
            margin-top: 70px;
            color: #e0e0e0;
            box-sizing: border-box;
        }
        .footer-container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .footer-column {
            flex: 1;
            padding: 0 20px;
        }
        .footer-column1 {
            display: flex;
            flex-direction: column;
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
            font-size: small;
        }
        .footer-column ul li a {
            color: rgb(119, 119, 119);
            text-decoration: none;
        }
        .footer-column ul li a:hover {
            color: white;
        }
        .separator {
            width: 80%;
            margin: 10px auto;
            border-top: 1px solid #fff;
            
        }
        .footer-bottom {
            background: #181818;
            color: #e0e0e0;
            padding: 10px 20px;
            font-size: 14px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .uk-button-default {
            border: 2px solid #ffffff;
            color: #ffffff;
            transition: background-color 0.3s, color 0.3s;
        }
        .uk-button-default:hover {
            border: 2px solid #000000;
            background-color: #dfb550;
            color: #000000 !important;
            font-weight: bold;
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
        .social-icons a {
            color: #ffffff;
            margin: 0 5px;
            font-size: 20px;
        }
        .social-icons a:hover {
            color: #dfb550;
        }
        .divider {
            border-top: 1px solid #dfb550;
            margin: 20px auto;
            width: 95%; /* Reducir el ancho de las lï¿½neas horizontales */
        }
        .service-card {
        transition: transform 0.3s ease;
        }

        .service-card:hover {
            transform: scale(1.1);
        }
        .stars i {
            color: gold;/* Cambia el color de las estrellas */
            font-size: 13px; /* Ajusta el tamaño de las estrellas */
        }

        .stars i.fa-star {
            margin-right: 2px; /* Espacio entre las estrellas */
             
        }

        /*Estilo de listas*/
        
        .uk-card{
    		border:1px solid #dfb550 ;
    		 width: 80%;
            margin-left: auto;
            margin-right: auto;
    	}
    	
        .uk-card-title {
            width: 100%;
        }

        .service-description {
            ;
        }

        .description-text {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical;
            width: 200px
        }

        .service-image img {
            max-width: 200px;
            max-height: 200px;
            width: 100%;
            height: auto;
            border: solid 1px #000000;
            margin-left: 10px;
        }

        .uk-card-footer .rating {
            display: flex;
            align-items: center;
        }
        
        

    </style>
    </head>
    <body>
        <!-- Barra de Navegación -->      
        <header>              
	        <!-- Barra de Navegación -->
	        <nav class="uk-navbar-container uk-navbar-transparent" uk-navbar>
	            <div class="uk-navbar-right">
	                <ul class="uk-navbar-nav"> 
	                	<li><a href="/">Inicio</a></li> 
	                    <li><a href="/help">Ayuda</a></li>
	                    <li><a href="/contact">Contacto</a></li>
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
	        <nav class="uk-navbar-container uk-navbar-transparent">       	
	             <div class="uk-navbar-left">
	                 <ul class="uk-navbar-nav">
	                    <li><a href="/">${userInSession.firstName} ${userInSession.lastName}</a></li>
                        <li><a href="/" class="icon-config" uk-icon="icon: cog"></a></li>
                        <li><a href="/logout" class="icon-logout"><i class="fa fa-sign-out-alt"></i></a></li>
	                 </ul>
	             </div>	 	              
	        </nav>
    	</header>       
        <div class="profile-container">          
            <!-- Información del Usuario -->
            <div class="profile-header">
                <img src="https://via.placeholder.com/100" alt="Foto de Perfil" width="100">
                <div class="info">
                    <h2 class="uk-h2">${userInSession.firstName} ${userInSession.lastName}</h2>
                    <h3 class="uk-h3">@${userInSession.username}</h3>                  					
                    <c:forEach items="${posts}" var="post">
                    	<p>Categorias: ${post.jobsInPost.jobName}</p>
                    </c:forEach>                    
                    <p><i class="fas fa-map-marker-alt"></i> ${userInSession.province}, ${userInSession.city}</p>
                    <div class="uk-flex">
                        <div class="social-icons uk-margin-small-top">
                            <a href="https://www.facebook.com" target="_blank" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                            <a href="https://www.twitter.com" target="_blank" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                            <a href="https://www.instagram.com" target="_blank" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                            <a href="https://www.linkedin.com" target="_blank" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>                                       
            </div> 
                                       
            <div class="uk-grid-large uk-grid-divider" uk-grid>
               
                <div class="uk-width-1-3@m">
                    
                    <div class="uk-card-1 uk-card-default uk-card-body uk-margin-top">
                        <h3 class="uk-card-title center-title">Información de Contacto</h3>
                        <div class="divider"></div>
                        <ul class="uk-list uk-list-divider">
                            <li><span uk-icon="icon: receiver; ratio: 1"></span>${userInSession.phone}</li>
                            <li><span uk-icon="icon: mail; ratio: 1"></span>${userInSession.email}</li>                            
                            <div class="uk-text-center uk-margin-small-bottom">
                                <a href="/user/edit/${userInSession.id}" class="uk-button uk-button-primary">Editar Perfil</a>
                            </div>
                        </ul>
                    </div>
                    <!-- Nueva Sección: Descripción Detallada -->
                    <div class="uk-card-1 uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Descripción Detallada</h3>
                        <div class="divider"></div>
                        <p>
                            Soy un profesional altamente capacitado en el área de desarrollo web, con más de 5 años de experiencia en el campo. Me especializo en la creación de sitios web personalizados, optimización SEO y desarrollo de aplicaciones móviles. 
                            <br><br>
                            mi enfoque está en proporcionar soluciones efectivas que ayuden a las empresas a alcanzar sus objetivos en línea. Tengo una sólida comprensión de las últimas tecnologías y tendencias, lo que me permite ofrecer servicios de alta calidad adaptados a las necesidades específicas de cada cliente.
                        </p>
                        <div class="uk-text-center uk-margin-small-bottom">
                           <a href="" class="uk-button uk-button-primary">Editar</a>
                       </div>
                    </div>
                </div>
                <!-- Contenido Principal -->
                <div class="uk-width-2-3@m">
                    <!-- Servicios Publicados -->
                    <div class="uk-card-1 uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Mis Servicios Publicados</h3>
                        <div class="uk-text-center uk-margin-small-bottom">
                            <a href="/newPost" class="uk-button uk-button-primary">Agregar un Servicio</a>
                        </div>
                        <div class="divider"></div>
                        <div class="uk-grid uk-grid-match uk-child-width-1-2@m" uk-grid> 
                        
                        <c:forEach items="${posts}" var="post">                                                     
                            <div class="service-card">
                                <div class="uk-card uk-card-default uk-card-hover">
                                    <div class="uk-card-body">
                                        <h3 class="uk-card-title">${post.postTittle}</h3>
                                        <div class="uk-flex uk-flex-between">
                                            <div class="service-description">
                                                <p class="description-text">${post.postDescription}</p>
                                                <p>Estado: <span class="uk-label uk-label-success">Disponible</span></p>
                                                <p class="uk-text-meta">Fecha: ${post.createdAt}</p>
                                                <p class="uk-text-left">${post.municipio}, ${post.localidad}, ${post.province}</p>
                                                <a href="/post/${post.id}" class="uk-button uk-button-text uk-text-capitalize">Ver Detalles</a>
                                            </div>
                                            <div class="service-image">
                                                <img src="https://via.placeholder.com/1200" alt="Servicio">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-card-footer">
                                        <div class="uk-flex uk-flex-between">
                                            <div class="rating">
                                                <span uk-icon="star" class="uk-text-warning"></span>
                                                <span uk-icon="star" class="uk-text-warning"></span>
                                                <span uk-icon="star" class="uk-text-warning"></span>
                                                <span uk-icon="star" class="uk-text-warning"></span>
                                                <span uk-icon="star" class="uk-text-muted"></span>
                                                <span class="uk-text-meta">(4.0)</span>
                                            </div>
                                            <div>
                                                <a href="/post/edit/${post.id}" uk-icon="icon: pencil" class="uk-icon-button uk-button-primary" title="Editar"></a>
                                                <a href="/post/delete/${post.id}" uk-icon="icon: trash" class="uk-icon-button uk-button-danger" title="Eliminar"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </c:forEach>                                                     
                        </div>
                    </div>
                   
                    <div class="uk-card-1 uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Mis Solicitudes</h3>
                        <div class="uk-text-center uk-margin-small-bottom">
                            <a href="/newRequest" class="uk-button uk-button-primary">Agregar una solicitud</a>
                        </div>
                        <div class="divider"></div>
                        <div class="uk-grid uk-grid-match uk-child-width-1-2@m" uk-grid>
                        
                        	<c:forEach items="${postsRequests}" var="postRequest">
                            <div class="service-card">
                                <div class="uk-card uk-card-default uk-card-hover">
                                    <div class="uk-card-body">
                                        <h3 class="uk-card-title">${postRequest.postTittle}</h3>
                                        <div class="uk-flex uk-flex-between">
                                            <div class="service-description">
                                                <p class="description-text uk-text-left">${postRequest.postDescription}</p>
                                                <p>Estado: <span class="uk-label uk-label-success">Disponible</span></p>
                                                <p class="uk-text-meta">Fecha: ${postRequest.createdAt}</p>
                                                <p class="uk-text-left">${postRequest.municipio}, ${postRequest.localidad}, ${postRequest.province}</p>
                                                <a href="/request/${postRequest.id}" class="uk-button uk-button-text uk-text-capitalize">Ver Detalles</a>
                                            </div>
                                            <div class="service-image">
                                                <img src="https://via.placeholder.com/1200" alt="Servicio">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-card-footer">
                                        <div class="uk-flex uk-flex-between uk-text-left">
                                            <div class="rating">
                                                <span uk-icon="star" class="uk-text-warning"></span>
                                                <span uk-icon="star" class="uk-text-warning"></span>
                                                <span uk-icon="star" class="uk-text-warning"></span>
                                                <span uk-icon="star" class="uk-text-warning"></span>
                                                <span uk-icon="star" class="uk-text-muted"></span>
                                                <span class="uk-text-meta">(4.0)</span>
                                            </div>
                                            <div>
                                                <a href="/request/edit/${postRequest.id}" uk-icon="icon: pencil" class="uk-icon-button uk-button-primary" title="Editar"></a>
                                                <a href="/post/edit/${postRequest.id}" uk-icon="icon: trash" class="uk-icon-button uk-button-danger" title="Eliminar"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>                                                     
                        </div>
                    </div>
                    <!-- Reseñas -->
                    <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Reseñas de otros usuarios</h3>
                        <div class="divider"></div>
                        <div class="uk-comment-list">
                        <c:forEach items="${reviews}" var="review">
                        <!--<c:if test="${review.postReview.creatorPost.id == post.creatorPost.id}">-->
                            
                            <div class="uk-margin">
                                <article class="uk-comment">
                                    <header class="uk-comment-header uk-grid-medium uk-flex-middle" uk-grid>
                                        <div class="uk-width-expand">
                                            <h4 class="uk-comment-title uk-margin-remove"><a class="uk-link-reset" href="/userProfile/${review.senderReview.id}">@${review.senderReview.username}</a></h4>
                                            <ul class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
                                                <li class="stars">
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
                                                </li>
                                                <li>${review.createdAt}</li>
                                            </ul>
                                        </div>
                                    </header>
                                    <div class="uk-comment-body">
                                        <p>${review.comment}</p>
                                    </div>
                                </article>
                            </div>
                           <!--   </c:if>-->
                        </c:forEach>
                        </div>
                        <div class="uk-flex uk-flex-center uk-margin-large-top">
                            <button class="uk-button uk-button-primary">Ver Más Reseñas</button>
                        </div>
                    </div>                 
                </div>
            </div>
            <div id="search-results" class="search-results"></div>
        </div>

  <!-- Pie de Página -->
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
                <li><a href="#">Términos de uso</a></li>
                <li><a href="#">Acuerdo de licencia</a></li>
                <li><a href="#">Política de privacidad</a></li>
                <li><a href="#">Política de cookies</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h5>SOPORTE</h5>
            <ul>
                <li><a href="/contact">Contacto</a></li>
                <li><a href="/help">Ayuda</a></li>
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
        <p>LaburApp 2024 | Todos los derechos reservados.</p>
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