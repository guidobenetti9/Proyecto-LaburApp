<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Perfil</title>
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
        .newPost-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 700px;
            pointer-events: none;
            z-index: 1000;
        }
        form {
            position: relative;
            display: flex;
            flex-direction: column;
            background: rgba(29, 28, 28, 0.9);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border: 2px solid #dfb550;
            width: 700px;
            pointer-events: auto;            
        }
        
        .custom-label {
    		color: #ffffff; /* Cambia este valor por el color deseado */
    		
		}
		
		.checkbox-group {
		    display: flex;
		    flex-wrap: wrap; /* Permite que los checkboxes se muevan a la siguiente línea si no hay suficiente espacio */
		}
		
		.checkbox-group label {
		    margin-right: 20px; /* Espacio entre checkboxes, ajusta según tu preferencia */
		    display: flex;
		    align-items: center; /* Centra verticalmente el texto con respecto al checkbox */
		}
        h3 {
            text-align: center;
            color: #dfb550;
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
        
        footer {
            background: rgb(33,33,33);
            background: linear-gradient(180deg, rgba(33,33,33,1) 0%, rgba(28,28,28,1) 18%, rgba(19,19,19,1) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%);
            padding: 20px 0;
            position: relative;
            z-index: 1;
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

    	.uk-button-default:hover {
    		border: 2px solid #000000;
        	background-color: #dfb550;
        	color: #000000 !important;
        	font-weight: bold;
    	}
    	
    	.cont_boton{
    		margin-top: 10px;
    	}
    	
    	.scrollable-form {
		    max-height: 80vh; /* Ajusta según sea necesario para tu diseño */
		    overflow-y: auto; /* Habilita la barra de desplazamiento vertical */
		    padding: 20px; /* Opcional: Añade relleno */
		    box-sizing: border-box; /* Asegúrate de que el relleno se incluya en el tamaño total */
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
                    <li><a href="/userProfile">${userInSession.firstName} ${userInSession.lastName}</a></li>
                    <li><a href="/user/edit/${userInSession.id}" class="icon-config" uk-icon="icon: cog"></a></li>
                    <li><a href="/logout" class="icon-logout"><i class="fa fa-sign-out-alt"></i></a></li>
                 </ul>
             </div>	 	              
        </nav>
    </header>
    
    <div class="main-container">
        <div uk-slideshow="animation: push; autoplay: true; autoplay-interval: 3000">
            <ul class="uk-slideshow-items">
                <li>
                    <img src="/img/imgch.jpg" uk-cover>
                </li>
                <li>
                    <img src="/img/imgce.jpg" alt="Imagen 2" uk-cover>
                </li>
                <li>
                    <img src="/img/img17.jpg" alt="Imagen 3" uk-cover>
                </li>
                <li>
                    <img src="/img/img5.jpg" alt="Imagen 4" uk-cover>
                </li>
                <li>
                    <img src="/img/imgmec.jpg" alt="Imagen 5" uk-cover>
                </li>
                <li>
                    <img src="/img/imgmu.jpg" alt="Imagen 6" uk-cover>
                </li>
               
            </ul>
        </div>
        
        <div class="newPost-container">
        	<div class="scrollable-form">
	            <form:form action="/editProfile" method="post" modelAttribute="newUser" class="uk-form-stacked">
	            		<h3>Edita tu perfil</h3>
						<div class="uk-margin-bottom">			
	                        <form:label path="firstName" >Nombre:</form:label>
							<form:input path="firstName" class="uk-input"/>
							<form:errors path="firstName"/>
						</div>
						<div class="uk-margin-bottom">
							<form:label path="lastName" >Apellido:</form:label>
							<form:input path="lastName" class="uk-input"/>
							<form:errors path="lastName"/>
						</div>
						<div class="uk-margin-bottom">
							<form:label path="username" >Nombre de Usuario:</form:label>
							<form:input path="username" class="uk-input"/>
							<form:errors path="username"/>
						</div>			
						<div>
							<form:label path="email" >E-mail:</form:label>
							<form:input path="email" class="uk-input"/>
							<form:errors path="email"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="password" >Contraseña:</form:label>
							<form:password path="password" class="uk-input"/>
							<form:errors path="password"/>
						</div>      
						<div class="uk-margin-bottom">
							<form:label path="confirm" >Conf. Contraseña:</form:label>
							<form:password path="confirm" class="uk-input"/>
							<form:errors path="confirm"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="birthDate" >Fecha de nacimiento:</form:label>
							<form:input type="date" path="birthDate" class="uk-input"/>
							<form:errors path="birthDate"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="nationality" >Nacionalidad:</form:label>
							<form:input path="nationality" class="uk-input"/>
							<form:errors path="nationality"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="province" >Provincia:</form:label>
							<form:input path="province" class="uk-input"/>
							<form:errors path="province"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="city" >Ciudad:</form:label>
							<form:input path="city" class="uk-input"/>
							<form:errors path="city"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="province" >Provincia:</form:label>
							<form:input path="province" class="uk-input"/>
							<form:errors path="province"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="phone" >Telefono:</form:label>
							<form:input path="phone" class="uk-input"/>
							<form:errors path="phone"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="alternativePhone" >Telefono alternativo:</form:label>
							<form:input path="alternativePhone" class="uk-input"/>
							<form:errors path="alternativePhone"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="facebook" >Facebook:</form:label>
							<form:input path="facebook" class="uk-input"/>
							<form:errors path="facebook"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="twitter" >Twitter:</form:label>
							<form:input path="twitter" class="uk-input"/>
							<form:errors path="twitter"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="instagram" >Instagram:</form:label>
							<form:input path="instagram" class="uk-input"/>
							<form:errors path="instagram"/>
						</div>
	                    <div class="uk-margin-bottom">
							<form:label path="linkedin" >Linkedin:</form:label>
							<form:input path="linkedin" class="uk-input"/>
							<form:errors path="linkedin"/>
						</div>
						<div class="cont_boton">	                    
		                    <form:hidden path="id" value="${userInSession.id}"/>
	                    	<input type="hidden" value="put" name="_method">
							<div class="cont_boton">
								<a href="/" class="uk-button uk-button-danger uk-margin-right">Cancelar</a>
								<input type="submit" value="Editar" class="uk-button uk-button-secondary">
							</div>
	                	</div>
				</form:form>
            </div>
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
    <script src="/js/post.js"></script>
</body>
</html>