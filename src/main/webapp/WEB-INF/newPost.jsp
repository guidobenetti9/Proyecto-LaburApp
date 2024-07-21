<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="css/new.css">
</head>
<body>
    <header>
        <div class="cont_header">
            <div class="cont_loguito">
                <a href="/"><img src="logonuevo.png"></a>
            </div>
            <div>
                <h2 class="uk-h2">laburApp: agarrá la pala</h2>
            </div>
        </div>
    </header>
    <main>
        <div class="cont_main">
            <div class="cont_titulo">
                <h3 class="uk-h3">Crea una nueva publicación</h3>
            </div>
            <div>
                <form:form action="/newPost" method="POST" modelAttribute="newPost">
                    <div class="cajita">
                        <form:label path="postTittle" >Titulo:</form:label>
                        <form:input path="postTittle" class="uk-input"/>
                        <form:errors path="postTittle"/>
                    </div>
                    <div class="cajita">
                        <form:label path="postDescription" >Descripción:</form:label>
                        <form:textarea path="postDescription" class="uk-textarea"></form:textarea>
                        <form:errors path="postDescription"/>
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
                        <form:input path="availableDays" class="uk-input"/>
                        <form:errors path="availableDays"/>
                    </div>
                    <div class="cajita">
                        <form:label path="availableHours" >Horarios disponibles:</form:label>
                        <form:input path="availableHours" class="uk-input"/>
                        <form:errors path="availableHours"/>
                    </div>
                    <div class="cajita">
                        <form:label path="province" >Provincia:</form:label>
                        <form:select path="province" class="uk-select">
                            <form:option value="Buenos Aires">Buenos Aires</form:option>
                            <form:option value="Ciudad Autonoma de Buenos Aires">Ciudad Autonoma de Buenos Aires</form:option>
                            <form:option value="Catamarca">Catamarca</form:option>
                            <form:option value="Chaco">Chaco</form:option>
                            <form:option value="Chubut">Chubut</form:option>
                            <form:option value="Cordoba">Cordoba</form:option>
                            <form:option value="Corrientes">Corrientes</form:option>
                            <form:option value="Entre Rios">Entre Rios</form:option>
                            <form:option value="Formosa">Formosa</form:option>
                            <form:option value="Jujuy">Jujuy</form:option>
                            <form:option value="La Pampa">La Pampa</form:option>
                            <form:option value="La Rioja">La Rioja</form:option>
                            <form:option value="Mendoza">Mendoza</form:option>
                            <form:option value="Misiones">Misiones</form:option>
                            <form:option value="Neuquen">Neuquen</form:option>
                            <form:option value="Rio Negro">Rio Negro</form:option>
                            <form:option value="Salta">Salta</form:option>
                            <form:option value="San Juan">San Juan</form:option>
                            <form:option value="San Luis">San Luis</form:option>
                            <form:option value="Santa Cruz">Santa Cruz</form:option>
                            <form:option value="Santa Fe">Santa Fe</form:option>
                            <form:option value="Santiago del Estero">Santiago del Estero</form:option>
                            <form:option value="Tierra del Fuego">Tierra del Fuego</form:option>
                            <form:option value="Tucuman">Tucuman</form:option>
                        </form:select>
                    </div>
                    <div class="cajita">
                        <form:label path="city" >Ciudad:</form:label>
                        <form:input path="city" class="uk-input"/>
                        <form:errors path="city"/>
                    </div>
                    <div class="cont_botones">
                        <form:hidden path="creatorPost" value="${userInSession.id}"/>
                        <a href="/" class="uk-button uk-button-danger uk-margin-right">Cancelar</a>
                        <input type="submit" value="Crear" class="uk-button uk-button-secondary">
                    </div>
                </form:form>
            </div>
        </div>
    </main>
</body>
</html>