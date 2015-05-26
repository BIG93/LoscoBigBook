<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Homepage</title>

        <script src="../jquery-1.8.3.js" type="text/javascript"></script>
        <link href="../jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
        <script src="../jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
        <script src="controllohome.js" type="text/javascript"></script>
        <link href="CSShome.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
    	
    	<% 
    	if(request.getParameter("err").equals("1")){
    		out.println("<script>alert('Registrazione non andata a buon fine!')</script>");
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
                        <td>Sesso</td> <td>M<input name="sesso" type="radio" value="M" checked/>
                                           F<input name="sesso" type="radio" value="F" />
                                       </td>
                    </tr>
                    <tr>
                       <td>Email</td><td><input type="email" id="email" name="email" required placeholder="Email" style="width: 180px; height: 30px; padding: 2px; border: 1px solid black"/></td>
                    </tr>
                    <tr>
                        <td>Data di nascita</td><td> <input type="date" id="data" name="datanascita"  required max="2000-12-31" min="1900-01-01" style="width: 180px; height: 30px; padding: 2px; border: 1px solid black"/></td>
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
                      <td><a href="index.html"><img src="../logo-losco-big-book.png" alt="Logo"/></a></td>
                      <td><h3>LoscoBigBook</h3></td>
                  </tr>
              </table>
                  
          </div>
                 
         <div class="login">
            <form action="#" method="POST">
                <table>
                    <tr>
                        <td>Username</td> 
                        <td>Password</td> 
                    </tr>
                    <tr>
                        <td> <input type="email" id="user" required placeholder="Email" style="width: 160px; height: 20px; padding: 2px; border: 1px solid black"/></td> 
                        <td> <input type="password" id="pass" required placeholder="Password" style="width: 160px; height: 20px; padding: 2px; border: 1px solid black"/></td>
                        <td><input type="button" value="Accedi" class="btn"/></td>
                    </tr>
                </table>             
            </form>
          </div>   
        </div>
    </body>
</html>
