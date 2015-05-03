# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  pages_links = {}

  $('.right-bar .property .pages').hide()
  $('.mobile .page-img').hide()

  current_component = null

  # switches to a different page
  $('.left-bar .page-img').click ->
    page_id = $(this).data 'page-id'
    
    # hide current image
    $('.mobile .page-img.current').removeClass('current').hide()

    # show new image
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

  $('.right-bar .property button.save').click ->
    $('.mobile .page-img').each ->
      project_id = $(this).attr('project-id')
      page_id = $(this).attr('data-page-id')
      $('.component', this).each ->
        widget_id = $(this).attr('id')
        x = $(this).position().left
        y = $(this).position().top
        width = $(this).width()
        height = $(this).height()
        link = ''
        widget_type = 1
        if $(this).hasClass("link")
          link =  pages_links[widget_id]
          widget_type = "link"
        if widget_id?
          # update widget
          short_widget_id = widget_id.substring(6)
          data = {
            'widget[id]' : short_widget_id,
            'widget[page_id]' : page_id,
            'widget[link]' : link ,
            'widget[description]' : '',
            'widget[name]' : '',
            'widget[x]' : x ,
            'widget[y]' : y ,
            'widget[width]' : width,
            'widget[height]' : height,
            'widget[widget_type]' : widget_type
          }
          console.log("page_id = " + page_id)
          $.ajax
            type: 'PUT'
            url: '/projects/' + project_id + '/pages/' + page_id + '/widgets/' + short_widget_id + ".json?format=json"
            data: data
            contentType: 'application/x-www-form-urlencoded'
            dataType: 'json'
            success: (msg) ->
            error: (e1) ->
              alert 'Error - ' + e1.toString()
              return
        else
          # create widget
          data = {
            'widget[page_id]' : page_id,
            'widget[link]' : link ,
            'widget[description]' : '',
            'widget[name]' : '',
            'widget[x]' : x ,
            'widget[y]' : y ,
            'widget[width]' : width,
            'widget[height]' : height,
            'widget[widget_type]' : widget_type
          }
          $.ajax
            type: 'POST'
            url: '/projects/' + project_id + '/pages/' + page_id + '/widgets.json?format=json'
            data: data
            contentType: 'application/x-www-form-urlencoded'
            dataType: 'json'
            success: (msg) ->
            error: (e1) ->
              alert 'Error - ' + e1.toString()
              return





  $('.right-bar .components .component').click ->
    if $('.mobile .page-img.current').length < 1
      return

    component = $(this).clone().appendTo('.mobile .page-img.current').css
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
    
  
  # add existing widgets
  Object.keys(gon.widgets_hash).forEach (page_id) ->
    widgets = gon.widgets_hash[page_id]
    for widget in widgets
      component = $('.component').clone()
      component.id = widget.id
      component.appendTo('.mobile .page-img[data-page-id=' + page_id + ']').uniqueId().css
        position: 'absolute'
        top: widget.y
        left: widget.x
        height: widget.height
        width: widget.width
      .draggable
        containment: '.mobile .page-img[data-page-id=' + page_id + ']'
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
          
      component.addClass(widget.widget_type)
      change_component component
