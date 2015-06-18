<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="database.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ServletContext context = pageContext.getServletContext();

int richiedente = Integer.parseInt(request.getParameter("richiedente"));
int ricevente = Integer.parseInt(request.getParameter("ricevente"));
int i = DBQuery.friendship_delete(richiedente, ricevente,context);
 %>
</body>
</html>