<%@page import="sun.net.util.URLUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        
        <title>Profilo</title>
        
        
        <script src="jquery-1.8.3.js" type="text/javascript"></script>
        <link href="jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <script src="jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
        
        
        <link href="CommonCSS.css" rel="stylesheet" type="text/css"/>
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
   
   if(sesuser==null){
	   response.sendRedirect("Home.jsp");
	}
   
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
    
    
    
    function elimina_amico(richiedente,ricevente){
  			
            $.ajax({
                    type : "POST",
                    url : "elimina_amico.jsp",
                    data : "richiedente=" + richiedente + "&ricevente=" + ricevente,
                    success : function(data)
                    {
                    	location.reload();
                    
                    }
            });
    }
    
    function commenta(commento, id_post) {
        $(document).ready(function() {
        	var testocommento=commento;
            var idpost=id_post;
        	if(testocommento){
                       $.ajax({
                       type : "POST",
                       url : "commenta.jsp",
                       data : "testo=" + testocommento + "&idutente=" + <%if(sesuser!=null){out.print(sesuser.id);}%> + "&idpost=" + idpost,
                       success : function(data) {
                       location.reload();
                       }
               });
        	}
         }); 	
    }

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
                		else if(f.stato.equals("Confermata")){
                			
                	%>
                	<table>
                	<tr>
                	<td><p class="btn">Amici</p></td><td><input type="button"  value="Rimuovi dagli amici" id="friend-delete" class="btn" onclick="elimina_amico(<%out.print(sesuser.id);%> , <%out.print(urlIDInt);%>);" /></td>
                	</tr>
                	</table>
                	<%
                	}
                	%>
                </div> 
            </div>    
            <div id="tab-container">
                <div id="tabs">
                    <ul style="background-color: #66ff66;">
                        <li><a href="#Post">Post</a></li>
                      <li><a href="#Info">Informazioni</a></li>
                      <li><a href="#Amici">Amici</a></li>
                    </ul>
                    <%
                    if(f!=null){
	                    if(f.stato.equals("Confermata")){
	              %>
	                    <div id="Post">
		                    <% 
		                	ArrayList<Post> p = new ArrayList<Post>();
		                	p=DBQuery.show_post_profile(urlIDInt);
		                	for(int i=0;i< p.size(); i++){
			              	%>              	
	                        <div id="postContainer">
	                            <div class="post">
	                                <span class="author-post"><%out.print(u.nome + " "+ u.cognome);%></span>
	                                <p class="post-text">
	                               		<%out.print(p.get(i).Post);%>
	                                </p>
	                                <div id="like-container">
	                                    <span id="like-counter">
	                                        <%out.print(p.get(i).like);%>
	
	                                    </span>
	                                    <span id="mi-piace">
	                                        <button id="like" class="btn">mi piace</button>
	                                    </span> 
	                                    <span id="dislike-counter">
	
	                                        <%out.print(p.get(i).dislike);%>
	
	                                    </span>
	                                    <span id="non-mi-piace" class="tasto-like">
	                                        <button id="dislike" class="btn">non mi piace</button>
	                                    </span>
	                                </div>
	                                
	                                <div id="all-comment-container">
	                                	<table>	
	                                		<tr>
	                                			<td>                                	
			                                    	<textarea id="inserisci-commento<%out.print(i); %>" name="commento" cols="64" rows="4" placeholder="Commenta..." class="inserisci-commento"></textarea>
			                                    </td>
			                                    <td>
													<input type="button" id="commenta" class="btn" value="commenta" onclick="commenta($.trim($('#inserisci-commento<%out.print(i); %>').val()), <%out.print(p.get(i).id);%>);"></input>
	                                   			</td>
	                                   		</tr>
	                                    </table>
	                                    <%
	                                    	ArrayList<Commento> comment_list = DBQuery.show_comment(p.get(i).id);
	                                    	for(int j=0; j<comment_list.size(); j++){
	                                    %>
		                                	<div id="comment-container">
		                                		<a href="<%out.print("Friend-Profile.jsp?id="+ comment_list.get(j).ID_utente);%>"><span class="author-comment"><%out.print(comment_list.get(j).nome + " "+ comment_list.get(j).cognome);%></span></a>
		                                		<br/>
		                                		<div id="testo-commento">
		                                			<span><%out.print(comment_list.get(j).testo); %></span>
		                                		</div>
		                                		
		                                		<div id="comment-like-container">
				                                    <span id="like-counter">
				                                        <%out.print(comment_list.get(j).like);%> 	
				                                    </span>
				                                    <span id="mi-piace">
				                                        <input type="button" id="like" class="btn" value="mi piace" style="font-size:15px; padding:2px 8px 2px 8px;" onclick=""></input>
				                                    </span> 
				                                    <span id="dislike-counter">
				
				                                        <%out.print(comment_list.get(j).dislike);%>
				
				                                    </span>
				                                    <span id="non-mi-piace" class="tasto-like">
				                                       	<input type="button" id="dislike" class="btn" value="non mi piace" style="font-size:15px; padding:2px 8px 2px 8px;" ></button>
				                                    </span>
				                                </div>
				                                
		                                	</div>
		                                	<%
	                                    	}
		                                	%>
	                                </div>
	                            </div>
	
	                        </div>                       
			               	<%
			               	}
			               	%>  
	                    </div>
	                    <div id="Info">
	                        <p id="nome">Nome: <%if(u.nome==null){out.print("");}else{out.print(u.nome);}%></p>
	                        <p id="cognome">Cognome: <%if(u.cognome==null){out.print("");}else{out.print(u.cognome);}%></p>
	                        <p id="email">Email: <%if(u.email==null){out.print("");}else{out.print(u.email);}%></p>
	                        <p id="data-di-nascita">Data di Nascita: <%if(u.datanascita==null){out.print("");}else{out.print(u.datanascita);}%></p>
	                        <p id="nato-a"> Nato a: <%if(u.luogonascita==null){out.print("");}else{out.print(u.luogonascita);}%></p>
	                        <p id="luogo">Vive a: <%if(u.residenza==null){out.print("");}else{out.print(u.residenza);}%></p>
	                        <p id="stato">Stato sentimentale: <%if(u.statosentimentale==null){out.print("");}else{out.print(u.statosentimentale);}%></p>
	                    </div>
	                    <div id="Amici">
	                        <%
                        ArrayList<Friendship> confirmed_list=DBQuery.confirmed_friend(urlIDInt);
                        	
	                        for(int j=0; j<confirmed_list.size();j++){
	                        	Utente u_friend=null;
	                        	
	                        	if(urlIDInt==confirmed_list.get(j).richiedente)
	                        	{
	                        		u_friend=DBQuery.userByID(confirmed_list.get(j).ricevente);
	                        	}
	                        	else
	                        	{
	                        		u_friend=DBQuery.userByID(confirmed_list.get(j).richiedente);
	                        	}
	                        	%>
	                        	<div style="border:1px solid #66ff66; padding:7px; margin-bottom:3px; text-align: center;">
	                        		<a href="<%out.print("Friend-Profile.jsp?id="+u_friend.id);%>" style="color:black;"><% out.println(u_friend.nome + " " + u_friend.cognome);%></a></br>
	                       	    </div>
	                        <%
                        
                        }
                        %>
                        
	                    </div>
	                    <%
	                    }
	                    else if(f.stato.equals("in attesa")){
                   	%>
                    	<div id="Post">Aggiungi agli amici per visualizzare i Post</div>
                    	<div id="Info">Aggiungi agli amici per visualizzare le info</div>
                    	<div id="Amici">Aggiungi agli amici per visualizzare gli amici</div>
                   	<% 
                    	}
                    }
	                else{
	                	%>
	                	<div id="Post">Aggiungi agli amici per visualizzare i Post</div>
	                   	<div id="Info">Aggiungi agli amici per visualizzare le info</div>
	                   	<div id="Amici">Aggiungi agli amici per visualizzare gli amici</div>
	                	<% 
	                }
                    %>
                </div>
            </div>
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
                        <a href="Profile.jsp"><div class="btn"><%out.print(sesuser.nome); %></div></a>
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
