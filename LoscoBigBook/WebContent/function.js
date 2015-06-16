//ADMIN
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
//PUBBLICA POST
function pubblica(testo,sesuserid) {
    $(document).ready(function() {
    	var testoPost=testo;
    	if(testo){
                   $.ajax({
                   type : "POST",
                   url : "pubblica.jsp",
                   data : "testo=" + testoPost + "&idutente=" + sesuserid,
                   success : function(data) {
                   location.reload();
                   }
           });
    	}
    });
}

//COMMENTA POST
function commenta(commento, id_post,sesuserid) {
    $(document).ready(function() {
    	var testocommento=commento;
        var idpost=id_post;
    	if(testocommento){
                   $.ajax({
                   type : "POST",
                   url : "commenta.jsp",
                   data : "testo=" + testocommento + "&idutente=" + sesuserid + "&idpost=" + idpost,
                   success : function(data) {
                   location.reload();
                   }
           });
    	}
     }); 	
}

//LIKE DISLIKE POST-COMMENT
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

function like_comment(id, idutente){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "like_comment.jsp",
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

function non_like_comment(id_post,id_utente){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "non_like_comment.jsp",
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

function dislike_comment(id, idutente){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "dislike_comment.jsp",
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

function non_dislike_comment(id_post,id_utente){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "non_dislike_comment.jsp",
	    		 data : "id=" + id_post + '&idutente=' + id_utente,
	    		 success : function(data){
	                   location.reload();
	             }
	    	});
	 });
}

//CONFERMA-RIFIUTA-AGGIUNGI-RIMUOVI AMICIZIA
function conferma(richiedente,ricevente) {
    $(document).ready(function() {
           
                   $.ajax({
                   type : "POST",
                   url : "confirm.jsp",
                   data : "richiedente=" + richiedente + "&ricevente=" + ricevente,
                   success : function(data) {
                   	location.reload();
                   }
           });
       });
   	
   }
   
function elimina(richiedente,ricevente) {
       $(document).ready(function() {
              
                      $.ajax({
                      type : "POST",
                      url : "reject.jsp",
                      data : "richiedente=" + richiedente + "&ricevente=" + ricevente,
                      success : function(data) {
                      	location.reload();
                      	
                      }
              });
          });
      	
      }

function elimina_amico(richiedente,ricevente){
 			
           $.ajax({
                   type : "POST",
                   url : "elimina_amico.jsp",
                   data : "richiedente=" + richiedente + "&ricevente=" + ricevente,
                   success : function(data)
                   {
                   	location.reload();
                   
                   }
           });
   }

function friend_request(currentid, id) {
        
            $.ajax({
            type : "POST",
            url : "friend-request.jsp",
            async : false,
            data : "currentid=" + currentid + "&id=" + id,
            success : function(data) {
                location.reload();
            }
        });
    };
    
//CONTROLLO HOME
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

