<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="database.*" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Bacheca</title>
                <link href="BachecaCSS.css" rel="stylesheet" type="text/css"/>
                <script src="../jquery-1.8.3.js" type="text/javascript"></script>
                <link href="../jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
                <link href="../CommonCSS.css" rel="stylesheet" type="text/css"/>
	</head>
        
	<body>
	
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
			response.sendRedirect("../Home/Home.jsp?mex=errlog");
		}
	}	
	else{
		loggato = true;
		ut = sesuser;
	}
	

%>
	
            <div id="page">
                <div id="container">
                    <h1 class="bacheca">Post dei tuoi amici</h1>
                    <textarea class="bacheca" cols="64" rows="4" placeholder="Dillo ai tuoi amici" maxlength="150"></textarea>
                    <input type="button" value="Pubblica" class="btn" id="pubblica"/>
                </div>
            </div>
            <div id="top-bar" class="fixed-bar">
                <table id="logo-head">
                    <tr>
                        <td>
                            <a href="Bacheca.jsp"><img src="../logo-losco-big-book.png" alt="lb2"/></a> 
                        </td>
                        <td>
                            <h3 id="social">LoscoBigBook</h3>
                        </td>
                </table>        
                <table id="cerca">  
                    <tr>
                        <td>
                            <input id="input-cerca" type="text" placeholder="Cerca...">
                        </td>
                        <td>
                            <button class="btn">Cerca</button>
                        </td>
                    </tr>
                </table> 
                <table id="ancore-home-container">
                    <tr>
                        <td>
                            <a href="../Profilo/Profile.jsp"><div class="btn"><%if(sesuser!=null){out.print(sesuser.nome);}%></div></a>
                        </td>
                        <td>
                            <a href="Bacheca.jsp"><div class="btn">Home</div></a>
                        </td>
                        <td>
                            <a href="../logout.jsp"><div class="btn">Logout</div></a>
                        </td>
                    </tr>
                </table>
            </div>
	</body>
</html>