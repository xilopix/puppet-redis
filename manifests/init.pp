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
  $redis_dir = $::redis::params::redis_dir,
  # START Hiera Lookups ###
  $servers = {},
  ### END Hiera Lookups ###
) inherits redis::params {
  #
  # handle redis installation
  #
  include redis::install

  #
  # install specific servers
  #
  create_resources('redis::server', $servers)
}

