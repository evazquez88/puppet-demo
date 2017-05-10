class apache::install inherits apache {
  package {$package_name:
    ensure => installed,
  }
}

