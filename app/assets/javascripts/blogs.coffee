# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".blog-category_link").bind 'click', ->
    $(this).addClass "category_active"
    $(this).parent().siblings().children().removeClass "category_active"
    return
  return
