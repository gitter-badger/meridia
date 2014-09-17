$ ->
  $validator = $("#new_vig").validate(
    rules:
      "vig[name]":
        required: true

    highlight: (label) ->
      $(label).closest(".form-group").removeClass "has-success"
      $(label).closest(".form-group").addClass "has-error"

    success: (label) ->
      $(label).closest(".form-group").removeClass "has-error"
      $(label).closest(".form-group").addClass "has-success"
  )
  $("#member_avatar").on "change", ->
    $(".submit_avatar").show()



$ ->
  $("#container").highcharts
    chart:
      type: "column",
      height: 200

    title:
      text: ""

    xAxis:
      categories: [
        "ABVD"
        "AIVD"
        "Tinetti"
        "Folstein"
        "Yesavage"
        "Hamiltom"
      ]

    yAxis:
      min: 0
      title:
        text: "Puntuacion"

    tooltip:
      headerFormat: "<span style=\"font-size:10px\">{point.key}</span><table>"
      pointFormat: "<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td>" + "<td style=\"padding:0\"><b>{point.y:.1f} </b></td></tr>"
      footerFormat: "</table>"
      shared: true
      useHTML: true

    plotOptions:
      column:
        pointPadding: 0.2
        borderWidth: 0


    series: [
      {
        name: "Actual"
        data: current
        color: '#64509a'
      }
      {
        name: "Anterior"
        data: last
        color: '#DBA901'
      }
    ]

