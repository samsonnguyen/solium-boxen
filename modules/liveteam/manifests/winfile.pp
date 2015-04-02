class solium::winfile {
  exec { "defaults write com.apple.desktopservices DSDontWriteNetworkStores true": }

  $home     = "/Users/${::boxen_user}"

  file { "${home}/dev/Development":
    ensure  => directory,
    before  => Mount["${home}/dev/Development"]
  }

  mount { "${home}/dev/Development":
    device  => "//172.16.5.21/Development",
    options => "soft",
    fstype  => "smbfs",
    ensure  => "mounted"
  }
}
