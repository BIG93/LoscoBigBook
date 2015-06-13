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
   int id = Integer.parseInt(request.getParameter("id"));
   String post = request.getParameter("stato");
   int i=DBQuery.publica_post(id, post);
 %>
</body>
</html>