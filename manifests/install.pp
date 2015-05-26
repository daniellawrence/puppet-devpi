# == Class devpi::intall
#
class devpi::install {
  include devpi::params

  # If we are going to use this module to manage nginx.
  # Then setup nginx and the upstream into the devpi service
  if ($devpi::params::manage_nginx == true) {

    class {'nginx':
    }

    nginx::resource::vhost { "pypi.${::domain}":
      ensure   => present,
      www_root => $devpi::params::devpi_serverdir,
      proxy    => 'http://devpi_app',
    }

    nginx::resource::upstream { 'devpi_app':
      ensure  => present,
      members => [
                  "localhost:${devpi::params::devpi_port}",
                  ],
    }
  }

  # Setup the python virtualenv for devpi.
  python::virtualenv { $devpi::params::devpi_virtualenv_dir:
    ensure       => present,
    version      => 'system',
    systempkgs   => false,
    distribute   => false,
    owner        => $devpi::params::devpi_owner,
    require      => File[$devpi::params::devpi_dir];
  }

  # Install devpi into the virtualenv
  python::pip { 'devpi':
    virtualenv   => $devpi::params::devpi_virtualenv_dir,
    owner        => $devpi::params::devpi_owner;
  }

  # Setup the directories for the virtualenv
  file { $devpi::params::devpi_dir:
    ensure => directory,
    owner  => $devpi::params::devpi_owner;
  }

  # Make sure we have a datadir for devpi
  file { $devpi::params::devpi_serverdir:
    ensure  => directory,
    owner   => $devpi::params::devpi_owner,
    require => File[$devpi::params::devpi_dir];
  }

  # Configure upstart, and setup the symlinks
  file {'/etc/init/devpi.conf':
    ensure  => file,
    content => template('devpi/upstart.conf'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644';
  }
  file {'/etc/init.d/devpi':
    ensure  => 'symlink',
    target  => '/lib/init/upstart-job',
    require => File['/etc/init/devpi.conf'];
  }

}
