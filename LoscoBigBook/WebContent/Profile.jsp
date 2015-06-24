<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        
        <title>Profilo</title>
        
        <link href="ProfileCSS.css" rel="stylesheet" type="text/css"/>
        <script src="function.js" type="text/javascript"></script>
        <script src="jquery-1.8.3.js" type="text/javascript"></script>
        <link href="jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <script src="jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
        <link href="CommonCSS.css" rel="stylesheet" type="text/css"/>
        <script>
            $(function() {
              $( "#tabs" ).tabs();
            });
        </script>
  
    </head>
    <body>
    
     <%
     ServletContext context = pageContext.getServletContext();
     
   Utente sesuser=null;
   sesuser=(Utente) session.getAttribute("loggato");
   
   if(sesuser==null){
	   response.sendRedirect("Home.jsp");
   }
   
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
                	<%
                	String photo=DBQuery.photoById(sesuser.id,context);
                	if(photo.equals("")){
                		photo=DBQuery.photoById(0,context);
                	}
                	%>
                	
                    <img id="ProfileImage" src="<%out.print(photo); %>" alt="immagine del profilo"/>
                </div> 
                <div id="richiestedamicizia">
                    <div style="margin-bottom: 15px; text-align: center;">
                        <h3>Richieste d'amicizia</h3>
                    </div>    
                        <%
                        ArrayList<Friendship> f_list=DBQuery.friendship_list(sesuser.id,context);
                        for(int i=0; i<f_list.size();i++)
                        {
                        	Utente u=DBQuery.userByID(f_list.get(i).richiedente,context);
                        %>
                       <div id="<%out.print("friend-request"+i); %>" style="border:3px solid #66ff66; padding:7px; margin-bottom:3px;">
	                       <table>
	                       		<tr>
	                       			<td>
	                       				<a href="<%out.print("Friend-Profile.jsp?id="+f_list.get(i).richiedente);%>" style="color:#66ff66;"><% out.println(u.nome + " " + u.cognome);%></a>
	                       			</td>	
	                       		</tr>	                       		
	                       </table>
                       	   <input type="button" value="Conferma" class="btn" onclick="conferma(<%out.print(f_list.get(i).richiedente);%>,<%out.print(sesuser.id);%>,<%out.print(i);%>);"/>		
						   <input type="button" value="Rifiuta" class="btn" onclick="elimina(<%out.print(f_list.get(i).richiedente);%>,<%out.print(sesuser.id);%>,<%out.print(i);%>);"/>
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
                      <li><a href="#Post">Post</a></li>
                      <li><a href="#Info">Informazioni</a></li>
                      <li><a href="#Amici">Amici</a></li>
                    </ul>
                    <div id="Post">
	                    <%
	                	ArrayList<Post> p = new ArrayList<Post>();
	                	p=DBQuery.show_post_profile(sesuser.id,context);
	                	for(int i=0;i< p.size(); i++){
		              	%>              	
                        <div id="postContainer">
	                            <div class="post">
	                                <a href="<%out.print("Friend-Profile.jsp?id="+sesuser.id);%>"><span class="author-post"><%out.print(sesuser.nome + " "+ sesuser.cognome) ;%></span></a>
	                                <p class="post-text">
	                               		<%out.print(p.get(i).Post);%>
	                                </p>
	                                <div id="like-container">
	                                    <span id="<%out.print("like-counter"+i);%>">
	                                        <%out.print(p.get(i).like);%>	
	                                    </span>
	                                    <%Like l=DBQuery.check_like(sesuser.id, p.get(i).id,context); 
	                                      if(l==null){
	                                    %>
		                                    <span id="<%out.print("mi-piace"+i);%>">
		                                        <input type="button" id="<%out.print("like"+i);%>" class="btn" value="mi piace" onclick="like(<%out.print(p.get(i).id);%>, <%out.print(sesuser.id);%>, <%out.print(i);%>);"></input>
		                                    </span> 
		                                    
	                                    <%
	                                      }
	                                      else{
	                                    	  
	                                    %>
	                                    <span id="<%out.print("mi-piace"+i);%>">
		                                       <input type="button" id="<%out.print("not-like"+i);%>" class="btn" value="non mi piace piu" onclick="non_like(<%out.print(p.get(i).id);%>,<%out.print(sesuser.id);%>,<%out.print(i);%> )"></input>
		                                </span>
	                                    <%
	                                      }
	                                    %>
	                                    <span id="<%out.print("dislike-counter"+i);%>">	
	                                        <%out.print(p.get(i).dislike);%>
	                                    </span>
	                                    <%Dislike d=DBQuery.check_dislike(sesuser.id, p.get(i).id,context);
	                                      if(d==null){
	                                    %>
	                                    <span id="<%out.print("non-mi-piace"+i);%>" class="tasto-like">
	                                       	<input type="button" id="<% out.print("dislike"+i);%>" class="btn" value="non mi piace" onclick="dislike(<%out.print(p.get(i).id);%>, <%out.print(sesuser.id);%>,<%out.print(i);%>);"></input>
	                                    </span>
	                                    <%
	                                      }
	                                      else{
	                                    %>
	                                     <span id="<%out.print("non-mi-piace"+i);%>">
		                                        <input type="button" id="<%out.print("not-like"+i);%>" class="btn" value="mi potrebbe piacere" onclick="non_dislike(<%out.print(p.get(i).id);%>,<%out.print(sesuser.id);%>,<%out.print(i);%>)"></input>
		                                </span>
	                                    <%
	                                      }
	                                    %>
	                                </div>
                               <div id="all-comment-container">
	                                	<table>	
	                                		<tr>
	                                			<td>                                	
			                                    	<textarea id="inserisci-commento<%out.print(i); %>" name="commento" cols="64" rows="4" placeholder="Commenta..." class="inserisci-commento"></textarea>
			                                    </td>
			                                    <td>
													<input type="button" id="commenta" class="btn" value="commenta" onclick="commenta($.trim($('#inserisci-commento<%out.print(i); %>').val()), <%out.print(p.get(i).id);%>, <%if(sesuser!=null){out.print(sesuser.id);}%>);"></input>
	                                   			</td>
	                                   		</tr>
	                                    </table>
	                                    <%
	                                    	ArrayList<Commento> comment_list = DBQuery.show_comment(p.get(i).id,context);
	                                    	for(int j=0; j<comment_list.size(); j++){
	                                    %>
		                                	<div id="comment-container">
		                                		<a href="<%out.print("Friend-Profile.jsp?id="+ comment_list.get(j).ID_utente);%>"><span class="author-comment"><%out.print(comment_list.get(j).nome + " "+ comment_list.get(j).cognome);%></span></a>
		                                		<br/>
		                                		<div id="testo-commento">
		                                			<span><%out.print(comment_list.get(j).testo); %></span>
		                                		</div>
		                                		
		                                		<div id="comment-like-container">
				                                   <span id="<%out.print("like-comment-counter"+j);%>">
	                                               	<%out.print(comment_list.get(j).like);%>	
	                                               </span>
				                                    <%Like lc=DBQuery.check_like_comment(sesuser.id, comment_list.get(j).ID,context); 
				                                      if(lc==null){
				                                    %>
				                                    <span id="<%out.print("comment-mi-piace"+j);%>">
				                                        <input type="button" id="<%out.print("comment-like"+j);%>" class="btn" value="mi piace" onclick="like_comment(<%out.print(comment_list.get(j).ID);%>, <%out.print(sesuser.id);%>,<%out.print(j);%>);"></input>
				                                    </span> 
				                                    <%
				                                      }
				                                      else{	                                    	 
				                                    %>
				                                   
				                                    <span id="<%out.print("comment-mi-piace"+j);%>">
					                                        <input type="button" id="<%out.print("comment-not-like"+j);%>" class="btn" value="non mi piace piu" onclick="non_like_comment(<%out.print(comment_list.get(j).ID);%>,<%out.print(sesuser.id);%>,<%out.print(j);%>)"></input>
					                                </span>
				                                    <%
				                                      }
				                                    %>
				                                    <span id="<%out.print("comment-dislike-counter"+j);%>">	
				                                        <%out.print(comment_list.get(j).dislike);%>
				                                    </span>
				                                    <%Dislike dc=DBQuery.check_dislike_comment(sesuser.id, comment_list.get(j).ID,context);
				                                      if(dc==null){
				                                    %>
				                                    <span id="<%out.print("comment-non-mi-piace"+j);%>" class="tasto-like">
				                                       	<input type="button" id="<%out.print("comment-dislike"+j);%>" class="btn" value="non mi piace" onclick="dislike_comment(<%out.print(comment_list.get(j).ID);%>, <%out.print(sesuser.id);%>, <%out.print(j);%>);"></input>
				                                    </span>
				                                    <%
				                                      }
				                                      else{
				                                    %>
				                                     <span id="<%out.print("comment-non-mi-piace"+j);%>">
					                                        <input type="button" id="<%out.print("comment-not-dislike"+j);%>" class="btn" value="mi potrebbe piacere" onclick="non_dislike_comment(<%out.print(comment_list.get(j).ID);%>,<%out.print(sesuser.id);%>,<%out.print(j);%>)"></input>
					                                </span>
				                                    <%
				                                      }
				                                    %>
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
                        <p id="nome">Nome: <%if(sesuser.nome==null){out.print("");}else{out.print(sesuser.nome);}%> </p>
                        <p id="cognome">Cognome: <%if(sesuser.cognome==null){out.print("");}else{out.print(sesuser.cognome);}%></p>
                        <p id="email">Email: <%if(sesuser.email==null){out.print("");}else{out.print(sesuser.email);}%></p>
                        <p id="data-di-nascita">Data di Nascita: <%if(sesuser.datanascita==null){out.print("");}else{out.print(sesuser.datanascita);}%></p>
                        <p id="nato-a"> Nato a: <%if(sesuser.luogonascita==null){out.print("");}else{out.print(sesuser.luogonascita);}%></p>
                        <p id="luogo">Vive a: <%if(sesuser.residenza==null){out.print("");}else{out.print(sesuser.residenza);}%></p>
                        <p id="stato">Stato sentimentale: <%if(sesuser.statosentimentale==null){out.print("");}else{out.print(sesuser.statosentimentale);}%></p>
                        <form action="formmodifica.jsp" ><input type="submit" value="Modifica informazioni" class="btn"/></form>
                    </div>
                    <div id="Amici">
                        <%
                        ArrayList<Friendship> confirmed_list=DBQuery.confirmed_friend(sesuser.id,context);
                         if(confirmed_list.size()==0)
                         {
                        	out.println("Non hai amici");
                        
                         }
                         else
                         {
	                        for(int j=0; j<confirmed_list.size();j++){
	                        	Utente u_friend=null;
	                        	
	                        	if(sesuser.id==confirmed_list.get(j).richiedente)
	                        	{
	                        		u_friend=DBQuery.userByID(confirmed_list.get(j).ricevente,context);
	                        	}
	                        	else
	                        	{
	                        		u_friend=DBQuery.userByID(confirmed_list.get(j).richiedente,context);
	                        	}
	                        	%>
	                        	<div style="border:1px solid #66ff66; padding:7px; margin-bottom:3px; text-align: center;">
	                        		<a href="<%out.print("Friend-Profile.jsp?id="+u_friend.id);%>" style="color:black;"><% out.println(u_friend.nome + " " + u_friend.cognome);%></a></br>
	                       	    </div>
	                       		 <%
	                        
	                        	}
                         }
                        %>
                        
                        
                    </div>
                </div>
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
