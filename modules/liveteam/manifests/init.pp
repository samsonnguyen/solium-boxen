class liveteam {

  ## http://stackoverflow.com/questions/25790909/how-do-i-configure-boxen-and-rbenv-with-rubymine
  exec { 'link_rbenv':
    command => "ln -s /opt/boxen/rbenv/ /Users/${::boxen_user}/.rbenv",
    unless => "test -d /Users/${::boxen_user}/.rbenv"
  }

  ## Install Solium specific manifests
  include solium
}
