<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${post.jobsInPost.jobName}</title>

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

    <link rel="stylesheet" href="/css/post.css">
    
     <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
     integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
     crossorigin=""/>
      <!-- Make sure you put this AFTER Leaflet's CSS -->

</head>
<body>
    <header>
        <nav class="uk-navbar-container" uk-navbar>
            <div class="uk-navbar-left">
                <div class="cont_loguito">
                    <a href="/"><img src="/logo.png"></a>
                </div>
                <ul class="uk-navbar-nav">
                    <li><a href="/">Inicio</a></li>
                    <li><a href="/help">C�mo Funciona</a></li>
                    <li><a href="/contact">Contacto</a></li>
                </ul>
            </div>
            <div class="uk-navbar-right">
            	<div class="uk-navbar-right">
					<ul class="uk-navbar-nav">
						<li><a href="/">${userInSession.firstName} ${userInSession.lastName}</a></li>
						<li><a href="/" class="icon-config" uk-icon="icon: cog"></a></li>
						<li><a href="/logout" class="icon-logout" uk-icon="icon: log-out"><i class="fa fa-sign-out-alt"></i></a></li>
					</ul>
				</div>
            </div>
        </nav>
    </header>
    <main>
        <div class="cont_main">
        		<c:if test="${userInSession.id != post.creatorPost.id}">
        			<div class="cont_favs">
        				<a href="/favoritePost/add/${post.id}" class="uk-button uk-button-default">Agregar a favoritos</a>
        			</div>
        		</c:if>
            <div class="cont_titulo">
                <h2 class="uk-h2">${post.creatorPost.firstName} ${post.creatorPost.lastName}</h2>
                <h3 class="uk-h3">${post.municipio}, ${post.localidad} (${post.province})</h3>
                
            </div>
            <div class="cont_mapa">
            	<div id="map"></div>
             </div>
            <div class="cont_info">
                <p>
                    <b>Servicio:</b> ${post.jobsInPost.jobName}
                </p>
                <p>
                    <b>Descripci�n:</b>
                </p>
                <div class="cont_descripcion">
                    <p>${post.postDescription}</p>
                </div>
                <p>
                    <b>Telefono:</b> ${user.phone}
                </p>
                <p>
                    <b>E-mail:</b> ${user.email}
                </p>
                <p>
                    <b>Disponibilidad:</b> ${post.availableDays} - ${post.availableHours}
                </p>
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
            <hr class="uk-divider-icon">
            <div class="cont_reviews">
                <h3>Rese�as</h3>
                <c:forEach items="${reviews}" var="review">
                    <div class="uk-card uk-card-default uk-margin-top">
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
                        <form:textarea path="comment" class="uk-textarea" placeholder="Deja tu rese�a"/>
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
              </div>
                    <div class="cont_boton">
                    	<form:hidden path="postReview" value="${post.id}" />
						<form:hidden path="senderReview" value="${userInSession.id}" />
					    <input type="submit" class="uk-button uk-button-secondary" value="Enviar" >
                    </div>
          		</form:form>
        	</div>
        </div>
    </main>
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
     <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
     integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
     crossorigin=""></script>
	<script type="text/javascript">
    var longitud = parseFloat("${post.longitud}");
    var latitud = parseFloat("${post.latitud}");
    
    if (!isNaN(latitud) && !isNaN(longitud)) {
        var map = L.map('map').setView([latitud, longitud], 13);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
    } else {
        console.error("Error: Coordenadas no v�lidas.");
    }
</script>
</html>