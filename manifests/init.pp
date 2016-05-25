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

<<<<<<< 77f4298b5306fec355de99b92359c8d433a7568a
  #
  # handle redis installation
  #
  include redis::install
=======
  file {[
    '/etc/redis',
    $redis_dir
  ]:
    ensure => directory,
  }
>>>>>>> [redis] - Cleanup redis-server installation

  #
  # remove redis base server
  #
  include redis::cleanup

  #
  # install specific servers
  #
  create_resources('redis::server', $servers)
}

