App.messages = App.cable.subscriptions.create {
    channel: 'MessagesChannel'
  },
  connected: ->

  disconnected: ->

  received: (data) ->
    unless data.message.blank?
      if $('.select2-container').size() > 1
        $('.select2-container').last().remove()

      $('#message_title').val('')
      $('#message_recipient_ids').select2().val(null).trigger('change');
      $('#message_content').val('')
      $('#new_message').collapse('hide')

      recipient_id = $('#messages .list-group').attr('id').match(/\d+/).toString()

      if recipient_id in data.recipients
        $('#messages .list-group').prepend data.message
        $('#messages .list-group-item').first().addClass('list-group-item-info')

