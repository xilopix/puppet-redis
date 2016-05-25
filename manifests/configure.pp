# == Class: redis::configure
#
# Uninstall redis-server instance which was installed by package manager
#
#
class redis::configure inherits redis {
  # faut ajouter vm.overcommit_memory = 1 dans /etc/sysctl.conf et lancer la commande sysctl vm.overcommit_memory=1
  # echo never > /sys/kernel/mm/transparent_hugepage/enabled
  # Jérémie Bourseau: l'ajouter dans /etc/rc.local
  # Jérémie Bourseau: et restart redis après tout ça

  augeas { "sysctl":
    context => "/files/etc/sysctl.conf",
    changes => [
      "set vm.overcommit_memory 1"
    ],
  }

  exec { 'sysctl_overcommit_memory':
    command => 'sysctl vm.overcommit_memory=1',
    path    => ['/sbin'],
  }

  exec { 'enable_transparent_hugepages':
    command => 'echo never > /sys/kernel/mm/transparent_hugepage/enabled',
    path    => ['/bin'],
  }

  concat { '/etc/rc.local':
    ensure => present,
  }

  concat::fragment { '00_rc.local_header':
    target  => '/etc/rc.local',
    content => template('redis/etc/rc.local/header.erb'),
    order   => '01'
  }

  concat::fragment { '05_rc.local_custom':
    target  => '/etc/rc.local',
    content => template('redis/etc/rc.local/enable_hugepage.erb'),
    order   => '05'
  }

  concat::fragment { '99_rc.local_footer':
    target  => '/etc/rc.local',
    content => template('redis/etc/rc.local/footer.erb'),
    order   => '99'
  }
}
