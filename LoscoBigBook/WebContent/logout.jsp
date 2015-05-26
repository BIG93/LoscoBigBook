<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null){
			for(int i = 0; i < cookies.length; i++) { 
			    Cookie c = cookies[i];		    
			    if (c.getName().equals("log")) {
			    	// Qui se c'è il cookies, semplicemente l'elimino
			    	c.setMaxAge(0);
			        response.addCookie(c);
			    }
			}
		}
		
		session.setAttribute("loggato", null);
		response.sendRedirect("login.jsp");
	%>
</body>
</html>