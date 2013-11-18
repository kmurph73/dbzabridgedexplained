$ ->
  modal = $('#modal')
  modal.on 'hide', -> modal.find('.modal-body').html('')

  $(document).on 'click', '.time', (e) ->
    e.preventDefault()
    e.stopPropagation()
    target = $(e.currentTarget)
    youtubeid = target.closest('#episode').attr('data-youtube-id')
    time = getTime(target)
    src = "http://www.youtube.com/embed/#{youtubeid}?autoplay=1#t=#{time}"
    html = "
       <iframe width='560' height='315' src='#{src}' frameborder='0' allowfullscreen></iframe>
    "
    modal.find('.modal-body').html html
    modal.modal().modal('show')

  getTime = (target) ->
    [minutes,seconds] = target.text().split(":")
    parseInt(minutes) * 60 + parseInt(seconds)
