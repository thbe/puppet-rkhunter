#rkhunter

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with rkhunter](#setup)
    * [What rkhunter affects](#what-rkhunter-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with rkhunter](#beginning-with-rkhunter)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)


##Overview

The rkhunter module provides the installation procedure for Rkhunter including the setup of
the initial rkhunter database.

##Module Description

The rkhunter module provides a security feature that scan the local system for
rootkit fragments and warn you, if detetcted.


##Setup

###What rkhunter affects

* rkhunter package.
* rkhunter configuration file.
* rkhunter database.

###Beginning with rkhunter

include '::rkhunter' is enough to get you up and running if the parameters point to
proper values. If you wish to pass in parameters like which servers to use then you
can use:

```puppet
class { '::rkhunter':
  rootEmail => 'john.doe@example.local',
}
```

##Usage

All interaction with the rkhunter module can be done through the main rkhunter class.
This means you can simply toggle the options in the rkhunter main class to get the full
functionality.

###I just want rkhunter, what's the minimum I need?

```puppet
include '::rkhunter'
```

###I just want to route all mails to central mail gateway, nothing else.

```puppet
class { '::rkhunter':
  rootEmail => 'john.doe@example.local',
  tftp => true,
}
```


##Reference

###Classes

* rkhunter: Main class, includes all the rest.
* rkhunter::install: Handles the packages.
* rkhunter::config: Handles the configuration file.
* rkhunter::service: Handles the database rebuild.

###Parameters

The following parameters are available in the rkhunter module

####`rootEmail`

Set the root email adress that get notifications if events occur.

####`remoteSyslog`
Set to true if remote syslog is used

####`tftp`

Ignore check errors forced by tftp.

####`check_mk`

Ignore check errors forced by check_mk.

####`oracleXE`

Ignore check errors forced by Oracle XE.

####`sapDAA`

Ignore check errors forced by SAP DAA.

####`sapICM`

Ignore check errors forced by SAP ICM.

####`sshd_root`

Surpress warning if root login is permit.
Should be the same as PermitRootLogin in sshd_config

####`warn_mail`

et the user email adress that get notifications if events has warnings.

##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module has been tested on:

* RedHat Enterprise Linux 5/6
* Scientific Linux 5/6

Testing on other platforms has been light and cannot be guaranteed.


##Development

If you like to add or improve this module, feel free to fork the module and send
me a merge request with the modification.

###Contributors

The list of contributors can be found at: [https://github.com/thbe/puppet-rkhunter/graphs/contributors](https://github.com/thbe/puppet-rkhunter/graphs/contributors)
