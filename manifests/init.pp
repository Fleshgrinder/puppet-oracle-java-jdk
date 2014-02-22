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
#     The PPA release channel, have a look at [WebUpd8's Launchpad repository]
#     (https://launchpad.net/~webupd8team/+archive/java) for supported releases.
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
class oracle_java_jdk ($version = '7', $release = 'trusty') {

  # Make sure that the apt module is available and included.
  if !defined(Class['apt']) {
    fail('Oracle Java JDK module requires the Puppetlabs apt module')
  }

  # DRY!
  $error = ' not supported. Pull requests are very welcome.'

  # Make sure that we are installing on a supported operating system.
  case $::osfamily {
    'debian': {}
    default: {
      fail("${::operatingsystem}${error}")
    }
  }

  # Make sure the desired version is available.
  case $version {
    '6', '7', '8': {
      debug("Installing Java JDK ${version}")
    }
    default: {
      fail("${version}${error}")
    }
  }

  # Make sure the desired release is available.
  case $release {
    'trusty', 'saucy', 'raring', 'quantal', 'precise', 'oneiric', 'lucid': {
      debug("Installing Java JDK from Ubuntu ${release} source")
    }
    default: {
      fail("${release}${error}")
    }
  }

  # Make sure the correct preseed file is available.
  file{ 'preseed':
    ensure => 'file',
    path   => '/tmp/puppet.oracle_java_jdk.preseed',
    source => "puppet:///modules/oracle_java_jdk/java${version}.preseed",
  }

  # Install package source depending on distro.
  case $::lsbdistid {
    'debian': {
      apt::source{ 'oracle_java_jdk':
        location   => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
        release    => 'trusty',
        repos      => 'main',
        key        => 'EEA14886',
        key_server => 'keyserver.ubuntu.com',
      }
      $require = Apt::Source['oracle_java_jdk']
    }
    'ubuntu': {
      apt::ppa{ 'ppa:webupd8team/java': }
      $require = Apt::Ppa['ppa:webupd8team/java']
    }
    default: {
      fail("${::lsbdistid}${error}")
    }
  }

  # Make sure the Oracle Java JDK installer is available.
  package { 'oracle_java_jdk':
    ensure       => 'latest',
    name         => "oracle-java${version}-installer",
    provider     => 'apt',
    responsefile => 'preseed',
    require      => [ $require, File['preseed'] ],
  }

  # Make sure the desired Java JDK version is set as global default.
  package { 'oracle_java_jdk_installer':
    ensure   => 'latest',
    name     => "oracle-java${version}-set-default",
    provider => 'apt',
    require  => Package['oracle_java_jdk']
  }

}
