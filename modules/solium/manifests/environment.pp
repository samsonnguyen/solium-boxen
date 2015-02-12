class solium::environment {
  ## Install Solium specific manifests
  include solium::bash-completion

  include git
  include iterm2::dev
  include iterm2::colors::solarized_dark
  include solium::ant
}
