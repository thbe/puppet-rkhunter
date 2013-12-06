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

The rkhunter module prelace the standard mail server configuration with a light
wight sending only server. The behavior is the same as sendmail but without
the possibility to recieve mails from external systems.


##Setup

###What rkhunter affects

* rkhunter package.
* rkhunter configuration file.
* rkhunter alternative service configuration.

###Beginning with rkhunter

include '::rkhunter' is enough to get you up and running if the parameters point to
proper values.  If you wish to pass in parameters like which servers to use then you
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
  mailHub => 'mail.example.local',
  rootEmail => 'john.doe@example.local',
}
```


##Reference

###Classes

* rkhunter: Main class, includes all the rest.
* rkhunter::install: Handles the packages.
* rkhunter::config: Handles the configuration file.
* rkhunter::service: Handles the alternative service link.

###Parameters

The following parameters are available in the rkhunter module

####`defaultMta`

Replace the default MTA with rkhunter if set to rkhunter.

####`rootEmail`

Specify which Email address should recieve all mails from root.

####`mailHub`

Define the mail server which should deliver all mails.

####`revaliases`

Array to define the reverse aliases.


##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module has been tested on:

* RedHat Enterprise Linux 5/6
* Scientific Linux 5/6

Testing on other platforms has been light and cannot be guaranteed. 


##Development

If you like to add or improve this module, feel free to fork the module and send
me a merge request with the modification.
