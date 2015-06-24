//ADMIN
function banna(id,i){
	  $.ajax({
	       type : "POST",
	       url : "banna.jsp",
	       data : "id=" + id,
           success : function(data) {
           		$("#user"+i).remove();
           	 }
	   });
	   } 
           
function censura_post(id_post,j){
    $.ajax({
           type : "POST",
           url : "censura.jsp",
           data : "id=" + id_post,
           success : function(data) {
           		$("#post-container-administrator"+j).remove();
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
function like(id, idutente,i){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "like.jsp",
	    		 data : "id=" + id + '&idutente=' + idutente,
	    		 success : function(data){
	                   beforel=$("#like-counter"+i).text();
	                   afterl=parseInt(beforel)+1;
	                   $("#like-counter"+i).html(afterl);
	                   $("#like"+i).remove();
	                   $("#mi-piace"+i).html("<input type='button' id='not-like"+i+"' class='btn' value='non mi piace piu' onclick='non_like("+id+","+idutente+","+i+");'></input>");
	             }
	    	});
	 });
}

function like_comment(id, idutente,j){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "like_comment.jsp",
	    		 data : "id=" + id + '&idutente=' + idutente,
	    		 success : function(data){
	    			 console.log(j);
	    			   beforel=$("#like-comment-counter"+j).text();
	                   afterl=parseInt(beforel)+1;
	                   $("#like-comment-counter"+j).html(afterl);
	                   $("#comment-like"+j).remove();
	                   $("#comment-mi-piace"+j).html("<input type='button' id='comment-not-like"+j+"' class='btn' value='non mi piace piu' onclick='non_like_comment("+id+","+idutente+","+j+");'></input>");
	             }
	    	});
	 });
}

function non_like(id_post,id_utente,i){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "non_like.jsp",
	    		 data : "id=" + id_post + '&idutente=' + id_utente,
	    		 success : function(data){
	    			   beforel=$("#like-counter"+i).text();
	                   afterl=parseInt(beforel)-1;
	                   $("#like-counter"+i).html(afterl);
	                   $("#not-like"+i).remove();
	                   $("#mi-piace"+i).html("<input type='button' id='like' class='btn' value='mi piace' onclick='like("+id_post+","+id_utente+","+i+");'></input>");
	    		 }
	    	});
	 });
}

function non_like_comment(id_post,id_utente,j){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "non_like_comment.jsp",
	    		 data : "id=" + id_post + '&idutente=' + id_utente,
	    		 success : function(data){
	    			 beforel=$("#like-comment-counter"+j).text();
	                   afterl=parseInt(beforel)-1;
	                   $("#like-comment-counter"+j).html(afterl);
	                   $("#comment-not-like"+j).remove();
	                   $("#comment-mi-piace"+j).html("<input type='button' id='comment-like"+j+"' class='btn' value='mi piace' onclick='like_comment("+id_post+","+id_utente+","+j+");'></input>");
	             }
	    	});
	 });
}

function dislike(id, idutente,i){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "dislike.jsp",
	    		 data : "id=" + id + '&idutente=' + idutente,
	    		 success : function(data){
	    			   befored=$("#dislike-counter"+i).text();
	                   afterd=parseInt(befored)+1;
	                   $("#dislike-counter"+i).html(afterd);
	                   $("#dislike"+i).remove();
	                   $("#non-mi-piace"+i).html("<input type='button' id='not-like"+i+"' class='btn' value='mi potrebbe piacere' onclick='non_dislike("+id+","+idutente+","+i+");'></input>");
	             }
	    	});
	 });
}

function dislike_comment(id, idutente,j){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "dislike_comment.jsp",
	    		 data : "id=" + id + '&idutente=' + idutente,
	    		 success : function(data){
	    			   beforel=$("#comment-dislike-counter"+j).text();
	                   afterl=parseInt(beforel)+1;
	                   $("#comment-dislike-counter"+j).html(afterl);
	                   $("#comment-dislike"+j).remove();
	                   $("#comment-non-mi-piace"+j).html("<input type='button' id='comment-not-dislike"+j+"' class='btn' value='mi potrebbe piacere' onclick='non_dislike_comment("+id+","+idutente+","+j+");'></input>");
	             }
	    	});
	 });
}

function non_dislike(id_post,id_utente,i){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "non_dislike.jsp",
	    		 data : "id=" + id_post + '&idutente=' + id_utente,
	    		 success : function(data){
	    			   befored=$("#dislike-counter"+i).text();
	                   afterd=parseInt(befored)-1;
	                   $("#dislike-counter"+i).html(afterd);
	                   $("#dislike"+i).remove();
	                   $("#non-mi-piace"+i).html("<input type='button' id='dislike"+i+"' class='btn' value='non mi piace' onclick='dislike("+id_post+","+id_utente+","+i+");'></input>");
	             }
	    	});
	 });
}

function non_dislike_comment(id_post,id_utente,j){
	 $(document).ready(function(){
	    	$.ajax({
	    		type : "POST",
	    		 url : "non_dislike_comment.jsp",
	    		 data : "id=" + id_post + '&idutente=' + id_utente,
	    		 success : function(data){
	    			   befored=$("#comment-dislike-counter"+j).text();
	                   afterd=parseInt(befored)-1;
	                   $("#comment-dislike-counter"+j).html(afterd);
	                   $("#comment-dislike"+j).remove();
	                   $("#comment-non-mi-piace"+j).html("<input type='button' id='comment-dislike"+j+"' class='btn' value='non mi piace' onclick='dislike_comment("+id_post+","+id_utente+","+j+");'></input>");
	             }
	    	});
	 });
}

//CONFERMA-RIFIUTA-AGGIUNGI-RIMUOVI AMICIZIA
function conferma(richiedente,ricevente,i) {
    $(document).ready(function() {
           
                   $.ajax({
                   type : "POST",
                   url : "confirm.jsp",
                   data : "richiedente=" + richiedente + "&ricevente=" + ricevente,
                   success : function(data) {
                   		$("#friend-request"+i).remove();
                   }
           });
       });
   	
   }
   
function elimina(richiedente,ricevente,i) {
       $(document).ready(function() {
              
                      $.ajax({
                      type : "POST",
                      url : "reject.jsp",
                      data : "richiedente=" + richiedente + "&ricevente=" + ricevente,
                      success : function(data) {
                    	  $("#friend-request"+i).remove();
                      	
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
                   	$("#friend-request-container").empty();
                   	$("#friend-request-container").html("<button id='friend-request' class='btn' onclick='friend_request("+richiedente+","+ricevente+");'>Aggiungi agli amici</button>");
                   
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
                $("#friend-request").remove();
                $("#friend-request-container").html("<h3>Amicizia in attesa di approvazione</h3>");
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
	            
	            $( "#myDiv" ).dialog({
						            	show:{
							    	        effect: "slide",
							    	        duration: 500
							    	      },
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

