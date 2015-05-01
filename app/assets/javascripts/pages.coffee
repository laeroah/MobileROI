# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.left-bar .page-img').click ->
    page_img_sr = $(this).find('img').attr 'src'
    $('.mobile .page-img img').attr 'src', page_img_sr
  $('#draggable').draggable()
