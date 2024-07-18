<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/css/uikit.min.css" />
<link rel="stylesheet" href="/css/logreg.css">

<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.21.7/dist/js/uikit-icons.min.js"></script>
</head>
<body>
	<div class="uk-container">
		<div>
			<h2>Inicio de sesion admin</h2>
		</div>
        <form action="/loginAdmin" method="POST">
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
</body>
</html>