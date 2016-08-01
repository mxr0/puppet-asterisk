# This Class descripes requirments for the asterisk dahdi module to work
class asterisk::unimrcp {

    package { 'astunimrcp':
            ensure => '1.0.0-0RISE1',
            }

}
