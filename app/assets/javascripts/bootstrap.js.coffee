ready = ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $("tr[data-href]").addClass("clickable").click ->
    window.location = $(this).attr("data-href")

$(document).ready(ready)
$(document).on("page:load", ready)