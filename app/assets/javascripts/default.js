$(function(){
    
  $("#datepicker").datepicker({
    dateFormat:"D, d M 'of' yy"
  });
 
  $("#born_datepicker").datepicker({
    dateFormat:"d M yy",
    changeMonth: true,
    changeYear: true,
    yearRange: "1920:1998"
  });
  $("#resume_datepicker").datepicker({
    dateFormat:"d M yy",
    changeMonth: true,
    changeYear: true,
    yearRange: "1950:2012"
  });
  $("#resume_datepicker_to").datepicker({
    dateFormat:"d M yy",
    changeMonth: true,
    changeYear: true,
    yearRange: "1950:2012"
  });

  $("#timeit").timePicker({
            startTime: "08:00",
            show24Hours: true,
            separator: ':',
            step: 30});
            
              
}); 




$(document).ready(function(){
  $("#company_form").css("display","none");
  $('#role_box').change(function() {
    if ($(this).val() == "employer" ) {
      $("#register_btn").val("I want to find Candidates"); 
      $("#company_form").slideDown("fast"); 
      $.cookie('showTop', 'expanded'); //Add cookie 'ShowTop'
    } else {
      $("#register_btn").val("I want to find Jobs"); 
      $("#company_form").slideUp("fast");  
      $.cookie('showTop', 'collapsed'); //Add cookie 'ShowTop' 
    }
  });    
});
