class solium::environment {
  include git
  include iterm2::dev
  include iterm2::colors::solarized_dark
  include hipchat

  ## http://stackoverflow.com/questions/25790909/how-do-i-configure-boxen-and-rbenv-with-rubymine
  exec { 'link_rbenv':
    command => "ln -s /opt/boxen/rbenv/ /Users/${::boxen_user}/.rbenv",
    unless => "test -d /Users/${::boxen_user}/.rbenv"
  }

  ## homebrew packages
  $homebrew_packages = [ "coreutils","renameutils" ]
  package { $homebrew_packages: ensure => "installed" }

  ## Install Solium specific manifests
  include solium::bash-completion
  include ant
  include jenv
  include java6
  include java7
  include solium::weblogic
  include solium::shareworks
  include solium::sqldeveloper
  # include solium::winfile
}
