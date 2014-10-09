# Oracle Java JDK
[![Build Status](https://travis-ci.org/Fleshgrinder/puppet-oracle-java-jdk.png?branch=master)](https://travis-ci.org/Fleshgrinder/puppet-oracle-java-jdk)

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

## Known Issues
* Extend unit tests to cover all possibilities
* Ubuntu installation needs testing
* JDK 6 and 8 needs testing

## License
> This is free and unencumbered software released into the public domain.
>
> For more information, please refer to <http://unlicense.org>

## Weblinks
* [WebUpd8 Launchpad](https://launchpad.net/~webupd8team/+archive/java)
