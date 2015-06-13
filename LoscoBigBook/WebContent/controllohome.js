function controllo(){
    var password=$("#password").val();
    var npassword=$("#npassword").val();
  
 if(password != npassword)
  {
        $("body").append("<div id='myDiv' title='Errore' style='font-family:verdana;'>Le password inserite non sono uguali!</div>");
        
        $( "#myDiv" ).dialog({dialogClass: 'myTitleClass',
                                buttons: [
                                {
                                  text: "OK",
                                  
                                  click: function() {
                                    $( this ).dialog( "close" );
                                  }
                                }
                              ]
                            });
        
        return false;
  	}
  return true;
}

