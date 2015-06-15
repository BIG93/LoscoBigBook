<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@ page import="database.*" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>

<html>
  <head>
      <title>Pagina Amministratore</title>
      <link href="AdministratorPageCSS.css" rel="stylesheet" type="text/css"/>
      <link href="CommonCSS.css" rel="stylesheet" type="text/css"/>
      <script src="jquery-1.8.3.js" type="text/javascript"></script>
      <link href="jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
      <script src="jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
      
  </head>
    
  <body>
    <script>
            $(function() {
              $( "#tabs" ).tabs();
            });
            
           function banna(id){
        	   
        	   $.ajax({
                   type : "POST",
                   url : "banna.jsp",
                   data : "id=" + id,
                   success : function(data) {
                   	location.reload();
                   	
                   }
           });
           } 
           

           
           function censura_post(id_post){
        	   
        	   $.ajax({
                   type : "POST",
                   url : "censura.jsp",
                   data : "id=" + id_post,
                   success : function(data) {
                   	location.reload();
                   	
                   }
           });
           } 
            
            
    </script>
       <% 
	   Utente sesuser=null;
	   sesuser=(Utente) session.getAttribute("loggato");
	   
	   if(sesuser==null){
		   response.sendRedirect("Home.jsp");
	   }
  		%>
    <div id="page"> 
        <h3 style="margin-left: 10%;">Ciao <%out.print(sesuser.nome);%>, sei loggato come amministratore, cosa vuoi fare?</h3>
        
        <div id="tab-container">
        	 <div id="tabs">
                <ul style="background-color: #66ff66;">
                  <li><a href="#Banna">Banna utenti</a></li>
                  <li><a href="#Censura">Censura post</a></li>
                </ul>
                <div id="Banna">	
                		<div id="lista_utenti">
                			<table>
                			<%
                			ArrayList<Utente> user_list=DBQuery.admin_list_user();
                			for (int i=0; i<user_list.size();i++)
                			{
                			%>
                			<tr>
                			<td><%out.print(user_list.get(i).nome + " " + user_list.get(i).cognome); %></td><td><input type="button" value="Banna" class="btn" onclick="banna(<%out.print(user_list.get(i).id); %>);" /></td>
                			</tr>
                			<%
                			}
                			%>
                			</table>
                		</div>
                		
                
                </div>
                <div id="Censura">
	                <%
	                	ArrayList<Post> p_list=DBQuery.show_post_bacheca();
	                	for(int j=0; j<p_list.size(); j++)
	                	{
	                		Utente u=DBQuery.userByID(p_list.get(j).ID_utente);
	                	
	                %>
	                
		                	<div id="postContainer-admnistrator">
		                            <div class="post">
		                                <span class="author-post"><%out.print(u.nome + " "+ u.cognome);%></span>
			                                <p class="post-text">
			                               		<%out.print(p_list.get(j).Post);%>
			                                </p>
		                             </div>
		                     </div>
	                   
	                  		 <input type="button" id="censura" class="btn" value="Censura" onclick="censura_post(<%out.print(p_list.get(j).id); %>);"/>
	                 
	                <%
	                	}
	                %>
               </div>
        </div>
        </div>
    </div>
       
    <div id="top-bar" class="fixed-bar">
        <table id="logo-head">
            <tr>
                <td>
                    <a href="Home.jsp"><img src="logo-losco-big-book.png" alt="lb2"/></a> 
                </td>
                <td>
                    <h3 id="social">LoscoBigBook</h3>
                </td>
        </table>
			      
        <table id="ancore-home-container" style="margin-left:85%">
            <tr>
                <td>
                    <a href="logout.jsp"><div class="btn">Logout</div></a>
                </td>
            </tr>
        </table>
    </div>
  </body>
</html>
