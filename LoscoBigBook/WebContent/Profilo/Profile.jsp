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
   %>
        <div id="page">  
            <div id="header">
                <h1 id="nome-cognome"><%out.print(sesuser.nome+" "+sesuser.cognome); %></h1>
            </div>
            <div id="middle-container">
                <div id="ProfileImageContainer">
                    <img id="ProfileImage" src="profileimage.jpg" alt="immagine del profilo"/>
                </div> 
                <div id="richiestedamicizia">
                    <div>
                        Richieste d'amicizia
                    </div>
                </div>
                <div id="change-profile-image">
                    <div id="input-file-container">
                        <input type="file" class="btn"/>
                    </div>    
                    <div id="button-change-container">
                        <button class="btn">Cambia</button>
                    </div>
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
                        <p id="nome">Nome: <%out.print(sesuser.nome);%> </p>
                        <p id="cognome">Cognome: <%out.print(sesuser.cognome);%></p>
                        <p id="email">Email: <%out.print(sesuser.email);%></p>
                        <p id="data-di-nascita">Data di Nascita: <%out.print(sesuser.datanascita);%></p>
                        <p id="nato-a"> Nato a: </p>
                        <p id="luogo">Vive a: </p>
                        <p id="stato">Stato sentimentale: </p>
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
                    <td>
                        <input id="input-cerca" type="text" placeholder="Cerca...">
                    </td>
                    <td>
                        <button class="btn">Cerca</button>
                    </td>
                </tr>
            </table> 
            <table id="ancore-home-container">
                <tr>
                    <td>
                        <a href="Profile.jsp"><div class="btn"><%out.print(sesuser.nome);%></div></a>
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
