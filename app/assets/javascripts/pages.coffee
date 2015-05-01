# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.left-bar .page-img').click ->
    page_img_sr = $(this).find('img').attr 'src'
    $('.mobile .page-img img').attr 'src', page_img_sr

  $('.right-bar .component').click ->
    $(this).clone().appendTo('.mobile .page-img').addClass('show-close-btn').css
      position: 'absolute'
      top: 0
      left: 0
    .draggable
      containment: '.mobile .page-img'
      # snap: '.mobile .page-img'
      # snapMode: 'inner'
      # snapTolerance: '50'
      scroll: false
      appendTo: '.mobile .page-img'
      stop: (event, ui) ->
        console.log ui.position, ui.size
    .resizable
      stop: (event, ui) ->
        console.log ui.position, ui.size
