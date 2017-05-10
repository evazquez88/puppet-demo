class apache::service inherits apache {
  service {$service_name:
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  require    => File[$conf_file],
  subscribe  => File[$conf_file],
}
}

