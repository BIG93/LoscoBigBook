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
	 
   <script type="text/javascript">
   function friend_request(){
   	<%
   		String urlID = request.getParameter("id");
   		int urlIDint = Integer.parseInt(urlID);
   		Utente sesuser=null;
   		
   		sesuser=(Utente) session.getAttribute("loggato");
   		int i = DBQuery.friend_request(sesuser.id, urlIDint);
   		
   		response.sendRedirect("Friend-Profile.jsp?id="+urlIDint);
   	%>
   }
   </script>
   
</body>
</html>