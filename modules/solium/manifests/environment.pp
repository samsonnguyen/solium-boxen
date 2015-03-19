class solium::environment {
  include git
  include iterm2::dev
  include iterm2::colors::solarized_dark
  include hipchat

  ## http://stackoverflow.com/questions/25790909/how-do-i-configure-boxen-and-rbenv-with-rubymine
  exec { 'link_rbenv':
    command => 'ln -s /opt/boxen/rbenv/ ~/.rbenv'
  }

  ## homebrew packages
  $homebrew_packages = [ "coreutils","renameutils" ]
  package { $homebrew_packages: ensure => "installed" }

  ## Install Solium specific manifests
  include solium::bash-completion
  include solium::ant
  include solium::weblogic
  include solium::shareworks
  include solium::sqldeveloper
  # include solium::winfile
}
