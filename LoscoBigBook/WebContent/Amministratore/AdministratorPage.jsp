<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>


<!DOCTYPE html>

<html>
    <head>
        <title>Pagina Amministratore</title>
        <link href="AdministratorPageCSS.css" rel="stylesheet" type="text/css"/>
        <link href="../CommonCSS.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
    <%Utente sesuser= (Utente) session.getAttribute("loggato"); %>
        <div id="page"> 
            <h3 style="margin-left: 10%;">Ciao <%out.print(sesuser.nome);%>, sei loggato come amministratore </h3>
        </div>
        
        <div id="top-bar" class="fixed-bar">
            <table id="logo-head">
                <tr>
                    <td>
                        <a href="#"><img src="../logo-losco-big-book.png" alt="lb2"/></a> 
                    </td>
                    <td>
                        <h3 id="social">LoscoBigBook</h3>
                    </td>
            </table>        
            <table id="cerca">  
                 <tr>
                	<form action="../Cerca/cerca.jsp" method="get">
	                    <td>
	                    	<input id="input-cerca" type="text" placeholder="Cerca...">
	                    </td>
	                    <td>
	                    	<input type="submit" value="Cerca" class="btn"></input>
	                    </td>
                    </form>
                </tr>
            </table> 
            <table id="ancore-home-container">
                <tr>
                    <td>
                        <a href="AdministratorPage.jsp"><div class="btn">Home</div></a>
                    </td>
                    <td>
                        <a href="../logout.jsp"><div class="btn">Logout</div></a>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
