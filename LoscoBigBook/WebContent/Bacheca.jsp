<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Bacheca</title>
                <link href="BachecaCSS.css" rel="stylesheet" type="text/css"/>
                <script src="jquery-1.8.3.js" type="text/javascript"></script>
                <link href="jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
                <link href="CommonCSS.css" rel="stylesheet" type="text/css"/>
	</head>
        
	<body>
	
	<% 

	String user = request.getParameter("user");
	String pass = request.getParameter("pass");	
	String ck = request.getParameter("ck");
	
	Utente sesuser = (Utente) session.getAttribute("loggato");
	
	boolean loggato = false;

	Utente ut = null;
	
	if (sesuser == null){
		ut = DBQuery.DB_Login(user , pass);
		
		if (ut != null){ 				 
			
			loggato = true;
			
			session.setAttribute("loggato", ut);
			sesuser=ut;
			
			if (ck != null){
				Cookie c = new Cookie("log", ut.email);
			    c.setMaxAge(24*60*60);
			    response.addCookie(c); 
			}
		}
		else{
			response.sendRedirect("Home.jsp?mex=errlog");
		}
	}	
	else{
		loggato = true;
		ut = sesuser;			
	}
	
	if(loggato==true){
		
		String ruolo = sesuser.ruolo;
		
		if(ruolo.equals("admin")){
			response.sendRedirect("AdministratorPage.jsp");
		}

	}	

%>

<script>
function pubblica(testo) {
    $(document).ready(function() {
    	var testoPost=testo;
    	if(testo){
                   $.ajax({
                   type : "POST",
                   url : "pubblica.jsp",
                   data : "testo=" + testoPost + "&idutente=" + <%if(sesuser!=null){out.print(sesuser.id);}%>,
                   success : function(data) {
                   location.reload();
                   }
           });
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

function like(id, idutente){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "like.jsp",
	    		 data : "id=" + id + '&idutente=' + idutente,
	    		 success : function(data){
	                   location.reload();
	             }
	    	});
	 });
}

function non_like(id_post,id_utente){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "non_like.jsp",
	    		 data : "id=" + id_post + '&idutente=' + id_utente,
	    		 success : function(data){
	                   location.reload();
	             }
	    	});
	 });
}

function dislike(id, idutente){
 	 $(document).ready(function(){
 	    	$.ajax({
 	    		type : "POST",
 	    		 url : "dislike.jsp",
 	    		 data : "id=" + id + '&idutente=' + idutente,
 	    		 success : function(data){
 	                   location.reload();
 	             }
 	    	});
 	 });
 }

function non_dislike(id_post,id_utente){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "non_dislike.jsp",
	    		 data : "id=" + id_post + '&idutente=' + id_utente,
	    		 success : function(data){
	                   location.reload();
	             }
	    	});
	 });
}

</script>
	
            <div id="page">
                
                    <h1 class="bacheca">Post dei tuoi amici</h1>
                    <textarea id="post" class="bacheca" cols="100" rows="10" placeholder="Dillo ai tuoi amici..." maxlength="150"></textarea>
                    <input type="button" value="Pubblica" class="btn" id="pubblica" onclick="pubblica( $.trim($('#post').val()));"/>
                	<br/>
                	<div id="all-post-container">
	                	<%
	                	ArrayList<Post> p = new ArrayList<Post>();
	                	p=DBQuery.show_post_bacheca();
	                	for(int i=0;i< p.size(); i++){
	                		Utente u = null;
	                		u=DBQuery.userByID(p.get(i).ID_utente);
	                		Friendship f=DBQuery.friendship_status(sesuser.id, p.get(i).ID_utente);
	                		
	                		if(p.get(i).ID_utente==sesuser.id || (f!=null)&&(f.stato.equals("Confermata")))
	                		{
	                	%>              	
	                        <div id="postContainer">
	                            <div class="post">
	                                <a href="<%out.print("Friend-Profile.jsp?id="+u.id);%>"><span class="author-post"><%out.print(u.nome + " "+ u.cognome) ;%></span></a>
	                                <p class="post-text">
	                               		<%out.print(p.get(i).Post);%>
	                                </p>
	                                <div id="like-container">
	                                    <span id="like-counter">
	                                        <%out.print(p.get(i).like);%>	
	                                    </span>
	                                    <%Like l=DBQuery.check_like(sesuser.id, p.get(i).id); 
	                                      if(l==null){
	                                    %>
		                                    <span id="mi-piace">
		                                        <input type="button" id="like" class="btn" value="mi piace" onclick="like(<%out.print(p.get(i).id);%>, <%out.print(sesuser.id);%>);"></input>
		                                    </span> 
	                                    <%
	                                      }
	                                      else{
	                                    %>
	                                    <span id="non-mi-piace-piu">
		                                        <input type="button" id="not-like" class="btn" value="non mi piace piu'" onclick="non_like(<%out.print(p.get(i).id);%>,<%out.print(sesuser.id);%>)"></input>
		                                </span>
	                                    <%
	                                      }
	                                    %>
	                                    <span id="dislike-counter">	
	                                        <%out.print(p.get(i).dislike);%>
	                                    </span>
	                                    <%Dislike d=DBQuery.check_dislike(sesuser.id, p.get(i).id);
	                                      if(d==null){
	                                    %>
	                                    <span id="non-mi-piace" class="tasto-like">
	                                       	<input type="button" id="dislike" class="btn" value="non mi piace" onclick="dislike(<%out.print(p.get(i).id);%>, <%out.print(sesuser.id);%>);"></input>
	                                    </span>
	                                    <%
	                                      }
	                                      else{
	                                    %>
	                                     <span id="mi-potrebbe-piacere">
		                                        <input type="button" id="not-like" class="btn" value="mi potrebbe piacere" onclick="non_dislike(<%out.print(p.get(i).id);%>,<%out.print(sesuser.id);%>)"></input>
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
				                                       	<input type="button" id="dislike" class="btn" value="non mi piace" style="font-size:15px; padding:2px 8px 2px 8px;" ></input>
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
	                }
	               	%>
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
                           <a href="Profile.jsp"><div class="btn"><%if(sesuser!=null){out.print(sesuser.nome);}%></div></a>
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