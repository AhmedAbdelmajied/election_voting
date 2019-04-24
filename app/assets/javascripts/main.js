$(document).ready(function() {


  // $('.form-control').each(function() {
  //   if (!$(this).val()) {
  //     $(this).addClass('empty');
  //     $(this).removeClass('dirty');
  //   } else {
  //     $(this).removeClass('empty');
  //     $(this).addClass('dirty');
  //   }
  // });


  $(document).on("change input", ".form-control", function() {
    if (!$(this).val()) {
      $(this).addClass('empty');
      $(this).removeClass('dirty');
    } else {
      $(this).removeClass('empty');
      $(this).addClass('dirty');
    }
  });

});


function showSnackbar(message){

  var snackbar = $('#snackbar');
  snackbar.find('p').html(message);
  snackbar.addClass("show");
  setTimeout(hideSnackbar, 3000);
}

function hideSnackbar(){
  var snackbar = $('#snackbar');
  snackbar.removeClass("show")
}
