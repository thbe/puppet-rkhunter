# rkhunter

[![Build Status](https://travis-ci.org/thbe/puppet-rkhunter.png?branch=master)](https://travis-ci.org/thbe/puppet-rkhunter)
[![Puppet Forge](https://img.shields.io/puppetforge/v/thbe/rkhunter.svg)](https://forge.puppetlabs.com/thbe/rkhunter)
[![Coverage Status](https://coveralls.io/repos/thbe/puppet-rkhunter/badge.svg?branch=master&service=github)](https://coveralls.io/github/thbe/puppet-rkhunter?branch=master)

#### Table of Contents

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


## Overview

The rkhunter module provides the installation procedure for Rkhunter including the setup of
the initial rkhunter database.

## Module Description

The rkhunter module provides a security feature that scan the local system for
rootkit fragments and warn you, if detetcted.


## Setup

### What rkhunter affects

* rkhunter package.
* rkhunter configuration file.
* rkhunter database.

### Setup requirements

You need to activate the EPEL repository before you can setup the SSMTP instance.
If you use a rpm based system from the RedHat family you can use my yum module (thbe-yum):

```puppet
class { "::yum": repo_epel => true }
```

### Beginning with rkhunter

include '::rkhunter' is enough to get you up and running if the parameters point to
proper values. If you wish to pass in parameters like which servers to use then you
can use:

```puppet
class { '::rkhunter':
  root_email => 'john.doe@example.local',
}
```

## Usage

All interaction with the rkhunter module can be done through the main rkhunter class.
This means you can simply toggle the options in the rkhunter main class to get the full
functionality.

### I just want rkhunter, what's the minimum I need?

```puppet
include '::rkhunter'
```

### I just want to route all mails to central mail gateway, nothing else.

```puppet
class { '::rkhunter':
  root_email => 'john.doe@example.local',
  tftp => true,
}
```

## Reference

See [https://github.com/thbe/puppet-rkhunter/REFERENCE.md](https://github.com/thbe/puppet-rkhunter/REFERENCE.md)

## Limitations

This module has been built on and tested against Puppet 5 and higher.

The module has been tested on:

* CentOS 7
* Debian 9
* Ubuntu 18.04

Testing on other platforms has been light and cannot be guaranteed.

## Development

If you like to add or improve this module, feel free to fork the module and send
me a merge request with the modification.

### Contributors

The list of contributors can be found at: [https://github.com/thbe/puppet-rkhunter/graphs/contributors](https://github.com/thbe/puppet-rkhunter/graphs/contributors)
