class apache::config inherits apache {

  file {'$conf_file':
    ensure  => file,
    path    => "${apache_dir}/${$conf_file}",
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package [$package_name],
    notify  => Service[$service_name],
    source  => 'puppet:///modules/apache/$conf_file',
  }

