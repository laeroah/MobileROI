# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  pages_links = {}

  $('.right-bar .property .pages').hide()
  $('.mobile .page-img').hide()

  current_component = null


  $('.left-bar .page-img').click ->
    page_id = $(this).data 'page-id'
    $('.mobile .page-img.current').removeClass('current').hide()

    $('.mobile .page-img[data-page-id=' + page_id + ']').addClass('current').show()

  $('.right-bar .property .pages select').change ->
    if current_component?
      if $(current_component).hasClass('link')
        console.log 'select chage value'
        if $(this).val() != ''
          pages_links[$(current_component).attr('id')] = $(this).val()
        else
          pages_links[$(current_component).attr('id')] = null
        console.log pages_links


  change_component = (component) ->
    if current_component?
      $(current_component).removeClass('current')
    current_component = component
    $(current_component).addClass('current')
    change_property_ui()

  change_property_ui = ->
    if current_component?
      $('.right-bar .property .pages select').val ''
      if $(current_component).hasClass('link')
        $('.right-bar .property .pages').show()
        $('.right-bar .property .pages select').val pages_links[$(current_component).attr('id')]
      else
        $('.right-bar .property .pages').hide()


  $('.right-bar .property button.delete').click ->
    if current_component?
      $(current_component).remove()
      current_component = null

  $('.right-bar .components .component').click ->
    if $('.mobile .page-img.current').length < 1
      return

    component = $(this).clone().appendTo('.mobile .page-img.current').uniqueId().css
      position: 'absolute'
      top: 0
      left: 0
    .draggable
      containment: '.mobile .page-img.current'
      # snap: '.mobile .page-img'
      # snapMode: 'inner'
      # snapTolerance: '50'
      scroll: false
      # appendTo: '.mobile .page-img.current'
      start: ->
        change_component component
      stop: (event, ui) ->
        console.log ui.position, ui.size
    .resizable
      start: ->
        change_component component
      stop: (event, ui) ->
        console.log ui.position, ui.size
    .click ->
      change_component this

    change_component component
