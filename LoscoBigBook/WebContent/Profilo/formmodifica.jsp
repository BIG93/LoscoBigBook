<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="database.*" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Modifica dati</title>
        <link href="formmodifica.css" rel="stylesheet" type="text/css"/>
        <link href="../CommonCSS.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
    <%
   Utente sesuser=null;
   sesuser=(Utente) session.getAttribute("loggato");
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
           <td>Data di nascita</td><td> <input type="date" name="datanascita" max="2000-12-31" min="1900-01-01" required/>
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
				  <option value="single">Single</option>
				  <option value="sposato">Sposato</option>
				  <option value="vedovo/a">Vedovo/a</option>
				  <option value="relazione_complicata">Relazione complicata</option>
				</select>
				</td>
				</tr>
			<tr>
            <td>Password </td><td><input type="password" name="password" required value="<%out.print(sesuser.password);%>"/> </td>
           </tr>
				<tr>
				<td>
				<input type="submit" value="Modifica" class="btn" />
				</td>
				
				</tr>
            </table>
            
            </form>
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
                        <input id="input-cerca" type="text" placeholder="Cerca..."/>
                    </td>
                    <td>
                        <button class="btn">Cerca</button>
                    </td>
                </tr>
            </table> 
            <table id="ancore-home-container">
                <tr>
                    <td>
                        <a href="Profilo.jsp"><div class="btn"><%out.print(sesuser.nome);%></div></a>
                    </td>
                    <td>
                        <a href="../Bacheca/Bacheca.jsp"><div class="btn">Home</div></a>
                    </td>
                    <td>
                        <a href="logout.jsp"><div class="btn">Logout</div></a>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
