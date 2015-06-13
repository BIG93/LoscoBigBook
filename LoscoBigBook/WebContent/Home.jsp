<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="database.*" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Homepage</title>

        <script src="jquery-1.8.3.js" type="text/javascript"></script>
        <link href="jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <script src="jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
        <script src="controllohome.js" type="text/javascript"></script>
        <link href="CSShome.css" rel="stylesheet" type="text/css"/>
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
	Cookie[] cookies = request.getCookies();

	if (cookies != null){
		for(int i = 0; i < cookies.length; i++) { 
		    Cookie c = cookies[i];		    
		    if (c.getName().equals("log")) {
		    	Utente ucookie = DBQuery.DB_Login_ByCookie(c.getValue());
		    	session.setAttribute("loggato", ucookie);
		    }
		}
	}

	Utente sesuser = (Utente) session.getAttribute("loggato");

	if(sesuser!=null){
		response.sendRedirect("Bacheca.jsp");
	}
	
	String mex = request.getParameter("mex");
	
	if(mex != null){
		if (mex.equals("errlog")){
			out.print("<div id='dialog' title='Login fallito'> Email o Password errate </div>");
		}
		if (mex.equals("errreg")){
			out.print("<div id='dialog' title='Registrazione fallita'> Ci scusiamo, ma la registrazione non e' andata a buon fine </div>");
		}
		if (mex.equals("okreg")){
			out.print("<div id='dialog' title='Registrazione avvenuta'> La registrazione è avvenuta con successo!</br> Ora puoi effettuare il tuo primo login. </div>");
		}
	 }

%>

        <div class="image"></div>
      
        <div class="registrazione">
            <h2>Registrati ora! E' gratis</h2>
            <form action="registrazione.jsp" method="POST">
                <table>
                    <tr>
                        <td>Nome</td> <td><input type="text" id="nome" name="nome" required placeholder="Nome" style="width: 180px; height: 30px; padding: 2px; border: 1px solid black"/></td>
                    </tr>
                    <tr>
                      <td>Cognome</td> <td><input type="text" id="cognome" name="cognome" required placeholder="Cognome" style="width: 180px; height: 30px; padding: 2px; border: 1px solid black"/></td>
                    </tr>
                    <tr>
                        <td>Sesso</td> <td>M<input type="radio" name="sesso" value="M" checked/>
                                           F<input type="radio" name="sesso" value="F" />
                                       </td>
                    </tr>
                    <tr>
                       <td>Email</td><td><input type="email" id="email" name="email" required placeholder="Email" style="width: 180px; height: 30px; padding: 2px; border: 1px solid black"/></td>
                    </tr>
                    <tr>
                        <td>Data di nascita</td><td> <input type="date" id="data" name="datanascita" required max="2000-12-31" min="1900-01-01" style="width: 180px; height: 30px; padding: 2px; border: 1px solid black"/></td>
                    </tr>
                    <tr>
                        <td>Password</td><td> <input type="password" id="password" name="password" required placeholder="Password" style="width: 180px; height: 30px; padding: 2px; border: 1px solid black"/><td>
                    </tr>
                    <tr>
                        <td>Ripeti Password</td><td> <input type="password" id="npassword" required placeholder=" Ripeti password" style="width: 180px; height: 30px; padding: 2px; border: 1px solid black"/><td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Registrati!" onclick="return controllo();" class="btn1"/></td> 
                    </tr>
                </table>   
            
            </form>
        </div>
        <div class="homebar">
          <div class="logo">
              <table>
                  <tr>
                      <td><a href=""><img src="logo-losco-big-book.png" alt="Logo"/></a></td>
                      <td><h3>LoscoBigBook</h3></td>
                  </tr>
              </table>
                  
          </div>
                 
         <div class="login">
            <form action="Bacheca.jsp" method="POST">
                <table>
                    <tr>
                        <td>email</td> 
                        <td>Password</td>
                    </tr>
                    <tr>
                        <td> <input type="email" id="user" name="user" required placeholder="Email" style="width: 160px; height: 20px; padding: 2px; border: 1px solid black"/></td> 
                        <td> <input type="password" id="pass" name="pass" required placeholder="Password" style="width: 160px; height: 20px; padding: 2px; border: 1px solid black"/></td>
                        <td><input type="submit" value="Accedi" class="btn"/></td>
                    </tr>
                    <tr>    
                        <td style="font-size:15px;">Ricordami  <input type="checkbox" name="ck" id="ck"/></td> 
                    </tr>
                </table>             
            </form>
          </div>   
        </div>
    </body>
</html>
    