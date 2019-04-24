// Registration request code form
$(document).on('submit', '.L-voting-form', function(e){
  if ($(this).find('.has-error').length >0){
    e.preventDefault();
    showSnackbar("Some fields are invalid.")
    return;
  }
   var message = "";
   var name = $(this).find('.L-voting-form-fname').val();
   var phone = $(this).find('.L-voting-form-lname').val();
   var email = $(this).find('.L-voting-form-bdate').val();
   if(name == "" || phone== "" || email== ""){
     e.preventDefault();
     message = "All Fields are required.";
     showSnackbar(message);
   }
});

$(document).on('keyup', '.L-voting-form-fname , .L-voting-form-lname', function(){
  var email = $(this).val();
  if (!(isValidName(email))){
    if (!($(this).parent('.form-group').hasClass('has-error'))){
      $(this).parent('.form-group').addClass('has-error');
    }
    $(this).closest('span').addClass('show');

  }else{
   $(this).parent('.form-group').removeClass('has-error');
   $(this).closest('span').removeClass('show');
  }
})


function isValidName(phone){
  var pattern =/^([a-zA-Z0-9_-]){3,10}$/;
  return pattern.test(phone);
}
