class solium::sqldeveloper {

  $version = "4.0.3.16.84"

  package { 'sqldeveloper':
    ensure   => present,
    flavor   => 'zip',
    provider => 'compressed_app',
    source   => "https://sharkcage.solium.com/vagrant-files/sqldeveloper-${version}-macosx.app.zip"
  }

  package { "tnsnames-0.0.1.pkg":
    ensure => installed,
    provider => pkgdmg,
    source => "https://sharkcage.solium.com/vagrant-files/tnsnames-0.0.1.pkg"
  }    
}
