# == Class devpi::params
#
# This class is meant to be called from devpi
# It sets variables according to platform
#
class devpi::params {
  $devpi_dir = '/opt/devpi'
  $devpi_virtualenv_dir = '/opt/devpi'
  $devpi_owner = 'ops'
  $devpi_serverdir = '/opt/devpi/data'
  $service_name = 'devpi'
  $devpi_port = 3141
}
