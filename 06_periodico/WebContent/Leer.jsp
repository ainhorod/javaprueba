<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
 
<title>Noticiero</title>
</head>
<body>

 <!--Import jQuery before materialize.js-->
 
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
  

<h2>Leer noticias</h2>

<a class="card-panel teal lighten-2, waves-effect waves-light btn-large" a href="Consultar" type="submit" name="action">Consultar
  </a>

	<form action="NuevaNoticia" method="post">

		<p>email: <input type="mail" name="email"></p>
		 <!--  <p>categoria: <input type="text" name="id_categoria"></p> -->
		 <p>categorias: <input type="int" name="categorias"></p>
		<p>titulo: <input type="text" name="titulo"></p>
		<p>contenido: <input type="text" name="contenido"></p>
		
 <button class="card-panel teal lighten-2, btn waves-effect waves-light" type="submit" name="action">Enviar noticia
    <i class="material-icons right">send</i>
  </button>
 
</form>

	<%
String msg = (String)session.getAttribute("servletMsg");
out.println(msg);
	%>

</body>
</html>