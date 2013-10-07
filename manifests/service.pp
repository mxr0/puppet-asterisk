class asterisk::service (
  $enable = $asterisk::params::enable,
) inherits asterisk::params{

  service {'asterisk':
    enable  => $enable,
    ensure  => running,
    require => Package['asterisk'],
  }

}
