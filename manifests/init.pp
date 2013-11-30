# == Class: devpi
#
# Full description of class devpi here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class devpi (
  $devpi_dir = $devpi::params::devpi_owner,
  $devpi_virtualenv_dir = $devpi::params::devpi_vritualenv_dir,
  $devpi_owner = $devpi::params::devpi_owner,
  $devpi_serverdir = $devpi::params::devpi_serverdir,
  $service_name = $devpi::params::service_name,
  $devpi_port =$devpi::params::devpi_port,
) inherits devpi::params {

  # validate parameters here

  class { 'devpi::install': } ->
  class { 'devpi::config': } ~>
  class { 'devpi::service': } ->
  Class['devpi']
}
