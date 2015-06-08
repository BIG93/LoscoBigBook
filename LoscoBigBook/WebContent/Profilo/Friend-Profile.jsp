<%@page import="sun.net.util.URLUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>

<!DOCTYPE html>
<html>
    <head>
        
        <title>Profilo</title>
        
        
        <script src="../jquery-1.8.3.js" type="text/javascript"></script>
        <link href="../jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <script src="../jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
        
        
        <link href="../CommonCSS.css" rel="stylesheet" type="text/css"/>
        <link href="ProfileCSS.css" rel="stylesheet" type="text/css"/>
        
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
   
   String urlID = request.getParameter("id");
   String id = String.valueOf(sesuser.id);
   int urlIDInt = Integer.parseInt(urlID);
   Utente u=null;
  
   if(urlID.equals(id)){
	   response.sendRedirect("Profile.jsp");
   }
   
   u = DBQuery.userByID(urlIDInt);
   
   %>
  
   <script type="text/javascript">
    $(document).ready(function() {
        $("#friend-request").click(function() {
            currentid = <%out.print(sesuser.id);%>;
            id = <%out.print(urlIDInt);%>;
                $.ajax({
                type : "POST",
                url : "friend-request.jsp",
                async : false,
                data : "currentid=" + currentid + "&id=" + id,
                success : function(data) {
                    location.reload();
                }
            });
        });
    });

</script>
  
        <div id="page">  
            <div id="header">
                <h1 id="nome-cognome"><%out.print(u.nome + " "+ u.cognome);%></h1>
            </div>
            <div id="middle-container">
                <div id="ProfileImageContainer">
                    <img id="ProfileImage" src="ProfileImage/profileimage.jpg" alt="immagine del profilo"/>
                </div>  
                <div id="friend-request-container">
                	<% 
                		Friendship f= DBQuery.friendship_status(sesuser.id,urlIDInt);
                		
                		if(f==null){
                	%>
                		<button id="friend-request" class="btn">Aggiungi agli amici</button>      	
                	<%
                		}
                		else if(f.stato.equals("in attesa")){
                	%>
                		<h3>Amicizia in attesa di approvazione</h3>
                	<%
                		}
                	%>
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
                                        <a href="#" class="tasto-like" style="color: #66ff66;">
                                            Mi piace
                                        </a>
                                    </span> 
                                    <span id="dislike-counter">
                                        #non mi piace
                                    </span>
                                    <span id="non-mi-piace" class="tasto-like">
                                        <a href="#" class="tasto-like" style="color: #66ff66;">
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
            <form action="../Cerca/cerca.jsp" method="get">     
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
