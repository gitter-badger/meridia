$(document).ready ->
  $("#rootwizard").bootstrapWizard onTabShow: (tab, navigation, index) ->
    $total = navigation.find("li").length
    $current = index + 1
    $percent = ($current / $total) * 100
    $("#rootwizard").find(".bar").css width: $percent + "%"
    
    if $current >= $total
      $("#rootwizard").find(".pager .next").hide()
      $("#rootwizard").find(".pager .finish").show()
      $("#rootwizard").find(".pager .finish").removeClass "disabled"
    else
      $("#rootwizard").find(".pager .next").show()
      $("#rootwizard").find(".pager .finish").hide()
    return


  return

$("#myTab a").click (e) ->
  e.preventDefault()
  $(this).tab "show"
  return