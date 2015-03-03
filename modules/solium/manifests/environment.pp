class solium::environment {
  include git
  include iterm2::dev
  include iterm2::colors::solarized_dark
  include hipchat
  
  ## homebrew packages
  $homebrew_packages = [ "coreutils" ]
  package { $homebrew_packages: ensure => "installed" }

  ## Install Solium specific manifests
  include solium::bash-completion
  include solium::ant
  include solium::weblogic
  include solium::shareworks
  include solium::sqldeveloper
  # include solium::winfile
}
