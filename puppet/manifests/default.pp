class apache {
  package { "apache2"
    ensure => present
  }
}

class php {
  package { "php"
    ensure => present
  }
}

class mysql {
  package { "mysql-server"
    ensure => present
  }
}

include apache
include php
include mysql
