<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.6.22/css/uikit.min.css" />
    <style>
        body {
            font-family: 'Chakra Petch', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
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

        .register-button {
            list-style-type: none;
        }

        .btn-registrarse {
            border: 2px solid #dfb550;
            color: #dfb550;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
            box-sizing: border-box;
            min-width: 150px;
            line-height: 1.5;
            text-align: center;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-registrarse:hover {
            background-color: #dfb550;
            color: #000000 !important;
            text-decoration: none;
            font-weight: bold;
        }

        .icon-config {
            transition: color 0.3s ease, transform 0.3s ease !important;
        }

        .icon-config:hover {
            transform: scale(1.3);
        }

        .icon-logout i {
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .icon-logout:hover i {
            color: rgb(255, 122, 122);
            color: linear-gradient(90deg, rgba(255,122,122,1) 0%, rgba(255,89,89,1) 26%, rgba(255,70,70,1) 57%, rgba(255,0,0,1) 100%);
            transform: scale(1.5);
        }

        

        /* Barra de busqueda */
       
        .search-bar {
            position: absolute;
            top: 25%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 20;
        }

        .uk-search {
            margin-top: 60px;
            margin-bottom: 50px;
            display: flex;
            width: 230px; /* Ancho del contenedor de busqueda */
            transition: all 0.7s ease;
        }

        .uk-search:hover {
            width: 600px;
            
        }

        .uk-search-input {
            background-color: #fff !important;/* Fondo blanco */
            width: 100%;/* Ancho del campo de búsqueda */
            padding-right: 40px;/* Espacio para el icono de la lupa */
            color: #000 !important;/* Color del texto */
            border-color: #000 !important;
        }

        .uk-search-icon-flip {
            position: absolute;
            right: 10px;
            top: 50%;
            color: #000 !important; /* Color del icono */
        }

        .uk-search-input:focus {
            border-color: #ffcc00 !important;/* Color del borde al hacer clic */
        }

        /*Bara de busqueda*/

        /*Carousel*/
        
        
        .carousel-container .uk-slideshow-items li {
            height: 100%; /* Asegurarse de que los elementos de la lista ocupen toda la altura del carrusel */
        }
        
        .carousel-container img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Asegurarse de que las imágenes cubran completamente el carrusel sin distorsionarse */
        }
        
        .carousel-container {
		    position: relative;
		    width: 100%;
		    height: 100%; /* Ocupa toda la pantalla */
		    margin-top: 0;
		    z-index: 1;
		}


        
        /*Titulo*/
        .h1-container {
            position: absolute;
            bottom: 0 !important; /* Para ubicarlo en el margen inferior del carrusel */
            left: 50%;
            transform: translateX(-50%);
            padding: 20px;
            width: 100%;
            height: 150px;
            background: rgb(33,33,33);
            background: linear-gradient(180deg, rgba(33,33,33,0.9) 0%, rgba(28,28,28,0.9) 18%, rgba(19,19,19,0.95) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%) !important;         
        }

        .main-title {                                                             
            color: #ffffff; 
            width: 50%;
            margin: auto;
            text-align: center; 
        }
        
        .main-title h1 {
            color: #dfb550;
        }
        
        .description {
            text-align: center;
            font-size: 11px;        
        }
        
        .slogan{
        	background-color:#393939;
        	height:17px;
        	color: #dfb550;
        }
        
        .main-container {
            position: relative;
            flex: 1;
            width: 100%;
        }
        .uk-slideshow-items img {
            height: 100vh;
            width: 100%;
            object-fit: cover;
        }
        .login-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 100%;
            pointer-events: none;
            z-index: 1000;
        }
        form {
            position: relative;
            display: flex;
            flex-direction: column;
            background: rgba(255, 255, 255, 0.7);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border: 2px solid #dfb550;
            width: 300px;
            pointer-events: auto;
        }
        h3 {
            text-align: center;
            color: #333;
            font-weight: bold;
        }
        label, input, button {
            margin: 10px 0;
        }
        input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s;
        }
        input:focus {
            border-color: #dfb550;
            outline: none;
        }
        button {
            height: 40px;
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            font-size: 18px;
        }
        button:hover {
            background: rgb(227,222,141);
            background: linear-gradient(0deg, rgba(227,222,141,1) 0%, rgba(236,228,146,1) 0%, rgba(224,210,93,1) 50%, rgba(217,185,57,1) 100%);
            color: #000;
            border: 1px solid #000000;
            font-weight: bold;
        }
        .register-links {
            text-align: center;
            margin-top: 10px;
        }
        .register-links a {
            color: #333;
            text-decoration: none;
            display: block;
            margin: 5px 0;
        }
        .register-links a:hover {
            color: #dfb550;
            font-weight: bold;
        }
        
        
        footer {
		    position: relative;
		    bottom: 0;
		    left: 0;
		    width: 100%;
		    z-index: 2; /* Posiciona el footer sobre el carrusel */
		    background: rgb(33,33,33);
            background: linear-gradient(180deg, rgba(33,33,33,1) 0%, rgba(28,28,28,1) 18%, rgba(19,19,19,1) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%);
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
        .footer-bottom {
            background: #181818;
            color: #e0e0e0;
            padding: 10px 20px;
            font-size: 14px;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .footer-bottom button {
            color: white !important;
        }
        .separator {
            width: 80%;
            margin: 10px auto;
            border-top: 1px solid #fff;
        }
        .footer-container > .footer-column {
            padding: 0 40px;
        }
         .uk-button-default {
	        border: 2px solid #ffffff;
	        color: #000000;
	        transition: background-color 0.3s, color 0.3s;
    	}

    	.uk-button-default:hover {
	    	border: 2px solid #000000;
	        background-color: #dfb550;
	        color: #000000 !important;
	        font-weight: bold;
    	}
    </style>
</head>
<body>
    <header>              
        <!-- Barra de Navegación -->
        <nav class="uk-navbar-container uk-navbar-transparent" uk-navbar>
            <div class="uk-navbar-right">
                <ul class="uk-navbar-nav">  
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
                     <li><a href="/">Inicio</a></li>
                 </ul>
             </div>	 	              
        </nav>
    </header>
    
    <div class="main-container">
        <div uk-slideshow="animation: push; autoplay: true; autoplay-interval: 3000">
            <ul class="uk-slideshow-items">
                <li>
                    <img src="/img/imgcm.jpg" alt="Imagen 1" uk-cover>
                </li>
                <li>
                    <img src="/img/img2.jpg" alt="Imagen 2" uk-cover>
                </li>
                <li>
                    <img src="/img/img4.jpg" alt="Imagen 3" uk-cover>
                </li>
                <li>
                    <img src="/img/img6.jpg" alt="Imagen 4" uk-cover>
                </li>
                <li>
                    <img src="/img/img7.webp" alt="Imagen 5" uk-cover>
                </li>
                <li>
                    <img src="/img/imgp.jpg" alt="Imagen 6" uk-cover>
                </li>
                <li>
                    <img src="/img/imga.jpg" alt="Imagen 7" uk-cover>
                </li>
    
            </ul>
        </div>
        
        <div class="login-container">
            <form action="/login" method="post">
                <h3>INICIAR SESIÓN</h3>
                
                <input type="email" id="email" name="email" placeholder="Correo electrónico" required>
                
                <input type="password" id="password" name="password" placeholder="Contraseña" required>
                <button type="submit">Ingresar</button>
                <div class="register-links">
                    <a href="">¿Olvidaste tu contraseña?</a>
                    <a href="/register">Crear una cuenta nueva</a>
                </div>
            </form>
        </div>
    </div>

    <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h5>INFORMACIÓN</h5>
                <ul>
                    <li><a href="">Sobre nosotros</a></li>
                    <li><a href="">Oportunidades de empleo</a></li>
                    <li><a href="">Blog</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h5>LEGAL</h5>
                <ul>
                    <li><a href="">Terminos de uso</a></li>
                    <li><a href="">Acuerdo de licencia</a></li>
                    <li><a href="">Politica de privacidad</a></li>
                    <li><a href="">Politica de cookies</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h5>SOPORTE</h5>
                <ul>
                    <li><a href="/contact">Contacto</a></li>
                    <li><a href="<c:url value='/help' />">Ayuda</a></li>
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