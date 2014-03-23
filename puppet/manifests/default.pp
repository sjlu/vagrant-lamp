class bootstrap {
  group { 'puppet':
    ensure => 'present'
  }

  exec { "apt-get update":
    command => "/usr/bin/apt-get update"
  }
}

class tools {
  $packages = [
    "vim"
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}

class apache {
  package { "apache2":
    ensure => present,
    require => Exec["apt-get update"]
  }
}

class php {
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php5-dev",
    "php5-gd",
    "php5-suhosin",
    "php5-json",
    "php5-mcrypt",
    "libapache2-mod-php5"
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}

class mysql {
  package { "mysql-server":
    ensure => present,
    require => Exec["apt-get update"]
  }
}

include bootstrap
include apache
include mysql
include php
