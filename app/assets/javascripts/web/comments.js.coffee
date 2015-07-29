$ ->
  comment_template = (comment) ->
    "<div class='panel panel-default'>
       <div class='panel-heading'>
         #{comment.login}
       </div>
       <div class='panel-body'>
         #{comment.body}
       </div>
    </div>"

  append_comment = (comment) ->
    $comment_form = $('.comment-form').last()
    $comment_form.before comment_template comment
    $('#new_comment #comment_body').val ''
    return

  $('.new_comment').on('ajax:success', (xhr, data) ->
    append_comment data
    $('')
    return
  ).on 'ajax:error', (xhr, data) ->
    alert 'error'
    return
  return
