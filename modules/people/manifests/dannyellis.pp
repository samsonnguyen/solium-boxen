class people::dannyellis {
  include evernote
  include sublime_text

  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

}
