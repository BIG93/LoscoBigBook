<<<<<<< HEAD
<%@page import="database.DBQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
=======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="database.*" %>
>>>>>>> 5f335fd50bd848679217ab66d5d1d80f683f0efe
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
<<<<<<< HEAD
String testo = request.getParameter("testo");
int idutente = Integer.parseInt(request.getParameter("idutente"));
int i = DBQuery.publica_post(idutente, testo);

%>

=======
   int id = Integer.parseInt(request.getParameter("id"));
   String post = request.getParameter("stato");
   int i=DBQuery.publica_post(id, post);
 %>
>>>>>>> 5f335fd50bd848679217ab66d5d1d80f683f0efe
</body>
</html>