define asterisk::context::sip (
  $ensure        = 'present',
  $username      = false,
  $defaultuser   = true,
  $template_name = false,
  $secret        = false,
  $context       = false,
  $account_type  = 'friend',
  $canreinvite   = 'no',
  $host          = 'dynamic',
  $insecure      = 'no',
  $language      = 'en',
  $nat           = false,
  $qualify       = no,
  $vmexten       = false,
  $callerid      = false,
  $calllimit     = false,
  $callgroup     = false,
  $mailbox       = false,
  $md5secret     = false,
  $pickupgroup   = false,
  $fromdomain    = false,
  $fromuser      = false,
  $outboundproxy = false,
  $t38pt_udptl   = false,
  $defaultexpiry = false,
  $registertimeout = false,
  $disallow      = [],
  $allow         = [],
  $dtmfmode      = false) {
  require asterisk::sip

  asterisk::dotd_file {"sip_${name}.conf":
    ensure   => $ensure,
    dotd_dir => 'sip.conf.d',
    content  => template('asterisk/context/sip.erb'),
    filename => "${name}.conf",
  }
}
