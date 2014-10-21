var $validator = $("#new_customer").validate({
  rules: {
    "customer[name]": {
      required: true,
      minlength: 4
    },
    "customer[lastname]": {
      required: true,
      minlength: 5
    },
    "customer[phone]": {
      required: true,
      number: true,
      minlength: 7
    },
    "customer[mobile]": {
      required: true,
      number: true,
      minlength: 10
    },
    "customer[address]": {
      required: true,
    },
    "customer[members_attributes][0][name]": {
      required: true,
      minlength: 4
    },
    "customer[members_attributes][0][lastname]": {
      required: true,
      minlength: 4
    }, 
    "customer[members_attributes][0][address]": {
      required: true,
    },
    "customer[members_attributes][0][city]": {
      required: true,
    },
    "customer[members_attributes][0][phone]": {
      required: true,
      number: true,
      minlength: 7
    },
    "customer[members_attributes][0][monthly_payment]": {
      required: true,
      number: true,
    },
    "customer[members_attributes][0][date_borth]":{
      required: true
    },
    "customer[members_attributes][0][families_attributes][0][firstname]": {
      required: true,
      minlength: 4
    },
    "customer[members_attributes][0][families_attributes][0][lastname]": {
      required: true,
      minlength: 4
    },
    "customer[members_attributes][0][families_attributes][0][phone_home]": {
      required: true,
      number: true,
      minlength: 8
    },
    "customer[members_attributes][0][families_attributes][0][phone_mobile]": {
      required: true,
      number: true,
      minlength: 8
    },
    "customer[members_attributes][0][families_attributes][0][address]": {
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

  // $('#rootwizard').bootstrapWizard({    
  //   'tabClass': 'nav nav-pills',
    //  'onNext': function(tab, navigation, index) {
    // var $valid = $("#new_customer").valid();
    // if(!$valid) {
    //   $validator.focusInvalid();
    //   return false;
    //  }

  // }
  // }); 

   $('#rootwizard').bootstrapWizard({onNext: function(tab, navigation, index) {
var $valid = $("#new_customer").valid();
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
  


