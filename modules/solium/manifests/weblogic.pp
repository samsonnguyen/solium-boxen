class solium::weblogic {
  include wget

  $weblogic_version    = "10.3.6.0.6"
  $weblogic_install_dir = "/opt/java/oracle/weblogic/"
  $weblogic_url        = "https://sharkcage.solium.com/vagrant-files/wls1036_dev_w_nativeio.zip"

  exec { 'retrieve_weblogic':
    command => "wget ${weblogic_url} -O /tmp/wls_${weblogic_version}.zip",
    creates => "/tmp/wls_${weblogic_version}.zip",
    require => Package['wget'],
    unless => "test -d /tmp/wls_${weblogic_version}.zip",
  }
  
  file { "${weblogic_install_dir}${weblogic_version}":
    ensure => "directory",
    require => Exec['retrieve_weblogic']
  }

  exec { 'install_weblogic' :
    command => "unzip -o /tmp/wls_${weblogic_version}.zip -d ${weblogic_install_dir}${weblogic_version}",
    require => Exec["retrieve_weblogic"],
    onlyif => "test -d ${weblogic_install_dir}${weblogic_version}",
  }

  exec { 'create_symlink' :
    command => "ln -sfn ${weblogic_install_dir}${weblogic_version} ${weblogic_install_dir}/10.3.6",
    require => Exec['install_weblogic']
  } 

}
