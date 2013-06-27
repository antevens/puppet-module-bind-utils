# == Class: jalli-bind-utils
#
# Setup bind-utils on redhat based systems (Centos, Fedora, RHEL, etc) or dnsutils on debian based systems (Ubuntu, Mint, Debian, etc)
#
# === Authors
#
# Author Name <jarl.stefansson@gmail.com>
#
# === Copyright
#
# Copyright 2013 Jarl Stefansson, unless otherwise noted.
#
class jalli-bind-utils {
  case $osfamily {
    debian: {
      $package_name = 'dnsutils'
    }
    redhat: {
      $package_name = 'bind-utils'
    }
    default: {
      case $operatingsystem {
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }

  package { $package_name:
    ensure => installed,
  }
}
