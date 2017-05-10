# Module that installs and configures Apache 2
class apache {

  $apache_dir      = '/etc/httpd'
  $apache_docroot  = '/var/www'

  case $operatingsystem {
  	centos, redhat: {
    $service_name = 'httpd'
    $conf_file    = 'httpd.conf'
    $package_name = 'httpd'
  }
  
	debian, ubuntu: {
   $service_name = 'apache2'
   $conf_file    = 'apache2.conf'
   $package_name = 'apache2' 

 }
 }

  package {$package_name:
   ensure => installed,
  }

  file {'$conf_file':
    ensure  => file,
    path    => "${apache_dir}/${$conf_file}",
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package[$package_name],
    notify  => Service[$service_name],
    source  => 'puppet:///modules/apache/$conf_file',
  }

  service {$service_name:
  	ensure     => running,
  	enable     => true,
  	hasrestart => true,
  	hasstatus  => true,
  	subscribe  => File[$conf_file],
}



 #include apache::install
 #include apache::service
 #include apache::config



}   
