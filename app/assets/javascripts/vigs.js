$(document).ready(function() {
	
    var $validator = $("#new_vig").validate({
        rules: {
          "vig[name]": {
            required: true,           
          }          
        },         
       highlight: function(label) {
            $(label).closest('.form-group').removeClass('has-success');
            $(label).closest('.form-group').addClass('has-error');
        },
       success: function(label) {        
            $(label).closest('.form-group').removeClass('has-error');
            $(label).closest('.form-group').addClass('has-success');
        }
      });


  

});
