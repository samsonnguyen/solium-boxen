class solium::environment {
  include git
  include iterm2::dev
  include iterm2::colors::solarized_dark
  include hipchat

  ## Install Solium specific manifests
  include solium::bash-completion
  include solium::ant
  # include solium::winfile
}
