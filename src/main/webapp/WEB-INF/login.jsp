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
        .uk-navbar-container {
            background: rgb(33,33,33) !important;
            background: linear-gradient(0deg, rgba(33,33,33,1) 0%, rgba(28,28,28,1) 18%, rgba(19,19,19,1) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%) !important;
        }
        .uk-navbar-nav > li > a {
            color: white;
        }
        .uk-navbar-nav > li > a:hover {
            color: #ffcc00 !important;
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
        <nav class="uk-navbar-container uk-navbar-transparent" uk-navbar>
            <div class="uk-navbar-left">
                <a class="uk-navbar-item uk-logo" th:href="@{/}">LaburaApp</a>
            </div>
            <div class="uk-navbar-right">
                <ul class="uk-navbar-nav">
                    <li><a th:href="@{/}">Inicio</a></li>
                    <li><a th:href="@{/contacto}">Contacto</a></li>
                    <li><a th:href="@{/ayuda}">Ayuda</a></li>              
                </ul>
            </div>
        </nav>
    </header>
    
    <div class="main-container">
        <div uk-slideshow="animation: push; autoplay: true; autoplay-interval: 3000">
            <ul class="uk-slideshow-items">
                <li>
                    <img src="https://fotografias.lasexta.com/clipping/cmsimages01/2020/05/08/E3BC9A26-F5D7-4B1D-9497-72A52CE9CB79/98.jpg?crop=1300,731,x0,y19&width=1900&height=1069&optimize=high&format=webply" alt="Imagen 1" uk-cover>
                </li>
                <li>
                    <img src="https://static.vecteezy.com/system/resources/previews/007/761/180/non_2x/wood-pier-with-sea-and-mountain-at-sunrise-with-beautiful-golden-sky-in-the-morning-and-copy-space-use-as-background-to-display-goods-and-product-free-photo.jpg" alt="Imagen 2" uk-cover>
                </li>
                <li>
                    <img src="https://t3.ftcdn.net/jpg/00/58/86/86/360_F_58868638_dbs4Y60CJ9JaDapGIDhKGj307D0F02kU.jpg" alt="Imagen 3" uk-cover>
                </li>
                <li>
                    <img src="https://img.freepik.com/foto-gratis/pintura-lago-montana-montana-al-fondo_188544-9126.jpg" alt="Imagen 4" uk-cover>
                </li>
                <li>
                    <img src="https://img.freepik.com/fotos-premium/montana-reflejada-lago-fondo-cielo_771703-13802.jpg" alt="Imagen 5" uk-cover>
                </li>
                <li>
                    <img src="https://i.pinimg.com/originals/28/e6/c6/28e6c686522a710e0e3a3c5e17ec5a31.jpg" alt="Imagen 6" uk-cover>
                </li>
                <li>
                    <img src="https://c.wallhere.com/photos/80/c0/landscape_4K_stream_field_trees_fall_Arrowtown_New_Zealand-2166697.jpg!d" alt="Imagen 7" uk-cover>
                </li>
                <li>
                    <img src="https://www.todofondos.net/wp-content/uploads/1920x1080-Paisaje-de-Canada-Naturaleza-HD-Fondo-de-Pantalla-4K-Imagen-Fondo.jpg" alt="Imagen 8" uk-cover>
                </li>
                <li>
                    <img src="https://www.ultraimagehub.com/wallpapers/tr:flp-false,gx-0.4,gy-0.5,q-75,rh-3264,rw-5824,th-1080,tw-1920/1235967060966637628.jpeg" alt="Imagen 9" uk-cover>
                </li>
                <li>
                    <img src="https://i.ytimg.com/vi/NMoLFiIAI6w/maxresdefault.jpg" alt="Imagen 10" uk-cover>
                </li>
            </ul>
        </div>
        
        <div class="login-container">
            <form th:action="@{/login}" method="post">
                <h3>INICIAR SESIÓN</h3>
                
                <input type="email" id="email" name="email" placeholder="Correo electrónico" required>
                
                <input type="password" id="password" name="password" placeholder="Contraseña" required>
                <button type="submit">Ingresar</button>
                <div class="register-links">
                    <a th:href="@{/forgot-password}">¿Olvidaste tu contraseña?</a>
                    <a th:href="@{/register}">Crear una cuenta nueva</a>
                </div>
            </form>
        </div>
    </div>

    <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h5>INFORMACIÓN</h5>
                <ul>
                    <li><a th:href="">Sobre nosotros</a></li>
                    <li><a th:href="">Oportunidades de empleo</a></li>
                    <li><a th:href="">Blog</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h5>LEGAL</h5>
                <ul>
                    <li><a th:href="">Terminos de uso</a></li>
                    <li><a th:href="">Acuerdo de licencia</a></li>
                    <li><a th:href="">Politica de privacidad</a></li>
                    <li><a th:href="">Politica de cookies</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h5>SOPORTE</h5>
                <ul>
                    <li><a th:href="">Contacto</a></li>
                    <li><a th:href="@{/help}">Ayuda</a></li>
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