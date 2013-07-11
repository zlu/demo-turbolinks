handle_complete = ->
  $('input').click ->
    cb = $(this)
    $.ajax({
      method: 'patch',
      url: 'tasks/' + cb.attr('id'),
      data: {complete: cb.is(':checked')}
    }).done (data)  ->
        t = $('span[id="' + data.id + '"]')
        if (data.complete)
          t.css('text-decoration', 'line-through')
        else
          t.css('text-decoration', 'none')

$(document).ready(handle_complete)
$(document).on('page:load', handle_complete)