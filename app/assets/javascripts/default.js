$(document).ready(function(){
  $("#company_form").css("display","none");
  $('#role_box').change(function() {
    if ($(this).val() == "employer" ) {
      $("#company_form").slideDown("fast"); //Slide Down Effect
      $.cookie('showTop', 'expanded'); //Add cookie 'ShowTop'
    } else {
      $("#company_form").slideUp("fast");  //Slide Up Effect
      $.cookie('showTop', 'collapsed'); //Add cookie 'ShowTop' 
    }
  });    
});
