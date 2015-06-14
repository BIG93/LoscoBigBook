<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="database.*" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Modifica dati</title>
        <link href="CommonCSS.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
    <%
   Utente sesuser=null;
   sesuser=(Utente) session.getAttribute("loggato");
   
   if(sesuser==null){
	   response.sendRedirect("Home.jsp");
   }
   %>
        <div id="page"> 
        <h3>Modifica dati</h3>
            <form action="modifica.jsp" method="POST">
	            <table>
		            <tr>
		            	<td>Nome</td><td><input type="text" name="nome" value="<%out.print(sesuser.nome);%>" required/> </td>
		            </tr>
		            <tr>
		            	<td>Cognome</td><td><input type="text" name="cognome" value="<%out.print(sesuser.cognome);%>" required/> </td>
		            </tr>
		            <tr>
		            	<td>Sesso</td> 
			            <td>
							M<input type="radio" name="sesso" value="M" checked/>
			                F<input type="radio" name="sesso" value="F" />
			            </td>
		            </tr>
		            <tr>
		            	<td>Email</td><td><input type="email" name="email" value="<%out.print(sesuser.email);%>" required /> </td>
		            </tr>
		            <tr>
		            	<td>Data di nascita</td><td> <input type="date" name="datanascita" max="2000-12-31" min="1900-01-01"  value="<%out.print(sesuser.datanascita);%>" required/>
		            </tr>
		            <tr>
		            	<td>Nato a </td><td><input type="text" name="luogonascita" value="<%out.print(sesuser.luogonascita);%>" /> </td>
		            </tr>
		            <tr>
		            	<td>Vive a </td><td><input type="text" name="residenza" value="<%out.print(sesuser.residenza);%>"/> </td>
		            </tr>
		            <tr>
		            	<td>Situazione sentimentale</td>
		             	<td>
							<select name="statosentimentale">
						  		<option value="Single">Single</option>
						  		<option value="Relazione_complicata">Relazione complicata</option>
						  		<option value="Impegnato">Impegnato</option>
						   		<option value="Sposato">Sposato</option>
						 		 <option value="Vedovo/a">Vedovo/a</option>
						    </select>
						</td>
					</tr>
					<tr>
		            	<td>Password </td><td><input type="password" name="password" required value="<%out.print(sesuser.password);%>"/> </td>
		            </tr>
					<tr>
						<td><input type="submit" value="Modifica" class="btn" /></td>
					</tr>
	            </table>
            </form>
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
            <table id="cerca">  
                 <tr>
                	<form action="cerca.jsp" method="get">
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
                        <a href="Profilo.jsp"><div class="btn"><%out.print(sesuser.nome);%></div></a>
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
