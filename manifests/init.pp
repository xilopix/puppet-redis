# == Class: redis
#
# Empty pseudo class, Not used.
#
# === Parameters
#
# [*servers*]
# Hash for servers instantiation from hiera
#
class redis (
  # START Hiera Lookups ###
  $servers = {},
  ### END Hiera Lookups ###
) inherits redis::params {

  file { '/etc/redis':
    ensure => directory,
  }

  create_resources('redis::server', $servers)

}
