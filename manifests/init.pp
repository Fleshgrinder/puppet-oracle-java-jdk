# Class: oracle_java_jdk
#
# This module manages Oracle Java JDK 6/7/8 Installer
#
# Parameters:
#   [*version*]
#     The version to install, either 6, 7, or 8.
#     Default: 7
#
#   [*release*]
#     The PPA release channel, have a look at https://launchpad.net/~webupd8team/+archive/java for supported releases.
#     Default: trusty
#
# Actions:
#   Adds WebUpd8 PPA to apt sources (incl. key) and installs Oracle Java JDK.
#
# Requires: see Modulefile
#
# Sample Usage:
#   class { "oracle_java_jdk":
#     version => "7",
#     release => "precise",
#   }
#
class oracle_java_jdk (
  $version = "7",
  $release = "precise"
) {

  if !defined(Class["apt"]) {
    class { "apt": }
  }

  $error = " not supported. Pull requests are very welcome."

  # Validation

  case $::osfamily {
    "Debian": {}
    default: {
      fail("${::operatingsystem}${error}")
    }
  }

  case $version {
    "6", "7", "8": {}
    default: {
      fail("${version}${error}")
    }
  }
  
  case $release {
    "trusty", "saucy", "raring", "quantal", "precise", "oneiric", "lucid": {}
    default: {
      fail("${release}${error}")
    }
  }
  
  # Source

  case $::lsbdistid {
    "debian": {
      apt::source{ "oracle_java":
        location   => "http://ppa.launchpad.net/webupd8team/java/ubuntu",
        release    => "trusty",
        repos      => "main",
        key        => "EEA14886",
        key_server => "keyserver.ubuntu.com",
      }
    }
    "ubuntu": {
      apt::ppa{ "ppa:webupd8team/java": }
    }
    default: {
      fail("${::lsbdistid}${error}")
    }
  }

  # Install

  Package { ensure => "latest", provider => "apt" }

  package { "oracle-java${version}-installer":
    responsefile => "puppet:///modules/oracle_java_jdk_ppa/preseed",
    require      => "puppet:///modules/oracle_java_jdk_ppa/preseed",
  }

  package { "oracle-java{$version}-set-default": }

}
