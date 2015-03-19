class solium::weblogic ($version,$url,$install_dir) {
  include wget

  exec { 'retrieve_weblogic':
    command => "wget ${url} -O /tmp/wls_${version}.zip",
    creates => "/tmp/wls_${version}.zip",
    require => Package['wget'],
    unless => "test -d /tmp/wls_${version}.zip",
  }
  
  file { "${install_dir}${version}":
    ensure => "directory",
    require => Exec['retrieve_weblogic']
  }

  exec { 'install_weblogic' :
    command => "unzip -o /tmp/wls_${version}.zip -d ${install_dir}${version}",
    require => Exec["retrieve_weblogic"],
    onlyif => "test -d ${install_dir}${version}",
  }

  exec { 'create_symlink' :
    command => "ln -sfn ${install_dir}${version} ${install_dir}/10.3.6",
    require => Exec['install_weblogic']
  } 

}
