<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>

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
    	console.log("("+testo+")");
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
</script>
	
            <div id="page">
                <div id="container">
                    <h1 class="bacheca">Post dei tuoi amici</h1>
                    <textarea id="#post" class="bacheca" cols="64" rows="4" placeholder="Dillo ai tuoi amici" maxlength="150"></textarea>
                    <input type="button" value="Pubblica" class="btn" id="pubblica" onclick="pubblica( $.trim($('textarea').val()));"/>
                	<br/>
                	<%
                	ArrayList<Post> p = new ArrayList<Post>();
                	p=DBQuery.show_post_bacheca();
                	for(int i=0;i< p.size(); i++){
                		Utente u = null;
                		u=DBQuery.userByID(p.get(i).ID_utente);
                	%>              	
                        <div id="postContainer">
                            <div class="post">
                                <h3 class="author-post"><%out.print(u.nome + " "+ u.cognome) ;%></h3>
                                <p class="post-text">
                               		<%out.print(p.get(i).Post);%>
                                </p>
                                <div id="like-container">
                                    <span id="like-counter">
                                        <%out.print(p.get(i).like);%>
                                    </span>
                                    <span id="mi-piace">
                                        <a data-target="#" class="tasto-like" style="color: #66ff66;">
                                            Mi piace
                                        </a>
                                    </span> 
                                    <span id="dislike-counter">
                                        <%out.print(p.get(i).dislike);%>
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
               	<%
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