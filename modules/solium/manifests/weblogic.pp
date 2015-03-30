class solium::weblogic ($version,$url,$install_dir) {
  include wget

  notify { 'Downloading Weblogic. This may take a while':
    before => Exec['retrieve_weblogic'],
  }

  exec { 'retrieve_weblogic':
    command => "wget ${url} -O /tmp/wls_${version}.zip",
    creates => "/tmp/wls_${version}.zip",
    require => Package['wget'],
    unless  => "test -d /tmp/wls_${version}.zip",
    timeout => 3600,
  }
  
  file { ["/opt/java","/opt/java/oracle/","/opt/java/oracle/weblogic/","${install_dir}${version}"]:
    ensure  => "directory",
    owner   => "${::boxen_user}",
    group   => "staff",
    mode    => 0775,
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
