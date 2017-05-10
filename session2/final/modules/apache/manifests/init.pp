# Module that installs and configures Apache 2
class apache {

  $apache_dir      = '/etc/httpd'
  $apache_docroot  = '/var/www'
  $package_name    = 'apache2'

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
 
 include apache::install
 include apache::service
 include apache::config
}   
