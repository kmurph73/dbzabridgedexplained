$ ->
  $(document).on 'click', '.time', (e) ->
    e.preventDefault()
    e.stopPropagation()
    debugger
    $('#myModal').modal('show').show()
