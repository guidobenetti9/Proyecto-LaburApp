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
        .uk-navbar-container {
            background: rgb(33,33,33) !important;
            background: linear-gradient(0deg, rgba(33,33,33,1) 0%, rgba(28,28,28,1) 18%, rgba(19,19,19,1) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%) !important;
            border-bottom: 1px solid #dfb550;
        }
        .uk-navbar-nav > li > a {
            color: white;
        }
        .uk-navbar-nav > li > a:hover {
            color: #ffcc00 !important;
        }

        .uk-width-logo {
            height: 50px;
            width: 50px;
        }

        /* Estilo para el icono de cofiguracion */
		.icon-config {	    
		    transition: color 0.3s ease, transform 0.3s ease !important;
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
        
        /*Perfil de Usuario*/

        .profile-container{

            padding: 10px 60px;
        }
        .profile-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px;
            background: rgb(115,115,115);
            background: radial-gradient(circle, rgba(115,115,115,1) 0%, rgba(87,87,87,1) 30%, rgba(69,69,69,1) 50%, rgba(57,57,57,1) 70%, rgba(34,34,34,1) 100%);
            border-bottom: 1px solid #dfb550;
            color: white;   
            width: 80%;
            margin: auto;
            margin-bottom: 20px;
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
        }
        .profile-header .info h2 {
            margin: 0;
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
        .uk-card-title {
            width: 100%;
        }

        .service-description {
            width: 400px;
        }

        .description-text {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical;
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
        <nav class="uk-navbar-container" uk-navbar>
            <div class="uk-navbar-left">
                <div class="uk-width-logo">
                    <a href="/">
                        <img src="logo.png" class="uk-width-1-1 uk-margin-small-left">
                    </a>
                </div>          
                <ul class="uk-navbar-nav">
                    <li><a href="#">Inicio</a></li>
                    <li><a href="#">Ayuda</a></li>
                    <li><a href="#">Contacto</a></li>
                </ul>
            </div>
            <div class="uk-navbar-right">
                <div class="uk-navbar-right">
                    <ul class="uk-navbar-nav">
                        <li><a href="/">${userInSession.firstName} ${userInSession.lastName}</a></li>
                        <li><a href="/" class="icon-config" uk-icon="icon: cog"></a></li>
                        <li><a href="/logout" class="icon-logout"><i class="fa fa-sign-out-alt"></i></a></li>
                    </ul>
                </div>          
            </div>
        </nav>         
        <div class="profile-container">          
            <!-- Información del Usuario -->
            <div class="profile-header">
                <img src="https://via.placeholder.com/100" alt="Foto de Perfil" width="100">
                <div class="info">
                    <h1>Nombre del Usuario</h2>
                    <p>Profesión o Especialidad</p>
                    <p><i class="fas fa-map-marker-alt"></i> Ubicación</p>
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
                    
                    <div class="uk-card uk-card-default uk-card-body uk-margin-top">
                        <h3 class="uk-card-title center-title">Información de Contacto</h3>
                        <div class="divider"></div>
                        <ul class="uk-list uk-list-divider">
                            <li><span uk-icon="icon: receiver; ratio: 1"></span> +54 123 456 789</li>
                            <li><span uk-icon="icon: mail; ratio: 1"></span> AdrianCastro@xd.com</li>                            
                            <li><a href="#" class="uk-icon-button uk-margin-small-right" uk-icon="twitter"></a>ESPACIO PARA MAPA DE UBICACIÓN</li>
                            <li><a href="#" class="uk-icon-button uk-margin-small-right" uk-icon="facebook"></a>ESPACIO PARA MAPA DE UBICACIÓN</li>
                            <li><a href="#" class="uk-icon-button uk-margin-small-right" uk-icon="linkedin"></a>ESPACIO PARA MAPA DE UBICACIÓN</li>
                            <div class="uk-text-center uk-margin-small-bottom">
                                <a href="/user/edit/${userInSession.id}" class="uk-button uk-button-primary">Editar Perfil</a>
                            </div>
                        </ul>
                    </div>
                    <!-- Nueva Sección: Descripción Detallada -->
                    <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Descripción Detallada</h3>
                        <div class="divider"></div>
                        <p>
                            Soy un profesional altamente capacitado en el área de desarrollo web, con más de 5 años de experiencia en el campo. Me especializo en la creación de sitios web personalizados, optimización SEO y desarrollo de aplicaciones móviles. 
                            <br><br>
                            mi enfoque está en proporcionar soluciones efectivas que ayuden a las empresas a alcanzar sus objetivos en línea. Tengo una sólida comprensión de las últimas tecnologías y tendencias, lo que me permite ofrecer servicios de alta calidad adaptados a las necesidades específicas de cada cliente.
                        </p>
                    </div>
                     <!-- Certificaciones -->
                     <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Certificaciones</h3>
                        <div class="divider"></div>
                        <div class="certifications">
                            <div class="certification-item">
                                <p>Certificación en Desarrollo Web - Instituto XYZ</p>
                            </div>
                            <div class="certification-item">
                                <p>Certificación en Marketing Digital - Universidad ABC</p>
                            </div>
                        </div>
                    </div>
                    <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Trabajos o Solicitudes completadas</h3>
                        <div class="divider"></div>
                        <div class="Historial">
                            
                        </div>
                    </div>
                    <!-- Galería de Imágenes-->
                    <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Galería de Imágenes</h3>
                        <div class="divider"></div>
                        <div class="gallery">
                            <a href="https://via.placeholder.com/1200" target="_blank">
                                <img src="https://via.placeholder.com/300" alt="Imagen 1" class="thumbnail">
                            </a>
                            <a href="https://via.placeholder.com/1200" target="_blank">
                                <img src="https://via.placeholder.com/300" alt="Imagen 2" class="thumbnail">
                            </a>
                            <a href="https://via.placeholder.com/1200" target="_blank">
                                <img src="https://via.placeholder.com/300" alt="Imagen 3" class="thumbnail">
                            </a>
                            <a href="https://via.placeholder.com/1200" target="_blank">
                                <img src="https://via.placeholder.com/300" alt="Imagen 4" class="thumbnail">
                            </a>                           
                        </div>
                    </div>
                </div>
                <!-- Contenido Principal -->
                <div class="uk-width-2-3@m">
                    <!-- Servicios Publicados -->
                    <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Servicios Publicados</h3>
                        <div class="uk-text-center uk-margin-small-bottom">
                            <a href="/add-service" class="uk-button uk-button-primary">Agregar un Servicio</a>
                        </div>
                        <div class="divider"></div>
                        <div class="uk-grid uk-grid-match uk-child-width-1-2@m" uk-grid>                                                      
                            <div class="service-card">
                                <div class="uk-card uk-card-default uk-card-hover">
                                    <div class="uk-card-body">
                                        <h3 class="uk-card-title">Personal Trainer</h3>
                                        <div class="uk-flex uk-flex-between">
                                            <div class="service-description">
                                                <p class="description-text">Realizo entrenamientos personalizados que se adapten a los gustos, necesidades y objetivos de las personas que acuden a mi.</p>
                                                <p>Estado: <span class="uk-label uk-label-success">Disponible</span></p>
                                                <p class="uk-text-meta">Fecha: 25/07/2024</p>
                                                <a href="/service/1" class="uk-button uk-button-text">Ver Detalles</a>
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
                                                <a href="#" uk-icon="icon: pencil" class="uk-icon-button uk-button-primary" title="Editar"></a>
                                                <a href="#" uk-icon="icon: trash" class="uk-icon-button uk-button-danger" title="Eliminar"></a>
                                            </div>
                                        </div>
                                        <a href="/service/1" class="uk-button uk-button-text">Ver Opiniones</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Repetir para otros servicios -->
                            <div class="service-card">
                                <div class="uk-card uk-card-default uk-card-hover">
                                    <div class="uk-card-body">
                                        <h3 class="uk-card-title">Personal Trainer</h3>
                                        <div class="uk-flex uk-flex-between">
                                            <div class="service-description">
                                                <p class="description-text">Realizo entrenamientos personalizados que se adapten a los gustos, necesidades y objetivos de las personas que acuden a mi.</p>
                                                <p>Estado: <span class="uk-label uk-label-success">Disponible</span></p>
                                                <p class="uk-text-meta">Fecha: 25/07/2024</p>
                                                <a href="/service/1" class="uk-button uk-button-text">Ver Detalles</a>
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
                                                <a href="#" uk-icon="icon: pencil" class="uk-icon-button uk-button-primary" title="Editar"></a>
                                                <a href="#" uk-icon="icon: trash" class="uk-icon-button uk-button-danger" title="Eliminar"></a>
                                            </div>
                                        </div>
                                        <a href="/service/1" class="uk-button uk-button-text">Ver Opiniones</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Repetir para otros servicios -->                                                       
                        </div>
                    </div>
                    <!-- Nuevas Solicitudes de Servicios -->
                    <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Solicitudes de Servicios</h3>
                        <div class="uk-text-center uk-margin-small-bottom">
                            <a href="/add-service" class="uk-button uk-button-primary">Agregar una solicitud</a>
                        </div>
                        <div class="divider"></div>
                        <div class="uk-grid uk-grid-match uk-child-width-1-2@m" uk-grid>
                            <div class="service-card">
                                <div class="uk-card uk-card-default uk-card-hover">
                                    <div class="uk-card-body">
                                        <h3 class="uk-card-title">Personal Trainer</h3>
                                        <div class="uk-flex uk-flex-between">
                                            <div class="service-description">
                                                <p class="description-text">Realizo entrenamientos personalizados que se adapten a los gustos, necesidades y objetivos de las personas que acuden a mi.</p>
                                                <p>Estado: <span class="uk-label uk-label-success">Disponible</span></p>
                                                <p class="uk-text-meta">Fecha: 25/07/2024</p>
                                                <a href="/service/1" class="uk-button uk-button-text">Ver Detalles</a>
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
                                                <a href="#" uk-icon="icon: pencil" class="uk-icon-button uk-button-primary" title="Editar"></a>
                                                <a href="#" uk-icon="icon: trash" class="uk-icon-button uk-button-danger" title="Eliminar"></a>
                                            </div>
                                        </div>
                                        <a href="/service/1" class="uk-button uk-button-text">Ver Opiniones</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Repetir para otros servicios -->
                            <div class="service-card">
                                <div class="uk-card uk-card-default uk-card-hover">
                                    <div class="uk-card-body">
                                        <h3 class="uk-card-title">Personal Trainer</h3>
                                        <div class="uk-flex uk-flex-between">
                                            <div class="service-description">
                                                <p class="description-text">Realizo entrenamientos personalizados que se adapten a los gustos, necesidades y objetivos de las personas que acuden a mi.</p>
                                                <p>Estado: <span class="uk-label uk-label-success">Disponible</span></p>
                                                <p class="uk-text-meta">Fecha: 25/07/2024</p>
                                                <a href="/service/1" class="uk-button uk-button-text">Ver Detalles</a>
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
                                                <a href="#" uk-icon="icon: pencil" class="uk-icon-button uk-button-primary" title="Editar"></a>
                                                <a href="#" uk-icon="icon: trash" class="uk-icon-button uk-button-danger" title="Eliminar"></a>
                                            </div>
                                        </div>
                                        <a href="/service/1" class="uk-button uk-button-text">Ver Opiniones</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Repetir para otros servicios -->                                                      
                        </div>
                    </div>
                    <!-- Reseñas -->
                    <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Reseñas de otros usuarios</h3>
                        <div class="divider"></div>
                        <div class="uk-comment-list">
                            <div class="uk-margin">
                                <article class="uk-comment">
                                    <header class="uk-comment-header uk-grid-medium uk-flex-middle" uk-grid>
                                        <div class="uk-width-expand">
                                            <h4 class="uk-comment-title uk-margin-remove"><a class="uk-link-reset" href="#">Usuario 1</a></h4>
                                            <ul class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
                                                <li class="stars">
                                                    <span uk-icon="star" class="uk-text-warning"></span>
                                                    <span uk-icon="star" class="uk-text-warning"></span>
                                                    <span uk-icon="star" class="uk-text-warning"></span>
                                                    <span uk-icon="star" class="uk-text-warning"></span>
                                                    <span uk-icon="star" class="uk-text-warning"></span>
                                                </li>
                                                <li>Hace 2 días</li>
                                            </ul>
                                        </div>
                                    </header>
                                    <div class="uk-comment-body">
                                        <p>Excelente servicio, muy profesional y puntual. ¡Lo recomiendo totalmente!</p>
                                    </div>
                                </article>
                            </div>
                            <div class="uk-margin">
                                <article class="uk-comment">
                                    <header class="uk-comment-header uk-grid-medium uk-flex-middle" uk-grid>
                                        <div class="uk-width-expand">
                                            <h4 class="uk-comment-title uk-margin-remove"><a class="uk-link-reset" href="#">Usuario 2</a></h4>
                                            <ul class="uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top">
                                                <li class="stars">
                                                    <span uk-icon="star" class="uk-text-warning"></span>
                                                    <span uk-icon="star" class="uk-text-warning"></span>
                                                    <span uk-icon="star" class="uk-text-warning"></span>
                                                    <span uk-icon="star" class="uk-text-warning"></span>
                                                    <span uk-icon="star" class="uk-text-muted"></span>
                                                </li>
                                                <li>Hace 1 semana</li>
                                            </ul>
                                        </div>
                                    </header>
                                    <div class="uk-comment-body">
                                        <p>El servicio fue bueno, pero podría mejorar en la puntualidad.</p>
                                    </div>
                                </article>
                            </div>
                        </div>
                        <div class="uk-flex uk-flex-center uk-margin-large-top">
                            <button class="uk-button uk-button-primary">Ver Más Reseñas</button>
                        </div>
                    </div>
                    <!-- Actividad Reciente -->
                    <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Actividad Reciente</h3>
                        <div class="divider"></div>
                        <div class="activity-feed">
                            <div class="activity-item">
                                <p>Adrian ha actualizado su perfil.</p>
                            </div>
                            <div class="activity-item">
                                <p>Adrian ha publicado un nuevo servicio.</p>
                            </div>
                        </div>
                    </div>                   
                    <!-- Recomendaciones -->
                    <div class="uk-card uk-card-default uk-card-body section-container">
                        <h3 class="uk-card-title center-title">Recomendaciones</h3>
                        <div class="divider"></div>
                        <div class="recommendations">
                            <div class="recommendation-item">
                                <p>Recomendación de Esteban: "Excelente profesional con gran experiencia."</p>
                            </div>
                            <div class="recommendation-item">
                                <p>Recomendación de Guido: "Muy confiable y competente en su área."</p>
                            </div>
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