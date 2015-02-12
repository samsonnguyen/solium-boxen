include homebrew

class solium::bash-completion {

  package { 'bash-completion':
    ensure      => latest
  }
}
