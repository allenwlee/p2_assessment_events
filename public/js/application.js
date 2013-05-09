$(document).ready(function() {
  $("#create_event").on('click', function(e){
    e.preventDefault();
    var id = $("#hidden_id").text();
    $.ajax({
      type: "post",
      url: id + "/event/create"
    }).done(function(){
      alert("done son");
    })
    console.log(data)

  });
});



    
// 
//   });