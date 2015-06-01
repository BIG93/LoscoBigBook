<!DOCTYPE html>

<html>
    <head>
        <title>Pagina Amministratore</title>
        <link href="AdministratorPageCSS.css" rel="stylesheet" type="text/css"/>
        <link href="../CommonCSS.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <div id="page"> 
            Contenuto pagina amministratore
        </div>
        
        <div id="top-bar" class="fixed-bar">
            <table id="logo-head">
                <tr>
                    <td>
                        <a href="#"><img src="../logo-losco-big-book.png" alt="lb2"/></a> 
                    </td>
                    <td>
                        <h3 id="social">LoscoBigBook</h3>
                    </td>
            </table>        
            <table id="cerca">  
                 <tr>
                	<form action="../Cerca/cerca.jsp" method="get">
	                    <td>
	                    	<input id="input-cerca" type="text" placeholder="Cerca...">
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
                        <a href="Profile.html"><div class="btn">Profilo</div></a>
                    </td>
                    <td>
                        <a href="#"><div class="btn">Home</div></a>
                    </td>
                    <td>
                        <a href="logout.jsp"><div class="btn">Logout</div></a>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>
