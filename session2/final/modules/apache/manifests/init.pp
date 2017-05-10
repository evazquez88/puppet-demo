# Module that installs and configures Apache 2
class apache {


# TO DO: Hacer clase de parametros
  case $operatingsystem {
  	centos, redhat: {
    $apache_dir      = '/etc/httpd'
    $apache_docroot  = '/var/www/html'
    $service_name    = 'httpd'
    $conf_file       = 'httpd.conf'
    $package_name    = 'httpd'
  }
  
	debian, ubuntu: {
   $apache_dir      = '/etc/apache2'
   apache_docroot   = '/var/www'
   $service_name    = 'apache2'
   $conf_file       = 'apache2.conf'
   $package_name    = 'apache2' 

 }
 }

 include apache::install
 include apache::service
 include apache::config

}   
