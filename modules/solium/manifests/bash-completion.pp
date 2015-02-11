include homebrew

class solium::bash-completion {

  package { 'bash-completion':
    ensure      => latest
  }

  notify { "Installed - Bash-completion":
    require     => Package['bash-completion']
  }
}
