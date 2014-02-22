name    'Fleshgrinder-oracle_java_jdk'
version '0.1.0'
source 'https://github.com/Fleshgrinder/puppet-oracle-java-jdk.git'
author 'Richard Fussenegger <richard@fussenegger.info>'
license 'Public Domain'
summary 'WebUpd8 Oracle Java (JDK) 6 / 7 / 8 Installer PPA module for Puppet.'
description '# Oracle Java JDK
Oracle Java JDK installer (automatically downloads and installs Oracle JDK6 / JDK7 / JDK8). There are no actual Java
files in this repository.

## Usage
If you want the latest version for your system simply include the module.

```puppet
include oracle_java_jdk
```

Of course you can easily change the version that you want to use.

```puppet
class { "oracle_java_jdk":
    version => "8",
    release => "precise",
}
```

### Parameters
* `version` set the JDK version to install, defaults to `7`
* `release` set the Ubuntu release of the ppa/apt source, defaults to `trusty`

## License
This is free and unencumbered software released into the public domain.

## Weblinks
* [WebUpd8 Launchpad](https://launchpad.net/~webupd8team/+archive/java)
'
project_page 'https://github.com/Fleshgrinder/puppet-oracle-java-jdk'

## Add dependencies, if any:
# dependency 'username/name', '>= 1.2.0'
dependency 'apt', '>= 1.1.0'
