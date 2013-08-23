define asterisk::context::manager (
  $ensure = 'present',

  $secret  = false,
  $name = 'manager',
  $permit = '127.0.0.1/255.255.255.255',
  $read = 'system,call',
  $write = 'system,call') {

  asterisk::dotd_file {"${name}.conf":
    ensure  => $ensure,
    dotd_dir => 'manager.conf.d',
    content => template('asterisk/context/manager.erb'),
    filename => "${name}.conf",
  }
}
