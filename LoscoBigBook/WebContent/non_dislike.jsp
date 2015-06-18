<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="database.*" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
ServletContext context = pageContext.getServletContext();

int id= Integer.parseInt(request.getParameter("id"));
int id_utente= Integer.parseInt(request.getParameter("idutente"));
int x=DBQuery.dislike_delete(id, id_utente,context);
int i = DBQuery.non_dislike_post(id,context);
%>
</body>
</html>