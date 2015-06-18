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
ServletContext context = pageContext.getServletContext();

String testo = request.getParameter("testo");
int idutente = Integer.parseInt(request.getParameter("idutente"));
int i = DBQuery.pubblica_post(idutente, testo,context);
%>
</body>
</html>