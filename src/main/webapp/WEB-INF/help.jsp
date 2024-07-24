<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cómo Funciona - Intercambio de Servicios</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.6.22/css/uikit.min.css" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }
        .uk-navbar-container {      
            background: rgb(33,33,33) !important;
			background: linear-gradient(0deg, rgba(33,33,33,1) 0%, rgba(28,28,28,1) 18%, rgba(19,19,19,1) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%) !important;
        }
        .uk-navbar-nav > li > a {
            color: white;
        }
        .uk-navbar-nav > li > a:hover {
            color: #ffcc00 !important; /* Color de texto al pasar el mouse */
        }
        .uk-section-default {
            background-color: #ffffff;
        }
        .uk-section-muted {
            background-color: #f8f8f8;
        }
        .uk-card {
            background-color: #ffffff;
        }
         /*AQUI COMIENZA EL FOOTER*/
       footer {
            background: rgb(33,33,33);
			background: linear-gradient(180deg, rgba(33,33,33,1) 0%, rgba(28,28,28,1) 18%, rgba(19,19,19,1) 45%, rgba(15,15,15,1) 63%, rgba(4,4,4,1) 100%);
            padding: 20px 0;           
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
    </style>
</head>
<body>

    <!-- Barra de Navegación -->
    <nav class="uk-navbar-container uk-navbar-transparent" uk-navbar>
        <div class="uk-navbar-left">
            <a class="uk-navbar-item uk-logo" href="#">LaburaApp</a>
        </div>
        <div class="uk-navbar-right">
            <ul class="uk-navbar-nav">
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Contacto</a></li>
                <c:choose>
                    <c:when test="${not empty sessionScope.usuario}">
                        <li><a href="#">${sessionScope.usuario.nombre}</a></li>
                        <li><a href="configuracionPerfil.jsp" uk-icon="icon: cog"></a></li>
                        <li><a href="cerrarSesion.jsp">Cerrar Sesión</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="iniciarSesion.jsp">Iniciar Sesión</a></li>
                        <li><a href="registrarse.jsp">Registrarse</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </nav>

    <!-- Sección "Cómo Funciona" -->
    <div class="uk-section uk-section-default">
        <div class="uk-container">
            <div class="uk-section uk-section-muted uk-padding-small">
                <h2 class="uk-heading-line uk-text-center"><span>Cómo Funciona</span></h2>
                <p class="uk-text-lead uk-text-center">Descubre cómo puedes encontrar y ofrecer servicios en nuestra plataforma en simples pasos.</p>
                
                <div class="uk-grid uk-grid-large uk-child-width-1-3@m uk-text-center" uk-grid>
                    <div>
                        <div class="uk-card uk-card-default uk-card-body">
                            <span uk-icon="icon: search; ratio: 3"></span>
                            <h3 class="uk-card-title">Busca un Servicio</h3>
                            <p>Utiliza nuestro buscador y los filtros avanzados para encontrar el servicio que necesitas. Explora las opciones disponibles y elige la que mejor se adapte a tus necesidades.</p>
                        </div>
                    </div>
                    <div>
                        <div class="uk-card uk-card-default uk-card-body">
                            <span uk-icon="icon: users; ratio: 3"></span>
                            <h3 class="uk-card-title">Contacta con el Proveedor</h3>
                            <p>Una vez encuentres el servicio adecuado, contacta directamente con el proveedor. Discute los detalles, horarios y condiciones del servicio antes de confirmar.</p>
                        </div>
                    </div>
                    <div>
                        <div class="uk-card uk-card-default uk-card-body">
                            <span uk-icon="icon: happy; ratio: 3"></span>
                            <h3 class="uk-card-title">Recibe el Servicio</h3>
                            <p>Recibe el servicio acordado y disfruta de los beneficios. No olvides dejar una valoración sobre tu experiencia para ayudar a otros usuarios a tomar decisiones informadas.</p>
                        </div>
                    </div>
                </div>
            </div>

            <hr class="uk-divider-icon">

            <!-- Nueva Sección: Solicitar un Servicio -->
            <div class="uk-section uk-section-muted uk-padding-small">
                <h2 class="uk-heading-line uk-text-center"><span>Solicitar un Servicio</span></h2>
                <p class="uk-text-lead uk-text-center">Si no encuentras el servicio que necesitas, puedes solicitarlo fácilmente siguiendo estos pasos:</p>
                <div class="uk-grid uk-child-width-1-2@m uk-text-center" uk-grid>
                    <div>
                        <div class="uk-card uk-card-default uk-card-body">
                            <span uk-icon="icon: pencil; ratio: 3"></span>
                            <h3 class="uk-card-title">Describe tu Necesidad</h3>
                            <p>Publica una solicitud describiendo detalladamente el servicio que necesitas. Incluye toda la información relevante para que los proveedores interesados puedan contactarte.</p>
                        </div>
                    </div>
                    <div>
                        <div class="uk-card uk-card-default uk-card-body">
                            <span uk-icon="icon: comments; ratio: 3"></span>
                            <h3 class="uk-card-title">Recibe Propuestas</h3>
                            <p>Los proveedores interesados en tu solicitud te enviarán propuestas. Revisa sus perfiles, compara opciones y elige la que mejor se adapte a tus necesidades.</p>
                        </div>
                    </div>
                </div>
            </div>

            <hr class="uk-divider-icon">

            <h2 class="uk-heading-line uk-text-center"><span>Preguntas Frecuentes</span></h2>
            <ul uk-accordion>
                <li>
                    <a class="uk-accordion-title" href="#">¿Cómo puedo registrarme?</a>
                    <div class="uk-accordion-content">
                        <p>Para registrarte, simplemente haz clic en el botón "Registrarse" en la parte superior derecha de la página. Completa el formulario con tu información y sigue las instrucciones para confirmar tu cuenta.</p>
                    </div>
                </li>
                <li>
                    <a class="uk-accordion-title" href="#">¿Qué tipos de servicios puedo encontrar?</a>
                    <div class="uk-accordion-content">
                        <p>En nuestra plataforma, puedes encontrar una amplia variedad de servicios, desde reparaciones del hogar, tutorías, asesoría profesional, hasta servicios de bienestar y mucho más.</p>
                    </div>
                </li>
                <li>
                    <a class="uk-accordion-title" href="#">¿Cómo puedo ofrecer mis servicios?</a>
                    <div class="uk-accordion-content">
                        <p>Para ofrecer tus servicios, regístrate como proveedor, completa tu perfil y publica tu servicio detallando lo que ofreces, tus tarifas y disponibilidad.</p>
                    </div>
                </li>
                <li>
                    <a class="uk-accordion-title" href="#">¿Cómo solicito un servicio?</a>
                    <div class="uk-accordion-content">
                        <p>Si no encuentras un servicio que se ajuste a tus necesidades, puedes publicar una solicitud detallando lo que necesitas. Los proveedores interesados te contactarán con sus propuestas.</p>
                    </div>
                </li>
                <li>
                    <a class="uk-accordion-title" href="#">¿Cómo se revisan las propuestas de los proveedores?</a>
                    <div class="uk-accordion-content">
                        <p>Puedes revisar las propuestas de los proveedores mirando sus perfiles, leyendo las valoraciones de otros usuarios y comparando las opciones disponibles antes de tomar una decisión.</p>
                    </div>
                </li>
                <li>
                    <a class="uk-accordion-title" href="#">¿Puedo cancelar una solicitud o servicio?</a>
                    <div class="uk-accordion-content">
                        <p>Sí, puedes cancelar una solicitud o servicio contactando al proveedor y acordando la cancelación. Asegúrate de leer los términos y condiciones de cancelación antes de proceder.</p>
                    </div>
                </li>
                <li>
                    <a class="uk-accordion-title" href="#">¿Cómo puedo proteger mi información personal?</a>
                    <div class="uk-accordion-content">
                        <p>Recomendamos no compartir información personal sensible a través de la plataforma. Utiliza los canales de comunicación proporcionados por la plataforma y revisa nuestra política de privacidad para más detalles.</p>
                    </div>
                </li>
            </ul>
        </div>
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