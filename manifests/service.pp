# == Class devpi::service
#
# This class is meant to be called from devpi
# It ensure the service is running
#
class devpi::service {
  include devpi::params

  service { $devpi::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}
