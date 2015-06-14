<%@page import="database.DBQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String testo = request.getParameter("testo");
int idutente = Integer.parseInt(request.getParameter("idutente"));
int i = DBQuery.publica_post(idutente, testo);

%>

</body>
</html>