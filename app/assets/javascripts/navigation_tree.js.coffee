#$.fn.nico_test = () ->
#  alert('test')

expand = (element) ->
  element.removeClass("collapsed")
  element.addClass("expanded")
  
collapse = (element) ->
  element.removeClass("expanded")
  element.addClass("collapsed")

$ ->
  $('.folder-toggle').click (event) ->
    li = $(this).parent()
    if li.hasClass("expanded")
      collapse(li)
    else
      expand(li)
