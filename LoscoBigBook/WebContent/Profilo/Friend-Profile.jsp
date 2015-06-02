<%@page import="sun.net.util.URLUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>

<!DOCTYPE html>
<html>
    <head>
        
        <title>Profilo</title>
        
        <link href="ProfileCSS.css" rel="stylesheet" type="text/css"/>
        <script src="../jquery-1.8.3.js" type="text/javascript"></script>
        <link href="../jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <script src="../jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
        <link href="../CommonCSS.css" rel="stylesheet" type="text/css"/>
        <script>
            $(function() {
              $( "#tabs" ).tabs();
            });
        </script>
  
    </head>
    <body>
    
   
  
   <%
   Utente sesuser=null;
   sesuser=(Utente) session.getAttribute("loggato");
   Utente u = null;
   
   String id = String.valueOf(sesuser.id);
   String urlID = request.getParameter("id").trim();
   int urlIDInt = Integer.parseInt(urlID);
   
   if(urlID.equals(id)){
	   response.sendRedirect("Profile.jsp");
   }
   else{
	   u = DBQuery.userByID(urlIDInt);  
   }
   
   %>
   
        <div id="page">  
            <div id="header">
                <h1 id="nome-cognome"><%out.print(u.nome + " "+ u.cognome);%></h1>
            </div>
            <div id="middle-container">
                <div id="ProfileImageContainer">
                    <img id="ProfileImage" src="profileimage.jpg" alt="immagine del profilo"/>
                </div>   
            </div>    
            <div id="tab-container">
                <div id="tabs">
                    <ul style="background-color: #66ff66;">
                        <li><a href="#tabs-1">Post</a></li>
                      <li><a href="#tabs-2">Informazioni</a></li>
                      <li><a href="#tabs-3">Amici</a></li>
                    </ul>
                    <div id="tabs-1">
                        <div id="postContainer">
                            <div class="post">
                                <h3 class="author-post">Nome Cognome</h3>
                                <p class="post-text">
                               		Post di prova
                                </p>
                                <div id="like-container">
                                    <span id="like-counter">
                                        #mi piace
                                    </span>
                                    <span id="mi-piace">
                                        <a data-target="#" class="tasto-like" style="color: #66ff66;">
                                            Mi piace
                                        </a>
                                    </span> 
                                    <span id="dislike-counter">
                                        #non mi piace
                                    </span>
                                    <span id="non-mi-piace" class="tasto-like">
                                        <a data-target=""  class="tasto-like" style="color: #66ff66;">
                                            Non mi piace
                                        </a>
                                    </span>
                                </div>
                                <div id="comment-container">
                                    <textarea id="inserisci-commento" cols="64" rows="4" placeholder="Commenta..."></textarea>
                                </div>
                            </div>
                        </div>   
                    </div>
                    <div id="tabs-2">
                        <p id="nome">Nome: <%if(u.nome==null){out.print("");}else{out.print(u.nome);}%></p>
                        <p id="cognome">Cognome: <%if(u.cognome==null){out.print("");}else{out.print(u.cognome);}%></p>
                        <p id="email">Email: <%if(u.email==null){out.print("");}else{out.print(u.email);}%></p>
                        <p id="data-di-nascita">Data di Nascita: <%if(u.datanascita==null){out.print("");}else{out.print(u.datanascita);}%></p>
                        <p id="nato-a"> Nato a: <%if(u.luogonascita==null){out.print("");}else{out.print(u.luogonascita);}%></p>
                        <p id="luogo">Vive a: <%if(u.residenza==null){out.print("");}else{out.print(u.residenza);}%></p>
                        <p id="stato">Stato sentimentale: <%if(u.statosentimentale==null){out.print("");}else{out.print(u.statosentimentale);}%></p>
                    </div>
                    <div id="tabs-3">
                        Qui compariranno gli amici
                    </div>
                </div>
            </div>
        </div>  
        <div id="top-bar" class="fixed-bar">
            <table id="logo-head">
                <tr>
                    <td>
                        <a href="../Bacheca/Bacheca.jsp"><img src="../logo-losco-big-book.png" alt="lb2"/></a> 
                    </td>
                    <td>
                        <h3 id="social">LoscoBigBook</h3>
                    </td>
            </table>        
            <table id="cerca">  
                <tr>
                	<form action="../Cerca/cerca.jsp" method="get">
	                    <td>
	                    	<input id="input-cerca" name="input-cerca" type="text" placeholder="Cerca...">
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
                        <a href="Profile.jsp"><div class="btn"><%out.print(sesuser.nome); %></div></a>
                    </td>
                    <td>
                        <a href="../Bacheca/Bacheca.jsp"><div class="btn">Home</div></a>
                    </td>
                    <td>
                        <a href="../logout.jsp"><div class="btn">Logout</div></a>
                    </td>
                </tr>
            </table>
        </div>     
    </body>
</html>
