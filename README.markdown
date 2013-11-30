#devpi

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with Devpi](#setup)
    * [What [Devpi] affects](#what-devpi-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with Devpi](#beginning-with-Devpi)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

##Overview

Install a basic devpi (http://doc.devpi.net/) system. The setup will be behind an nginx webserver.

##Module Description

Everything needed to run devpi (http://doc.devpi.net) systemk

##Setup

###What devpi affects

* python, python-dev, python-pip and python-virtualenv will be installed
* A new virtualenv will be created
* devpi will be installed into $devpi::params::devpi_dir (default: /opt/devpi)

###Setup Requirements

dependency 'puppetlabs/stdlib'
dependency 'stankevich/python'
  
###Beginning with devpi

The very basic steps needed for a user to get the module up and running. 

##Usage

Use all the defaults...
```
class {'devpi':
}
```

Customize the setup...
```
class {'devpi':
  $devpi_dir = "/opt/devpi/",
  $devpi_virtualenv_dir = "/opt/devpi/",
  $devpi_serverdir = "/opt/devpi/data/"
}
```


##Limitations

* This has only been tested on ubuntu 12.04.
* This will not work on redhat... yet