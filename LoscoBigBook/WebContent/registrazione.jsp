<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="database.DBQuery" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

		ServletContext cont = pageContext.getServletContext();

    	String nome=request.getParameter("nome");
    	String cognome=request.getParameter("cognome");
    	String email=request.getParameter("email");
    	String sesso=request.getParameter("sesso");
    	String password=request.getParameter("password");
    	String datanascita=request.getParameter("datanascita");
    	
    	ServletContext context = pageContext.getServletContext();
   	
    	String dbemail=DBQuery.check_email(email, cont);
    	
    	if(dbemail.equals("")){
	    	int i=DBQuery.registrazione(nome, cognome, email, password, datanascita, sesso, context);
	    	
	    	 if(i>0){
	    		 response.sendRedirect("Home.jsp?mex=okreg");
	    		 
	    	 }
	    	 else {
	    	      response.sendRedirect("Home.jsp?mex=errreg");
	    	      }
	    	}
    	else{
    		response.sendRedirect("Home.jsp?mex=email");
    	}
    	%>

</body>
</html>