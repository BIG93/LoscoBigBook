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
 
 int id=Integer.parseInt(request.getParameter("id"));
 int x=DBQuery.delete_comments(id,context);
 int i=DBQuery.post_delete(id,context);
 %>
</body>
</html>