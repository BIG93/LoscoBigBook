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
   int currentid = Integer.parseInt(request.getParameter("currentid"));
   int id = Integer.parseInt(request.getParameter("id"));
   int i = DBQuery.friend_request(currentid, id);
 %>
</body>
</html>