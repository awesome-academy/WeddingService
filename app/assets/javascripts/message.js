function get_message(){
  var message = $("#message_content").val();
  App.room.speak(message);
  $("#message_content").val("")
};