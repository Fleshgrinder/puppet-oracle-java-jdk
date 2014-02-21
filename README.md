# Oracle Java JDK

Oracle Java JDK installer (automatically downloads and installs Oracle JDK6 / JDK7 / JDK8). There are no actual Java files in this repository.

## Usage

If you want the latest version for your system simply include the module.

```
include oracle_java_jdk
```

Of course you can easily change the version that you want to use.

```
class { "oracle_java_jdk":
    version => "8",
    release => "precise",
}
```

### Parameters

* `version` set the JDK version to install, defaults to `7`
* `release` set the Ubuntut release of the apt source, defaults to `trusty`
'
project_page 'https://github.com/Fleshgrinder/puppet-oracle-java-jdk

## Weblinks

* [WebUpd8 PPA](https://launchpad.net/~webupd8team/+archive/java)
