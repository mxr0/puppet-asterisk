# TODO: document
define asterisk::context::extensions (
  $ensure  = 'present',
  $source  = undef,
  $content = undef,
  $exten   = undef,
  $same    = undef,
  $comment = undef,
) {
  require asterisk::extensions

  if $source {
    asterisk::dotd_file { "${name}.conf":
      ensure   => $ensure,
      dotd_dir => 'extensions.conf.d',
      source   => $source,
      notify   => Service['asterisk'],
    }
  } elsif $content {
    asterisk::dotd_file { "${name}.conf":
      ensure   => $ensure,
      dotd_dir => 'extensions.conf.d',
      content  => "[${name}]\n${content}",
      notify   => Service['asterisk'],
    }
  } elsif $exten {
    asterisk::dotd_file { "${name}.conf":
      ensure   => $ensure,
      dotd_dir => 'extensions.conf.d',
      content  => template('asterisk/context/extension.erb'),
      notify   => Service['asterisk'],
    }
  } else {
    fail('source or content parameter is required')
  }
}
