$ ->
  textarea = document.getElementById('snippet_body_view')
  unless textarea == null
    CodeMirror.fromTextArea textarea, {
      readOnly: true,
      showCursorWhenSelecting: false
    }
