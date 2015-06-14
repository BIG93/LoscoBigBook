<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Utente sesuser=null;
	sesuser=(Utente) session.getAttribute("loggato");
	
	if(sesuser==null){
		   response.sendRedirect("Home.jsp");
	}
	
	String nome=request.getParameter("nome");
	String cognome=request.getParameter("cognome");
	String email=request.getParameter("email");
	String sesso=request.getParameter("sesso");
	String luogonascita=request.getParameter("luogonascita");
	String residenza=request.getParameter("residenza");
	String password=request.getParameter("password");
	String datanascita=request.getParameter("datanascita");
	String statosentimentale=request.getParameter("statosentimentale");
	
	int i=DBQuery.UPDATE_utente(nome, cognome, email, password, datanascita, sesso, residenza, luogonascita, statosentimentale, sesuser.id);
	 
	 if(i>0){
		 
		 sesuser.setNome(nome);
		 sesuser.setCognome(cognome);
		 sesuser.setEmail(email);
		 sesuser.setDatanascita(datanascita);
		 sesuser.setSesso(sesso);
		 sesuser.setLuogonascita(luogonascita);
		 sesuser.setResidenza(residenza);
		 sesuser.setStatosentimentale(statosentimentale);
		 sesuser.setPassword(password);
		 response.sendRedirect("Profile.jsp?mex=okmod");
	 }
	 else {
	        response.sendRedirect("Profile.jsp?mex=errmod");
	    }
%>

</body>
</html>