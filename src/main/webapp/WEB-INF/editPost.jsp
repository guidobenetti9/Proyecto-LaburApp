<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuevo post</title>
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit-icons.min.js"></script>
    <script src="uikit/dist/js/uikit-icons.min.js"></script>

    <!--Fuentes-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Zain:wght@200;300;400;700;800;900&display=swap" rel="stylesheet">

    <!--Css-->
    <link rel="stylesheet" href="/css/editPost.css">
    
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
	        background-color: #dfb550; /* Color de fondo cuando el cursor pasa sobre el boton */
	        color: #000000 !important; /* Color del texto cuando el cursor pasa sobre el boton */
	        font-weight: bold; /* Texto en negrita*/
    	}
    </style>
    
</head>
<body>
    <nav class="uk-navbar-container" uk-navbar>
            <div class="uk-navbar-left">
                <div class="uk-width-logo">
                    <a href="/">
                        <img src="logo.png" class="uk-width-1-1 uk-margin-small-left">
                    </a>
                </div>          
                <ul class="uk-navbar-nav">
                    <li><a href="/">Inicio</a></li>
                    <li><a href="/help">Ayuda</a></li>
                    <li><a href="/contact">Contacto</a></li>
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
    <main>
        <div class="cont_main">
            <div class="cont_titulo">
                <h3 class="uk-h3">Edita una publicación</h3>
            </div>
            <div>
                <form:form action="/editPost" method="put" modelAttribute="newPost">
					<div class="cajita">
                        <form:label path="postTittle" >Titulo:</form:label>
                        <form:input path="postTittle" class="uk-input"/>
                        <form:errors path="postTittle" class="uk-text-danger uk-text-small"/>
                    </div>
                    <div class="cajita">
                        <form:label path="postDescription" >Descripción:</form:label>
                        <form:textarea path="postDescription" class="uk-textarea"></form:textarea>
                        <form:errors path="postDescription" class="uk-text-danger uk-text-small"/>
                    </div>
                    <div class="cajita">
                        <form:label path="jobsInPost">Servicio:</form:label>
                        <form:select path="jobsInPost" class="uk-select">
                            <c:forEach items="${allJobs}" var="job">
                                <form:option value="${job}">${job.jobName}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class="cajita">
                        <form:label path="availableDays" >Dias disponibles:</form:label>
                        <br>
                        <form:checkboxes path="availableDays" items="${days}"/>
                        <form:errors path="availableDays" class="uk-text-danger uk-text-small"/>
                    </div>
                    <div class="cajita">
                        <form:label path="availableHours" >Horarios disponibles:</form:label>
                        <form:input path="availableHours" class="uk-input"/>
                        <form:errors path="availableHours" class="uk-text-danger uk-text-small"/>
                    </div>
                    <div class="cajita">
                        <form:label path="province" >Provincia:</form:label>
                        <form:select path="province" class="uk-select" id="selectProvincias">
                        </form:select>
                    </div>
                    
                      <div class="cajita">
					        <label for="municipio">Municipio:</label>
					        <select id="selectMunicipios" name="municipio" class="uk-select">
					        </select>
					  </div>
					  <div class="cajita">
					        <label for="localidad">Localidad:</label>
					        <select id="selectLocalidades" name="localidad" class="uk-select">
					        </select>
					  </div>>
                    <div class="cont_botones">
                    	<form:hidden path="typePost" value="Ofrecido"/>
                        <form:hidden path="creatorPost" value="${userInSession.id}"/>
                        <form:hidden path="id" value="${post.id}"/>
                        <input type="hidden" value="put" name="_method">
                        <form:input type="hidden" path="latitud" id="latitud"/>
        				<form:input type="hidden" path="longitud" id="longitud"/>
        				<input type="hidden" name="nombreLocalidad" id="nombreLocalidad"/>
        				<input type="hidden" name="nombreMunicipio" id="nombreMunicipio"/>
                        <a href="/" class="uk-button uk-button-danger uk-margin-right">Cancelar</a>
                        <input type="submit" value="Editar" class="uk-button uk-button-secondary">
                    </div>
                </form:form>
            </div>
        </div>
    </main>
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
    <script src="/js/post.js"></script>
</body>
</html>