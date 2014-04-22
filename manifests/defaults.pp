# This class enshured default configuration files and directories for Asterisk
# esista and are filled with good values

class asterisk::defaults {
  asterisk::context {'macro-dial-external':
    ensure => present,
    source => 'puppet:///modules/asterisk/macro-dial-external.conf',
  }

  package {'tmpreaper':
    ensure => present,
  }
  
  file { '/var/log/asterisk':
    ensure => 'directory',
    owner  => 'asterisk',
    group  => 'asterisk',
    mode   => '0775',
  }

  cron { 'remove call records older than 3 months':
    command => '/usr/sbin/tmpreaper 90d /var/spool/asterisk/monitor',
    user    => 'root',
    hour    => 3,
    minute  => 0,
    require => Package['tmpreaper'],
  }
}
