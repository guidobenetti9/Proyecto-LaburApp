<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" href="/css/logreg.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Chakra+Petch:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
</head>
<body>
	<div class="cont_login">
        <div class="cont_loguito">
            <a href="/"><img src="logonuevo.png" class="loguito"></a>
        </div>
        <div>
            <div class="cont_titulo">
                <h2>Inicia sesión</h2>
            </div>
            <form action="/login" method="POST">
                <div class="cajita">
                    <label>E-mail:</label>
                    <input type="email" name="email" >
                </div>
                <div class="cajita">
                    <label>Contraseña:</label>
                    <input type="password" name="password" >
                </div>
                <div class="cont_boton">
                    <input type="submit" class="boton" value="Inicia sesión" >
                </div>
            </form>
        </div>
    </div>
</body>
</html>