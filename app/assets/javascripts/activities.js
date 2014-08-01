console.log("hola")
jQuery(function ($) { 
   $('#new_activity').validate({
      rules : {
        'activity[title]': { required: true, minlength: 5 }
      }
    });
});
