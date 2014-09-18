var $validator = $("#new_prospect").validate({
    rules: {
      "prospect[name]": {
        required: true,
        minlength: 4
      },
      "prospect[lastname]": {
        required: true,
        minlength: 5
      },
      "prospect[phone]": {
        required: true,
        number: true,
        minlength: 7
      },
      "prospect[mobile]": {
        required: true,
        number: true,
        minlength: 7
      },
      "prospect[mail]": {
        required: true,
        email: true
      },
      "prospect[prospect_member_attributes][name]": {
        required: true,
        minlength: 4
      },
      "prospect[prospect_member_attributes][lastname]": {
        required: true,
        minlength: 4
      },
      "prospect[prospect_member_attributes][phone]": {
        required: true,
        minlength: 4,
        number: true
      },
      "prospect[prospect_member_attributes][age]": {
        required: true,
        number: true
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

  $('#rootwizard').bootstrapWizard({onNext: function(tab, navigation, index) { 
    var $valid = $("#new_prospect").valid();
    if(!$valid) {
      $validator.focusInvalid();
      return false;
     }
  
  }, onTabShow: function(tab, navigation, index) {
    var $total = navigation.find('li').length;
    var $current = index+1;
    var $percent = ($current/$total) * 100;
    $('#rootwizard').find('.bar').css({width:$percent+'%'});
    if($current >= $total) {
      $('#rootwizard').find('.pager .next').hide();
      $('#rootwizard').find('.pager .finish').show();
      $('#rootwizard').find('.pager .finish').removeClass('disabled');
    } else {
      $('#rootwizard').find('.pager .next').show();
      $('#rootwizard').find('.pager .finish').hide();
    }

  }});
  

