$ ->
  textarea = document.getElementById('snippet_body_view')
  unless textarea == null
    CodeMirror.fromTextArea textarea, {
      readOnly: true,
      showCursorWhenSelecting: false
    }
  $textareas = $('.snippet_body_view')
  $textareas.each ->
    CodeMirror.fromTextArea this, {
      readOnly: true,
      showCursorWhenSelecting: false
    }
