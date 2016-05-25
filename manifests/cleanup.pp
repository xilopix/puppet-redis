# == Class: redis::install
#
# Uninstall redis-server instance which was installed by package manager
#
#
class redis::cleanup {
  service { 'redis-server':
    ensure => stopped,
    enable => false
  }

  file {[
    '/lib/systemd/system/redis-server.service',
    '/etc/init.d/redis-server',
    '/etc/redis/redis.conf',
    '/var/log/redis-server.log'
  ]:
    ensure => absent
  }
}
