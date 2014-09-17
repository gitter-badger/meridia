ready = ->
  $ ->
    $("#sings").highcharts
      chart:
        type: "spline"
        height: 300

      title:
        text: ""

      xAxis:
        type: "datetime"
        dateTimeLabelFormats: 
          month: "%e. %b"
          year: "%b"

        title:
          text: "Date"

      yAxis:
        title:
          text: "Veces x Min"

        min: 0

      tooltip:
        headerFormat: "<b>{series.name}</b><br>"
        pointFormat: "{point.x:%e. %b}: {point.y:.2f} x seg"

      series: [
        name: "F. Cardiaca"
        
        # Define the data points. All series have a dummy year
        # of 1970/71 in order to be compared on the same x axis. Note
        # that in JavaScript, months start at 0 for January, 1 for February etc.
        data: fc
        color: '#f94343'
      ,
        name: "F. Respiratoria"
        color: "#00DC63"
        data: fr
      ,
        name: "T. Arterial"
        color: "#F985F7"
        data: ta
       ]

$(document).ready(ready)
$(document).on('page:load', ready)