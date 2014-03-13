class packages {
  exec { "apt-get update":
    command => "/usr/bin/apt-get update"
  }

  $packages = [
    'apache2',
    'php5',
    'mysql-server'
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}

include packages
