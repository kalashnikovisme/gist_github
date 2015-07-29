#= require jquery
#= require jquery_ujs
#= require codemirror
#= require_tree .

$ ->
  $('.link').click ->
    location.href = $(this).data('href')
  $('.tr_link').each ->
    $tr_link = $(this)
    tds = $tr_link.children('td').not('.actions')
    tds.click ->
      location.href = $tr_link.data('href')
