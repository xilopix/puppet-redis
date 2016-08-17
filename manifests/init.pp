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

  #
  # handle redis installation
  #
  include redis::install

  #
  # remove redis base server
  #
  include redis::cleanup

  #
  # install specific servers
  #
  create_resources('redis::server', $servers)
}

