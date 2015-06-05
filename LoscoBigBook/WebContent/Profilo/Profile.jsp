<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>
<%@ page import="java.util.ArrayList" %>

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
    
    <script>
		$(function(){
		   $("#dialog").dialog({
		   		show:{
		   	        effect: "slide",
		   	        duration: 500
		   	      },
		   	     buttons:{
		   	    	 "Chiudi": function(){
		   	    		 $( this ).dialog( "close" );	 
		   	      		}
		   	    }
			});
		   });
  </script>
  
   <%
   Utente sesuser=null;
   sesuser=(Utente) session.getAttribute("loggato");
   
   String mexmod = request.getParameter("mex");
	
	if(mexmod != null){
		if (mexmod.equals("okmod")){
			out.print("<div id='dialog' title='Modifiche Effettuate'> Hai modificato il tuo profilo con successo!</div>");
		}
		if (mexmod.equals("errrmod")){
			out.print("<div id='dialog' title='Modifiche non effettuate'> Ci scusiamo, ma le tue modifiche non sono state effettuate </div>");
		}
		
	}

   
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
                    <div style="margin-bottom: 15px; text-align: center;">
                        <h3>Richieste d'amicizia</h3>
                    </div>    
                        <%
                        ArrayList<Friendship> f_list=DBQuery.friendship_list(sesuser.id);
                        for(int i=0; i<f_list.size();i++)
                        {
                        	Utente u=DBQuery.userByID(f_list.get(i).richiedente);
                        	%>
                       <div style="border:3px solid #66ff66; padding:7px; margin-bottom:3px;">
	                       <table>
	                       		<tr>
	                       			<td>
	                       				<a href="<%out.print("Friend-Profile.jsp?id="+f_list.get(i).richiedente);%>" style="color:#66ff66;"><% out.println(u.nome + " " + u.cognome);%></a>
	                       			</td>	
	                       		</tr>	                       		
	                       </table>
                       	   <input type="button" value="Conferma" class="btn" />		
						   <input type="button" value="Rifiuta" class="btn" />
                       </div>
                       	<% 
                        }
                        %>
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
                        <p id="nome">Nome: <%if(sesuser.nome==null){out.print("");}else{out.print(sesuser.nome);}%> </p>
                        <p id="cognome">Cognome: <%if(sesuser.cognome==null){out.print("");}else{out.print(sesuser.cognome);}%></p>
                        <p id="email">Email: <%if(sesuser.email==null){out.print("");}else{out.print(sesuser.email);}%></p>
                        <p id="data-di-nascita">Data di Nascita: <%if(sesuser.datanascita==null){out.print("");}else{out.print(sesuser.datanascita);}%></p>
                        <p id="nato-a"> Nato a: <%if(sesuser.luogonascita==null){out.print("");}else{out.print(sesuser.luogonascita);}%></p>
                        <p id="luogo">Vive a: <%if(sesuser.residenza==null){out.print("");}else{out.print(sesuser.residenza);}%></p>
                        <p id="stato">Stato sentimentale: <%if(sesuser.statosentimentale==null){out.print("");}else{out.print(sesuser.statosentimentale);}%></p>
                        <form action="formmodifica.jsp" ><input type="submit" value="Modifica informazioni" class="btn"/></form>
                    </div>
                    <div id="tabs-3">
                        Qui compariranno gli amici
                    </div>
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
