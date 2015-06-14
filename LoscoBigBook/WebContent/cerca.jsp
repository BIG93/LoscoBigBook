<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<title>Cerca</title>
	
	<link href="CommonCSS.css" rel="stylesheet" type="text/css"/>
	<link href="cerca.css" rel="stylesheet" type="text/css"/>
	
</head>	

<body>

<%
Utente sesuser=null;
sesuser=(Utente) session.getAttribute("loggato");

if(sesuser==null){
	   response.sendRedirect("Home.jsp");
}
%>

 <div id="page">  
        <%
        	if(request.getParameter("input-cerca").equals("")){
        %>
        	<h3 style="text-align: center">Inserisci un testo nella casella in alto</h3>
       
    	<%			
        	}
        	else{
        		
        		String ricerca =request.getParameter("input-cerca");
        		ArrayList<Utente> userfind_search = DBQuery.User_search(ricerca);
        		if(userfind_search.size()==0){
        			%>
        				<h3 style="margin-left:5%">Nessun utente trovato</h3>
        			<% 
        		}
        		else{
                %>
                	<h3 style="margin-left:5%">Risultato della ricerca</h3>
                <% 
           			for (int i = 0; i < userfind_search.size(); i++){
           				Utente u = userfind_search.get(i);
            	%>
		           		<div id="friends">
		           			<a id="friend-find" href="<%out.print("Friend-Profile.jsp?id="+ u.id); %>"><%out.print(u.nome +" "+ u.cognome);%></a>
		           		</div>
            	<%			
            		}
        		}
        	}
        %>
           
        </div>
        
        
        <div id="top-bar" class="fixed-bar">
            <table id="logo-head">
                <tr>
                    <td>
                        <a href="Bacheca.jsp"><img src="logo-losco-big-book.png" alt="lb2"/></a> 
                    </td>
                    <td>
                        <h3 id="social">LoscoBigBook</h3>
                    </td>
            </table>  
            <form action="cerca.jsp" method="get">      
	            <table id="cerca">  
	                 <tr>
	                    <td>
	                    	<input id="input-cerca" name="input-cerca" type="text" placeholder="Cerca...">
	                    </td>
	                    <td>
	                    	<input type="submit" value="Cerca" class="btn"></input>
	                    </td>   
	                </tr>
	            </table> 
            </form>
            <table id="ancore-home-container">
                <tr>
                    <td>
                        <a href="Profile.jsp"><div class="btn"><%out.print(sesuser.nome);%></div></a>
                    </td>
                    <td>
                        <a href="Bacheca.jsp"><div class="btn">Home</div></a>
                    </td>
                    <td>
                        <a href="logout.jsp"><div class="btn">Logout</div></a>
                    </td>
                </tr>
            </table>
        </div>
</body>

</html>